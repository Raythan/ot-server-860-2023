--[[ by vodkart ]]-- 
function onLogin(cid) 
 
if getPlayerStorageValue(cid, 13540) - os.time() > 0 then 
setPlayerStorageValue(cid, 9898, 1) 
end 
 
local pos = {x = 32173, y = 32216, z = 7} -- posiçao do templo.  
 
function Vodka(cid) 
if isPlayer(cid) then    
db.executeQuery("UPDATE `players` SET `name` = '"..string.sub(getCreatureName(cid), 7).."' WHERE `id` = "..getPlayerGUID(cid)..";") 
doRemoveCreature(cid) 
end 
end 
 
if getPlayerStorageValue(cid, 9898) == 1 and getPlayerStorageValue(cid, 13540) - os.time() < 1 or getPlayerStorageValue(cid, 13540) - os.time() == 0 then 
doTeleportThing(cid, pos)  
doPlayerPopupFYI(cid, "Sua vip Account acabou.") 
setPlayerStorageValue(cid, 9898, -1) 
if string.find(tostring(getCreatureName(cid)),"[[Vip]]") then    
addEvent(Vodka, 3*1000, cid) 
end 
end 
return TRUE 
end