local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler')),
	townId = getConfigValue('newPlayerTownId'),
	pos = {x = getConfigValue('newPlayerSpawnPosX'), y = getConfigValue('newPlayerSpawnPosY'), z = getConfigValue('newPlayerSpawnPosZ')}
}
--posX = getConfigValue('newPlayerSpawnPosX')
--posY = getConfigValue('newPlayerSpawnPosY')
--posZ = getConfigValue('newPlayerSpawnPosZ')

dofile("config.lua")

local storageIdFreeOutfit = { 10022, 10023, 10024, 10025 }

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil and getPlayerStorageValue(cid, "bless") ~= 5) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end

	if(getPlayerStorageValue(cid, "death_bless") == 1) then
		local t = {PLAYERLOSS_EXPERIENCE, PLAYERLOSS_SKILLS, PLAYERLOSS_ITEMS, PLAYERLOSS_CONTAINERS}
		for i = 1, #t do
			doPlayerSetLossPercent(cid, t[i], 100)
		end
		setPlayerStorageValue(cid, "death_bless", 0)
	end

	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
		else
			doPlayerSetTown(cid, config.townId)
			doTeleportThing(cid, config.pos)
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end

		doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
	elseif(accountManager == MANAGER_NAMELOCK) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
	elseif(accountManager == MANAGER_ACCOUNT) then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
	end
	
	if(getPlayerLevel(cid) < 31) then
		doPlayerAddBlessing(cid, 1)
		doPlayerAddBlessing(cid, 2)
		doPlayerAddBlessing(cid, 3)
		doPlayerAddBlessing(cid, 4)
		doPlayerAddBlessing(cid, 5)
		doSendMagicEffect(getPlayerPosition(cid), 28)
		doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE, 'You was blessed by the gods!')
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	
	-- registerCreatureEvent(cid, "advance")
	registerCreatureEvent(cid, "AdvanceSave")
	-- registerCreatureEvent(cid, "attackguild")
	-- registerCreatureEvent(cid, "bluelegs")
	-- registerCreatureEvent(cid, "demonOakDeath")
	-- registerCreatureEvent(cid, "demonOakLogout")
	--registerCreatureEvent(cid, "ExpVip")
	--registerCreatureEvent(cid, "FimVip")
	-- registerCreatureEvent(cid, "FirstItems")
	registerCreatureEvent(cid, "Mail")
	registerCreatureEvent(cid, "GuildMotd")
	registerCreatureEvent(cid, "Idle")
	-- registerCreatureEvent(cid, "KillingInTheNameOf")
	-- registerCreatureEvent(cid, "levelplayer")
	-- registerCreatureEvent(cid, "Mail")
	-- registerCreatureEvent(cid, "PlayerAdvance")
	-- registerCreatureEvent(cid, "PlayerKill")
	--registerCreatureEvent(cid, "Promot")
	-- registerCreatureEvent(cid, "PythiusDead")
	registerCreatureEvent(cid, "ReportBug")
	-- registerCreatureEvent(cid, "PlayerDeath")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end
	--registerCreatureEvent(cid, "VipReceive")
	registerCreatureEvent(cid, "KillTask")
	registerCreatureEvent(cid, "LookTask")
	registerCreatureEvent(cid, "LogoutSave")
	registerCreatureEvent(cid, "UpLevel")
	
	--restoreStorageWithTimeout(cid)
	
	return true
end