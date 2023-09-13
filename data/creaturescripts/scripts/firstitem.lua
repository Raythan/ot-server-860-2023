function onLogin(cid)

	if getPlayerGroupId(cid) == 1 and getPlayerStorageValue(cid, 21922) == -1 then
		if isRookie(cid) then
			local bag = doPlayerAddItem(cid, 1987, 1)
			doAddContainerItem(bag, 8704, 3)
			doAddContainerItem(bag, 2674, 5)
			doPlayerAddItem(cid, 2382, 1)
			doPlayerAddItem(cid, 2650, 1)
			setPlayerStorageValue(cid, 21922, 1)
		end
	end
 	return TRUE
end