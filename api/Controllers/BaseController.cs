using api.DBContext;
using api.Interfaces;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using System.Transactions;

namespace api.Controllers;

public class BaseController : ControllerBase
{
    private readonly IDBConnect _dBConnect;
    protected MySqlTransaction _transaction;
    private MySqlConnection conn;

    public BaseController(IDBConnect dBConnect)
    {
        _dBConnect = dBConnect;
    }

    protected async Task<int> Insert(string query, List<DBParameters> dBParameters)
    {
        conn ??= new MySqlConnection(_dBConnect.connectionString);
        
        if (conn.State != System.Data.ConnectionState.Open)
            await conn.OpenAsync();

        _transaction = await conn.BeginTransactionAsync();

        return await _dBConnect.InsertAsync(conn, query, dBParameters, _transaction);
    }

    protected async Task<bool> Scalar(string query, List<DBParameters> dBParameters)
    {
        conn ??= new MySqlConnection(_dBConnect.connectionString);
        
        if (conn.State != System.Data.ConnectionState.Open)
            await conn.OpenAsync();

        return await _dBConnect.ScalarAsync(conn, query, dBParameters);
    }

    protected async Task CommitAsync()
    {
        if (_transaction != null)
            await _transaction.CommitAsync();

        await CloseAsync();
    }

    protected async Task RollbackAsync()
    {
        if(_transaction != null)
            await _transaction.RollbackAsync();

        await CloseAsync();
    }

    private async Task CloseAsync()
    {
        if (conn != null && conn.State != System.Data.ConnectionState.Closed)
            await conn.CloseAsync();
    }
}
