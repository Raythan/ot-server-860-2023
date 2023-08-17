function onStepIn(cid, item, pos, fromPosition)

	if item.uid == 49342 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x=32953,y=31482,z=6}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	elseif item.uid == 49343 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x=32953,y=31488,z=6}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	elseif item.uid == 49344 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x=32957,y=31539,z=4}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	elseif item.uid == 49345 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x=32954,y=31552,z=3}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return TRUE
end