function onSay(cid, words, param)
 
local mounts = {
["widow queen"] = {price = 0, id = 1},
["racing bird"] = {price = 0, id = 2},
["war bear"] = {price = 0, id = 3},
["black sheep"] = {price = 0, id = 4},
["midnight panther"] = {price = 0, id = 5},
["draptor"] = {price = 0, id = 6},
["titanica"] = {price = 0, id = 7},
["tin lizzard"] = {price = 0, id = 8},
["blazebringer"] = {price = 0, id = 9},
["rapid boar"] = {price = 0, id = 10},
["stampor"] = {price = 0, id = 11},
["undead cavebear"] = {price = 0, id = 12},
["mule"] = {price = 0, id = 13},
["tiger slug"] = {price = 0, id = 14},
["uniwheel"] = {price = 0, id = 15},
["crystal wolf"] = {price = 0, id = 16},
["war horse"] = {price = 0, id = 17},
["kingly deer"] = {price = 0, id = 18},
["tamed panda"] = {price = 0, id = 19},
["dromedary"] = {price = 0, id = 20},
["sandstone scorpion"] = {price = 0, id = 21},
["rented horse a"] = {price = 0, id = 22},
["fire war horse"] = {price = 0, id = 23},
["shadow draptor"] = {price = 0, id = 24},
["rented horse b"] = {price = 0, id = 25},
["rented horse c"] = {price = 0, id = 26},
["ladybug"] = {price = 0, id = 27},
["manta"] = {price = 0, id = 28},
["ironblight"] = {price = 0, id = 29},
["magma crawler"] = {price = 0, id = 30},
["dragonling"] = {price = 0, id = 31},
["gnarlhound"] = {price = 0, id = 32},
["red manta"] = {price = 0, id = 33},
["mechanical bird"] = {price = 0, id = 34},
["buffalo"] = {price = 0, id = 35}
}
 
local msg = {"Usted Puede Escoger La Mount:widow queen,racing bird,war bear,black sheep,midnight panther,draptor,titanica,tin lizzard,blazebringer,rapid boar,stampor,undead cavebear,mule,tiger slug,uniwheel,crystal wolf,war horse,kingly deer,tamed panda,dromedary,sandstone scorpion,war horse,rented horse a-b-c,shadow draptor,manta", "Tu No Tienes Mount Medall..", "No,Es God Parametro..", "Mount Agregado Exitosamente!.","Usted Ya Tiene Este Mount"}
local param = string.lower(param)
local t = mounts[param]
 
if(getPlayerItemCount(cid, 13030) > 0) then
if(param ~= "" and t) then
if t and not getPlayerMount(cid, t.id) then
doPlayerRemoveItem(cid, 13030, 1)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[4])
doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
doPlayerAddMount(cid, t.id)
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[5])
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[1])
end
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[2])
end
end