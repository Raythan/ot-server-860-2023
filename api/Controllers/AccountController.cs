using api.DBContext;
using api.Interfaces;
using api.Models;
using api.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel;

namespace api.Controllers;

[ApiController]
[Route("[controller]")]
public class AccountController : BaseController
{
    public AccountController(IDBConnect dBConnect) : base(dBConnect)
    {
    }

    [AllowAnonymous]
    [HttpPost(Name = "CreateAccount")]
    public async Task<IActionResult> Post([FromBody] Account account)
    {
        if (string.IsNullOrEmpty(account.email) ||
        string.IsNullOrEmpty(account.name) ||
        string.IsNullOrEmpty(account.password) ||
        !int.TryParse(account.name, out int _) ||
        !account.email.IsEmail())
            throw new CustomException("there is some invalid value");

        if(await Scalar("SELECT count(*) FROM `accounts` WHERE `name` = @name", new()
            {
                new("@name", account.name)
            }))
            throw new CustomException("that account is already in use");

        await Insert("INSERT INTO `accounts` (`name`, `password`, `email`) VALUES (@name, SHA1(@password), @email) ",
            new()
            {
                new("@email", account.email),
                new("@name", account.name),
                new("@password", account.password)
            });

        await CommitAsync();
        return Ok("new account inserted");
    }
}
