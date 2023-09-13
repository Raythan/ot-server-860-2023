using api.DBContext;
using api.Interfaces;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using XAct.Users;

namespace api.Controllers;

[ApiController]
[Route("[controller]")]
public class AuthenticationController : BaseController
{
    private readonly IConfiguration configuration;

    public AuthenticationController(IDBConnect dBConnect, IConfiguration configuration) : base(dBConnect)
    {
        this.configuration = configuration;
    }

    [AllowAnonymous]
    [HttpGet]
    [Route("{name}/{password}")]
    public async Task<IActionResult> Login(string name, string password)
    {
        var t = await Select(@"
            SELECT `id`, `name`, `password`, `email`
            FROM `accounts`
            WHERE `name` = @name
                AND `password` = SHA1(@password)",
        new()
        {
            new("@name", name),
            new("@password", password)
        },
        new Account());

        if (t.Any() && !name.Equals("1"))
        {
            var data = (IDictionary<string, object>)t[0];
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim("account_id", Convert.ToString(data["id"])),
                    new Claim("version_id", Guid.NewGuid().ToString()),
                    new Claim("password", password),
                    new Claim(JwtRegisteredClaimNames.Sub, name),
                    new Claim(JwtRegisteredClaimNames.Name, name),
                    new Claim(JwtRegisteredClaimNames.Email, Convert.ToString(data["email"])),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
                }),
                Expires = DateTime.UtcNow.AddMinutes(5),
                Issuer = configuration["Jwt:Issuer"],
                Audience = configuration["Jwt:Audience"],
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(Encoding.ASCII.GetBytes(configuration["Jwt:Key"])), SecurityAlgorithms.HmacSha512Signature)
            };
            var tokenHandler = new JwtSecurityTokenHandler();
            var token = tokenHandler.CreateToken(tokenDescriptor);
            var stringToken = tokenHandler.WriteToken(token);
            return Ok($"Bearer {stringToken}");
        }

        return Unauthorized("invalid attempt");
    }
}
