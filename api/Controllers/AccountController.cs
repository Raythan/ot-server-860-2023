using api.DBContext;
using api.Interfaces;
using api.Models;
using api.Utils;
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

    [HttpPost(Name = "CreateAccount")]
    public async Task<IActionResult> Post([FromBody] Account account)
    {
        try
        {
            if (string.IsNullOrEmpty(account.email) ||
            string.IsNullOrEmpty(account.name) ||
            string.IsNullOrEmpty(account.password) ||
            !int.TryParse(account.name, out int _) ||
            !account.email.IsEmail())
                throw new CustomException("there is some invalid value");

            if(await base.Scalar("SELECT count(*) FROM `accounts` WHERE `name` = @name", new()
                {
                    new("@name", account.name)
                }))
                throw new CustomException("that account is already in use");

            await base.Insert("INSERT INTO `accounts` (`name`, `password`, `email`) VALUES (@name, SHA1(@password), @email) ",
                new()
                {
                    new("@email", account.email),
                    new("@name", account.name),
                    new("@password", account.password)
                });

            await base.CommitAsync();
            return Ok("new account inserted");
        }
        catch
        {
            await base.RollbackAsync();
            throw;
        }
    }
}
