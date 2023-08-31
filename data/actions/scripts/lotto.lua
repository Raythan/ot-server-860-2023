function onUse(cid, item, frompos, item2, topos)
	rand = math.random(1,11)
 
		if item.itemid == 5957 then
			if rand == 7 then
			doPlayerSendTextMessage(cid,22,"Winner, winner!")  
			doTransformItem(item.uid,item.itemid+1)
 
			else
 
			doPlayerSendTextMessage(cid,22,"Your ticket was blank. Better luck next time!")
			doTransformItem(item.uid,item.itemid-1)
			end
 
    return
    end
end