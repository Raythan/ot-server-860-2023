local config =
{
	savePlayer = true, --Save Player!
}
 
function onLogout(cid)
	
	if(config.savePlayer) then
		doPlayerSave(cid, true)
	end
	
    return true
end