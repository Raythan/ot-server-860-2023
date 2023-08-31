function onStepIn(cid, item, position, fromPosition)

local tileConfig = {
        kickPos = {x=60, y=70, z=6},
        kickEffect = CONST_ME_POFF,
        kickMsg = "Você precisa ser Premium Account para entrar nessa Area.",
        enterMsg = "Bem Vindo a Area Premium!",
        enterEffect = CONST_ME_MAGIC_BLUE,
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