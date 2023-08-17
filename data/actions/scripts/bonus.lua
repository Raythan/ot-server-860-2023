function onUse(cid, item, frompos, item2, topos)


if item.uid ==10030 then
queststatus = getPlayerStorageValue(cid,10030)
if queststatus == -1 then
doPlayerSendTextMessage(cid,22,"You have found 5 crystal coins.")
doPlayerAddItem(cid,2160,5)
setPlayerStorageValue(cid,10030,1)
else
doPlayerSendTextMessage(cid,22,"It's empty.")
end
else
return 0
end

return 1
end