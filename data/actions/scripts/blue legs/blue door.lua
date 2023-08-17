function onUse(cid, item, fromPosition, itemEx, toPosition)
	if item.uid == 5787 then
		if(isInArray({getPlayerStorageValue(cid, 36205), getPlayerStorageValue(cid, 36205), getPlayerStorageValue(cid, 36205), getPlayerStorageValue(cid, 36205), getPlayerStorageValue(cid, 36205), getPlayerStorageValue(cid, 36205)}, -1) == TRUE) then
  			doPlayerSendTextMessage(cid, 22, "The door seems to be sealed against unwanted intruders.")
		else
			doPlayerSendTextMessage(cid, 22, "You may pass.")
			doTransformItem(item.uid, item.itemid + 1)
			doTeleportThing(cid, toPosition, TRUE)
		end
		return TRUE
	end
	return FALSE
end