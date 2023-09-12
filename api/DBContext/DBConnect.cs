using api.Interfaces;
using MySql.Data.MySqlClient;
using System.Data.Common;
using System.Data;
using System.Dynamic;
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
    public async Task<List<dynamic>> Select(MySqlConnection conn, string query, List<DBParameters> dBParameters, dynamic entity)
    {
        MySqlCommand cmd = new(query, conn);
        dBParameters.ForEach(f => cmd.Parameters.AddWithValue(f.Key, f.Value));

        var reader = await cmd.ExecuteReaderAsync();
        dynamic fields = entity.GetType().GetProperties();
        List<dynamic> list = new();

        while (await reader.ReadAsync())
        {
            var item = new ExpandoObject() as IDictionary<string, object>;

            foreach (var field in fields)
            {
                try
                {
                    item[field.Name] = reader[field.Name];
                }
                catch { }
            }

            list.Add(item);
        }

        return list;
    }

    public async Task<bool> ScalarAsync(MySqlConnection conn, string query, List<DBParameters> dBParameters)
    {
        MySqlCommand cmd = new(query, conn);
        dBParameters.ForEach(f => cmd.Parameters.AddWithValue(f.Key, f.Value));
        return Convert.ToInt64(await cmd.ExecuteScalarAsync()) > 0;
    }
}
