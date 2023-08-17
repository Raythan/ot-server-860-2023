function onAdvance(cid, skill, oldLevel, newLevel)

db.executeQuery("INSERT INTO player_advances (cid, skill, oldlevel, newlevel, time) VALUES ('" .. getPlayerGUID(cid) .. "', '" .. skill .."', '" .. oldLevel .."', '" .. newLevel .."', '" .. os.time() .. "' )")

return true
end