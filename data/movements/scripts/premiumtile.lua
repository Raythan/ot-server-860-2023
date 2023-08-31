function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
	kickPos = fromPosition, kickEffect = CONST_ME_POFF,
	kickMsg = "você precisa ser vip para entrar nessa area.",
	enterMsg = "Bem vindo a area Vip!",
	enterEffect = CONST_ME_MAGIC_RED,
}

if isPlayer(cid) == TRUE then
if vip.hasVip(cid) == FALSE then 
        doTeleportThing(cid, tileConfig.kickPos)
        doSendMagicEffect(tileConfig.kickPos, tileConfig.kickEffect)
        doPlayerSendCancel(cid, tileConfig.kickMsg)
        return
    end
        doPlayerSendTextMessage(cid, 25, tileConfig.enterMsg)
        doSendMagicEffect(position, tileConfig.enterEffect)
        return true
end
end