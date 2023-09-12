using api.Interfaces;
using api.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace api.Controllers;

[ApiController]
[Route("[controller]")]
public class PlayerController : BaseController
{
    public PlayerController(IDBConnect dBConnect) : base(dBConnect)
    {
    }

    [Authorize]
    [HttpPost(Name = "CreatePlayer")]
    public async Task<IActionResult> Post([FromBody] Player player)
    {
        if (string.IsNullOrEmpty(player.name) ||
            player.vocation < 1 ||
            player.vocation > 4 ||
            !IsAuthenticated())
            throw new CustomException("there is some invalid value");

        if (await Scalar(@"
            SELECT
                COUNT(*)
            FROM `players`
            WHERE `name` = @name ",
            new()
            {
                new("@name", player.name)
            }))
            throw new CustomException("this name is already in use");

        await Insert(@"
            INSERT INTO `players`
                (`name`, `vocation`, `account_id`)
            VALUES
                (@name, @vocation, @account_id) ",
            new()
            {
                new("@vocation", player.vocation),
                new("@name", player.name),
                new("@account_id", _account.id)
            });

        await CommitAsync();

        return Ok("new player inserted");
    }
}
