using api.DBContext;
using api.Interfaces;
using api.Models;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("[controller]")]
public class AuthenticationController : BaseController
{
    public AuthenticationController(IDBConnect dBConnect) : base(dBConnect)
    {
    }

    [HttpGet(Name = "Login")]
    public async Task<IActionResult> Login([FromBody] Account account)
    {

        return Ok("new player inserted");
    }
}
