using api.DBContext;
using api.Interfaces;
using api.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using MySql.Data.MySqlClient;
using System.Numerics;
using System.Security.Claims;

namespace api.Controllers;

public class BaseController : Controller
{
    private readonly IDBConnect _dBConnect;
    protected MySqlTransaction _transaction;
    private MySqlConnection _conn;
    protected Account _account;

    public BaseController(IDBConnect dBConnect)
    {
        _dBConnect = dBConnect;
        _account = new();
    }

    protected async Task<int> Insert(string query, List<DBParameters> dBParameters)
    {
        _conn ??= new MySqlConnection(_dBConnect.connectionString);

        if (_conn.State != System.Data.ConnectionState.Open)
            await _conn.OpenAsync();

        _transaction = await _conn.BeginTransactionAsync();

        return await _dBConnect.InsertAsync(_conn, query, dBParameters, _transaction);
    }

    protected async Task<bool> Scalar(string query, List<DBParameters> dBParameters)
    {
        _conn ??= new MySqlConnection(_dBConnect.connectionString);

        if (_conn.State != System.Data.ConnectionState.Open)
            await _conn.OpenAsync();

        return await _dBConnect.ScalarAsync(_conn, query, dBParameters);
    }

    protected async Task<List<dynamic>> Select(string query, List<DBParameters> dBParameters, dynamic entity)
    {
        using var conn = new MySqlConnection(_dBConnect.connectionString);

        if (conn.State != System.Data.ConnectionState.Open)
            await conn.OpenAsync();

        return await _dBConnect.Select(conn, query, dBParameters, entity);
    }

    protected async Task CommitAsync()
    {
        if (_transaction != null)
            await _transaction.CommitAsync();

        await CloseAsync();
    }

    protected async Task RollbackAsync()
    {
        if (_transaction != null)
            await _transaction.RollbackAsync();

        await CloseAsync();
    }

    private async Task CloseAsync()
    {
        if (_conn != null && _conn.State != System.Data.ConnectionState.Closed)
            await _conn.CloseAsync();
    }

    public override void OnActionExecuting(ActionExecutingContext context)
        => GetAccountData().GetAwaiter().GetResult();

    private async Task GetAccountData()
    {
        if (HttpContext.User.Identity is ClaimsIdentity identity)
        {
            if (identity.Claims.Any())
            {
                int id = Convert.ToInt32(identity.FindFirst("account_id").Value);
                string password = identity.FindFirst("password").Value;
                string name = identity.FindFirst("name").Value;

                if (!await Scalar(@"
                    SELECT
                        COUNT(*)
                    FROM
                        `accounts`
                    WHERE
                        `name` = @name
                        AND `password` = SHA1(@password)
                        AND `id` = @account_id", new()
                {
                    new("@name", name),
                    new("@password", password),
                    new("@account_id", id)
                }))
                    throw new CustomException("invalid token");

                _account = new()
                {
                    id = id,
                    name = name,
                    password = password,
                    IsAuthenticated = true
                };
            }
        }
    }

    protected bool IsAuthenticated() => _account.IsAuthenticated;
}
