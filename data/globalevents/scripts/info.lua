-- [( Script created by DoidinMapper )] --
function onThink(interval, lastExecution)
MENSAGEM = {
"Bem Vindo ao .::Orion-Server::.",
"Aproveitem ao maximo nosso servidor",
"Seja VIP você tabém",
"Acess nosso site: http://orion-otserv.servegame.com/",
}
doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)],22)
return TRUE
end