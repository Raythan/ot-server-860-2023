using api.DBContext;
using MySql.Data.MySqlClient;

namespace api.Interfaces
{
    public interface IDBConnect
    {
        string connectionString { get; }
        Task<int> InsertAsync(MySqlConnection conn, string query, List<DBParameters> dBParameters, MySqlTransaction transaction);
        Task<bool> ScalarAsync(MySqlConnection conn, string query, List<DBParameters> dBParameters);
        Task<List<dynamic>> Select(MySqlConnection conn, string query, List<DBParameters> dBParameters, dynamic entity);
    }
}
