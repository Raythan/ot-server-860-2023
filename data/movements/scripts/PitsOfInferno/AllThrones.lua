function onStepIn(cid, item, pos)
   if item.uid == 10274 then
      if getPlayerStorageValue(cid,10274) == -1 then
         setPlayerStorageValue(cid,10274,1)
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_BIGCLOUDS)
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Verminor�s throne and absorbed some of his spirit.')
      else
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Veminor�s spirit.')
		 doTeleportThing(cid, {x = 529, y = 1542, z = 14})
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MORTAREA)
         doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
      end
   elseif item.uid == 10275 then
      if getPlayerStorageValue(cid,10275) == -1 then
         setPlayerStorageValue(cid,10275,1)
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_BIGCLOUDS)
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Infernatil�s throne and absorbed some of his spirit.')
      else
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Infernatil�s spirit.')
		 doTeleportThing(cid, {x = 591, y = 1421, z = 14})
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MORTAREA)
         doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
      end
   elseif item.uid == 10276 then
      if getPlayerStorageValue(cid,10276) == -1 then
         setPlayerStorageValue(cid,10276,1)
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_BIGCLOUDS)
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Tafariel�s throne and absorbed some of his spirit.')
      else
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Tafariel�s spirit.')
		 doTeleportThing(cid, {x = 453, y = 1493, z = 14})
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MORTAREA)
         doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
      end
   elseif item.uid == 10277 then
      if getPlayerStorageValue(cid,10277) == -1 then
         setPlayerStorageValue(cid,10277,1)
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_BIGCLOUDS)
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Apocalypse�s throne and absorbed some of his spirit.')
      else
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Apocalypse�s spirit.')
		 doTeleportThing(cid, {x = 469, y = 1527, z = 14})
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MORTAREA)
         doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
      end
   elseif item.uid == 10278 then
      if getPlayerStorageValue(cid,10278) == -1 then
         setPlayerStorageValue(cid,10278,1)
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_BIGCLOUDS)
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Pumin�s throne and absorbed some of his spirit.')
      else
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Pumin�s spirit.')
		 doTeleportThing(cid, {x = 494, y = 1435, z = 13})
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MORTAREA)
         doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
      end
   elseif item.uid == 10279 then
      if getPlayerStorageValue(cid,10279) == -1 then
         setPlayerStorageValue(cid,10279,1)
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_BIGCLOUDS)
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Bazir�s throne and absorbed some of his spirit.')
      else
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Bazir�s spirit.')
		 doTeleportThing(cid, {x = 406, y = 1514, z = 12})
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MORTAREA)
         doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
      end
   elseif item.uid == 10280 then
      if getPlayerStorageValue(cid,10280) == -1 then
         setPlayerStorageValue(cid,10280,1)
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_BIGCLOUDS)
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have touched Ashfalor�s throne and absorbed some of his spirit.')
      else
         doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have already absorbed some of Ashfalor�s spirit.')
         doTeleportThing(cid,{x=540, y=1526, z=14})
         doSendMagicEffect(getPlayerPosition(cid),CONST_ME_MORTAREA)
         doCreatureSay(cid, "Begone!", TALKTYPE_ORANGE_1)
      end

   end
   return 1
end