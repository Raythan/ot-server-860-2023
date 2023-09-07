using api.Interfaces;
using MySql.Data.MySqlClient;
using System.Transactions;

namespace api.DBContext;

public class DBConnect : IDBConnect
{
    public string connectionString { get; }

    //Constructor
    public DBConnect(IConfiguration configuration)
    {
        connectionString = configuration.GetConnectionString("MySQL");
    }

    //Insert statement
    public async Task<int> InsertAsync(MySqlConnection conn, string query, List<DBParameters> dBParameters, MySqlTransaction transaction)
    {
        MySqlCommand cmd = new(query, conn, transaction);
        dBParameters.ForEach(f => cmd.Parameters.AddWithValue(f.Key, f.Value));
        return await cmd.ExecuteNonQueryAsync();
    }

    //Update statement
    public void Update(string query)
    {   
    }

    //Delete statement
    public void Delete(string query)
    {
    }

    //Select statement
    public List<string>[]? Select(string query)
    {
        return null;
    }

    public async Task<bool> ScalarAsync(MySqlConnection conn, string query, List<DBParameters> dBParameters)
    {
        MySqlCommand cmd = new(query, conn);
        dBParameters.ForEach(f => cmd.Parameters.AddWithValue(f.Key, f.Value));
        return Convert.ToInt64(await cmd.ExecuteScalarAsync()) > 0;
    }
}
