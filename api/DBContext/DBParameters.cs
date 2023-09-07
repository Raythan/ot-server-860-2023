namespace api.DBContext
{
    public class DBParameters
    {
        public string Key { get; set; }
        public object Value { get; set; }
        public DBParameters() { }
        public DBParameters(string key, object value)
        {
            Key = key;
            Value = value;
        }
    }
}
