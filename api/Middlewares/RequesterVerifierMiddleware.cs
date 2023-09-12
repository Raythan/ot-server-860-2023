using api.Models;
using System.Net;
using System.Security.Claims;
using System.Text.Json;

namespace api.Middlewares;

public class RequesterVerifierMiddleware
{
    private readonly RequestDelegate _next;

    public RequesterVerifierMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task Invoke(HttpContext context)
    {
        // check if request can be done
        // avoid flood
        var identity = context.User.Identity as ClaimsIdentity;
        if (identity != null)
        {

            await _next(context);
            return;
        }

        throw new CustomException("request not identifiable");
    }
}
