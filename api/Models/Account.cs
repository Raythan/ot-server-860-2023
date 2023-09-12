using System.Text.Json.Serialization;

namespace api.Models;

public class Account
{
    [JsonIgnore]
    public int id { get; set; }
    public string email { get; set; }
    public string name { get; set; }
    public string password { get; set; }
    [JsonIgnore]
    public bool IsAuthenticated { get; set; }
}
