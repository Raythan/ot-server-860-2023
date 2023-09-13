function onLogout(cid)
	-- local checkpet = (getCreatureSummons(cid)[1])
	local itemdopet = 9980
	local checkpet = (getCreatureSummons(cid)[1])
	local itemnoslot = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
	if not checkpet or not tonumber(checkpet) then
		--doPlayerSendTextMessage(cid, 27, "Nao achei summon.")
	else
		--if getPlayerItemCount(cid, itemdopet) > 0 then
		if itemnoslot.itemid == itemdopet then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			--getCreatureName(getCreatureSummons(cid)[1])
			--doItemSetAttribute(itemnoslot.uid, "description", "Funcionou2")
			doItemSetAttribute(itemnoslot.uid, "status", 0)
			for _, pid in ipairs(getCreatureSummons(cid)) do
				doRemoveCreature(pid)
			end
			
			--doPlayerSendTextMessage(cid, 28, "Achei summon.")
			-- doPlayerSendCancel(cid, "Guarde seu Pet ou destrua seus summons antes de deslogar.")
			--local item = getPlayerItemById(cid, true, itemdopet)
			--local item = getAllItemsById(cid, 9980)
			--local item = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
			--doPlayerSendTextMessage(cid, 28, "Achei item no slot.: " ..itemnoslot.itemid.. ".")
			--doPlayerSendTextMessage(cid, 28, "Achei item no slot.: " ..item.itemname.. ".")
			db.executeQuery("DELETE FROM `pet_experience_info_system` WHERE `id` = " ..getPlayerGUID(cid).. ";")
			doPlayerSave(cid, true)
			return true
		end
	end
	doPlayerSave(cid, true)
	--doBroadcastMessage("Player "..getPlayerName(cid).." salvo com sucesso!")
	return true
end

--[[
CONST_SLOT_FIRST = 1
CONST_SLOT_HEAD = CONST_SLOT_FIRST
CONST_SLOT_NECKLACE = 2
CONST_SLOT_BACKPACK = 3
CONST_SLOT_ARMOR = 4
CONST_SLOT_RIGHT = 5
CONST_SLOT_LEFT = 6
CONST_SLOT_LEGS = 7
CONST_SLOT_FEET = 8
CONST_SLOT_RING = 9
CONST_SLOT_AMMO = 10
CONST_SLOT_LAST = CONST_SLOT_AMMO
]]


--[[ function getAllItemsById(cid, id)
	local containers = {}
	local items = {}
	
	for i = CONST_SLOT_FIRST, CONST_SLOT_LAST do
		local sitem = getPlayerSlotItem(cid, i)
		if sitem.uid > 0 then
			if isContainer(sitem.uid) then
				table.insert(containers, sitem.uid)
			elseif not(id) or id == sitem.itemid then
				table.insert(items, sitem)
			end
		end
	end
	
	while #containers > 0 do
		for k = (getContainerSize(containers[1]) - 1), 0, -1 do
			local tmp = getContainerItem(containers[1], k)
			if isContainer(tmp.uid) then
				table.insert(containers, tmp.uid)
			elseif not(id) or id == tmp.itemid then
				table.insert(items, tmp)
			end
		end
		table.remove(containers, 1)
	end

	
	return items
end ]]