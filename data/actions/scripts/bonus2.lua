function onUse(cid, item, frompos, item2, topos)


if item.uid ==10031 then
queststatus = getPlayerStorageValue(cid,10031)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found an addon doll.")
doPlayerAddItem(cid,9693,1)
setPlayerStorageValue(cid,10031,1)
else
doPlayerSendTextMessage(cid,22,"It's empty.")
end
else
return 0
end

return 1
end