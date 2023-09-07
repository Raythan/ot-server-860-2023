using System.Net;
using System.Text.Json;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace api.Middlewares;
public class LogRequestsMiddleware
{
    private readonly RequestDelegate _next;
    private readonly ILogger<LogRequestsMiddleware> logger;

    public LogRequestsMiddleware(RequestDelegate next, ILogger<LogRequestsMiddleware> logger)
    {
        _next = next;
        this.logger = logger;
    }

    public async Task Invoke(HttpContext context)
    {
        string message;
        var request = new
        {
            context.Request.Method,
            context.Request.Headers,
            context.Request.Cookies,
            context.Request.QueryString,
            context.Request.Host,
        };

        message = $"{DateTime.UtcNow} Request: {JsonSerializer.Serialize(request)}";
        logger.LogInformation(message);
        await _next(context);

        var response = new
        {
            context.Response.StatusCode
        };

        message = $"{DateTime.UtcNow} Response: {JsonSerializer.Serialize(response)}";
        logger.LogInformation(message);
    }
}
