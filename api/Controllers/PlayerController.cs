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
            INSERT INTO
				`players`
				(`name`
				, `world_id`
				, `group_id`
				, `account_id`
				, `level`
				, `vocation`
				, `health`
				, `healthmax`
				, `experience`
				, `lookbody`
				, `lookfeet`
				, `lookhead`
				, `looklegs`
				, `looktype`
				, `lookaddons`
				, `lookmount`
				, `maglevel`
				, `mana`
				, `manamax`
				, `manaspent`
				, `soul`
				, `town_id`
				, `posx`
				, `posy`
				, `posz`
				, `conditions`
				, `cap`
				, `sex`
				, `lastlogin`
				, `lastip`
				, `save`
				, `skull`
				, `skulltime`
				, `rank_id`
				, `guildnick`
				, `lastlogout`
				, `blessings`
				, `pvp_blessing`
				, `balance`
				, `stamina`
				, `direction`
				, `loss_experience`
				, `loss_mana`
				, `loss_skills`
				, `loss_containers`
				, `loss_items`
				, `premend`
				, `online`
				, `marriage`
				, `promotion`
				, `deleted`
				, `description`
				, `offlinetraining_time`
				, `offlinetraining_skill`
				, `created`
				, `nick_verify`
				, `old_name`
				, `hide_char`
				, `worldtransfer`
				, `comment`
				, `show_outfit`
				, `show_eq`
				, `show_bars`
				, `show_skills`
				, `show_quests`
				, `stars`
				, `ip`
				, `cast`
				, `castViewers`
				, `castDescription`
				, `broadcasting`
				, `viewers`
				, `rep`)
			SELECT 
				@name
				, `world_id`
				, `group_id`
				, @account_id
				, `level`
				, `vocation`
				, `health`
				, `healthmax`
				, `experience`
				, `lookbody`
				, `lookfeet`
				, `lookhead`
				, `looklegs`
				, `looktype`
				, `lookaddons`
				, `lookmount`
				, `maglevel`
				, `mana`
				, `manamax`
				, `manaspent`
				, `soul`
				, `town_id`
				, `posx`
				, `posy`
				, `posz`
				, `conditions`
				, `cap`
				, `sex`
				, `lastlogin`
				, `lastip`
				, `save`
				, `skull`
				, `skulltime`
				, `rank_id`
				, `guildnick`
				, `lastlogout`
				, `blessings`
				, `pvp_blessing`
				, `balance`
				, `stamina`
				, `direction`
				, `loss_experience`
				, `loss_mana`
				, `loss_skills`
				, `loss_containers`
				, `loss_items`
				, `premend`
				, `online`
				, `marriage`
				, `promotion`
				, 0
				, `description`
				, `offlinetraining_time`
				, `offlinetraining_skill`
				, (SELECT UNIX_TIMESTAMP(CURRENT_TIMESTAMP))
				, `nick_verify`
				, `old_name`
				, `hide_char`
				, `worldtransfer`
				, `comment`
				, `show_outfit`
				, `show_eq`
				, `show_bars`
				, `show_skills`
				, `show_quests`
				, `stars`
				, `ip`
				, `cast`
				, `castViewers`
				, `castDescription`
				, `broadcasting`
				, `viewers`
				, `rep`
			FROM `players`
			WHERE `vocation` = @vocation
				AND `account_id` = 1",
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
