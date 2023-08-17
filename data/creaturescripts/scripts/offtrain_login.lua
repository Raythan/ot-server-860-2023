-- 0.4 - offline training - login.lua
function onLogin(cid)
OfflineTraining_initialize(cid)
if(OfflineTraining_isTraining(cid)) then
OfflineTraining_turnOffTraining(cid)
-- we add skill/mlvl, we select lower value: time that player was offline OR offline training time [bar in game - 9.6]
OfflineTraining_addTrainedSkills(cid, math.min(OfflineTraining_getTime(cid), OfflineTraining_getOfflineTime(cid)))
-- we remove offline training time [bar in game - 9.6],
-- if player was offline longer then his 'offline training time' it will add him time [like on RL tibia]
-- got '3 hours offline training time', stay logged off for 8 hours, you get skills for 3 hours and on login you got '5 hours offline training time'
OfflineTraining_setTime(cid, math.abs(OfflineTraining_getTime(cid) - OfflineTraining_getOfflineTime(cid)))
OfflineTraining_onEndTraining(cid)
local left = ((OfflineTraining_getTime(cid) / 60) * 60 * 60)
left = {hour = math.floor(left/3600), minutes = math.ceil((left % 3600)/60)}
doPlayerPopupFYI(cid, 'Voce ainda tem '.. left.hour ..'h and '..left.minutes..'min de Treinamento.')
else
-- offline training time also regenerate when you are offline, but NOT train
local lefts = ((OfflineTraining_getTime(cid) / 60) * 60 * 60)
OfflineTraining_setTime(cid, OfflineTraining_getTime(cid) + OfflineTraining_getOfflineTime(cid))
lefts = {hour = math.floor(lefts/3600), minutes = math.ceil((lefts % 3600)/60)}
doPlayerPopupFYI(cid, 'Voce tem '.. lefts.hour ..'h and '..lefts.minutes..'min de Treinamento.')
end
return true
end