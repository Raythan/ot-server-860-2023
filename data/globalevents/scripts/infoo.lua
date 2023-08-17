function onThink(interval, lastExecution)
  -- Configurações
    local cor = 22
    local mensagens ={
[[Orion Informações: 
Bem Vindo Ao Orion-Server !!
Para Compra pote NPC Malak !!
Para Vender Itens Soya na entrada North de Thais e na Frente da DP de carlin!!
Accs Criadas pelo OT não Loga no Site, para logar basta vc mudar
sua senha no acc manager.!!
Bom Jogo a Todos!!!
]]
}

  -- Fim de Configurações

  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end