using api.DBContext;
using api.Interfaces;
using api.Models;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("[controller]")]
public class PlayerController : BaseController
{
    public PlayerController(IDBConnect dBConnect) : base(dBConnect)
    {
    }

    [HttpPost(Name = "CreatePlayer")]
    public async Task<IActionResult> Post([FromBody] Player player)
    {
        if (string.IsNullOrEmpty(player.name) ||
            player.vocation < 1 ||
            player.vocation > 4)
            throw new CustomException("there is some invalid value");

        await base.Insert("INSERT INTO `players` (`name`, `vocation`, `account_id`) VALUES (@name, @vocation, @account_id) ",
            new()
            {
                new("@vocation", player.vocation),
                new("@name", player.name),
                new("@account_id", 1)
            });

        return Ok("new player inserted");
    }
}
