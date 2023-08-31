local config = { 
funnyEffect = "YES", -- effects firework's & Animated Text  (YES/NO)  
minimumLevel = 1, 
maximumLevel = 999, -- for infinite type math.huge 
} 
local addExp = { 
[{config.minimumLevel, 40}] = 100, 
[{40, 60}] = 500, 
[{60, 80}] = 1000, 
[{80, 100}] = 2000, 
[{100, 120}] = 3000, 
[{120, 140}] = 4000, 
[{140, config.maximumLevel}] = 5000 
} 
function onUse(cid, item, fromPosition, itemEx, toPosition) 
local level = getPlayerLevel(cid) 
    local effect = math.random(CONST_ME_FIREWORK_YELLOW,CONST_ME_FIREWORK_BLUE)  

    if level < config.minimumLevel then 
        doPlayerSendCancel(cid, "You need to be at least "..config.minimumLevel.." to use a scroll.") 
        return FALSE  
    end 
     
    if level >= config.maximumLevel then 
        doPlayerSendCancel(cid, "Your level is too high for using a scroll.") 
        return FALSE  
    end 

    for k, v in pairs(addExp) do  
        if level >= k[1] and level < k[2] then  
            doPlayerAddExp(cid, v) 
            doRemoveItem(item.uid, 1) 
            break  
        end  
    end   

        if config.funnyEffect == "YES" then 
        local pos = getPlayerPosition(cid) 
        local positions = { 
                {x=pos.x+1,y=pos.y-1,z=pos.z}, 
                {x=pos.x-1,y=pos.y-1,z=pos.z}, 
                {x=pos.x+1,y=pos.y+1,z=pos.z}, 
                {x=pos.x-1,y=pos.y+1,z=pos.z}, 
                {x=pos.x+1,y=pos.y,z=pos.z}, 
                {x=pos.x-1,y=pos.y,z=pos.z}, 
                {x=pos.x,y=pos.y+1,z=pos.z}, 
                {x=pos.x,y=pos.y-1,z=pos.z} 
        } 

        for i = 1, table.getn(positions) do 
            doSendAnimatedText(getThingPos(cid), "Yeah! Exp!", TEXTCOLOR_RED)  
            doSendMagicEffect(positions[i],effect) 
        end 
    end 
    return TRUE  
end  