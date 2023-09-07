using System.Globalization;

namespace api.Models;

public class CustomException : Exception
{
    public CustomException() : base() { }
    public CustomException(string message) : base(message) { }
    public CustomException(string message, params object[] args)
        : base(string.Format(CultureInfo.CurrentCulture, message, args))
    { }
}
