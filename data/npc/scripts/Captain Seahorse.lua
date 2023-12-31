local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) 			end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) 		end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) 	end
function onThink() 							npcHandler:onThink() 						end

-- Don"t forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
local travelNode = keywordHandler:addKeyword({"carlin"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Carlin por " .. (getConfigInfo("freeTravel") and "free?" or "110 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 110, destination = {x=32387, y=31820, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})

local travelNode = keywordHandler:addKeyword({"ab\'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Ab\'Dendriel por " .. (getConfigInfo("freeTravel") and "free?" or "70 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 70, destination = {x=32734, y=31668, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})

local travelNode = keywordHandler:addKeyword({"thais"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Thais por " .. (getConfigInfo("freeTravel") and "free?" or "160 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 160, destination = {x=32310, y=32210, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})

local travelNode = keywordHandler:addKeyword({"port hope"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Port Hope por " .. (getConfigInfo("freeTravel") and "free?" or "150 gold??")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 150, destination = {x=32527, y=32784, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})

local travelNode = keywordHandler:addKeyword({"ankrahmun"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Ankrahmun por " .. (getConfigInfo("freeTravel") and "free?" or "160 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 160, destination = {x=33092, y=32883, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})

local travelNode = keywordHandler:addKeyword({"liberty bay"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Liberty Bay por " .. (getConfigInfo("freeTravel") and "free?" or "170 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 170, destination = {x=32285, y=32892, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})
	
local travelNode = keywordHandler:addKeyword({"cormaya"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Cormaya por " .. (getConfigInfo("freeTravel") and "free?" or "20 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 20, destination = {x=33287, y=31955, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})
	
local travelNode = keywordHandler:addKeyword({"venore"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Venore por " .. (getConfigInfo("freeTravel") and "free?" or "40 gold?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 0, cost = 40, destination = {x=32954, y=32022, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})

local travelNode = keywordHandler:addKeyword({"yalahar"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Voc� procura uma passagem para Yalahar por " .. (getConfigInfo("freeTravel") and "free?" or "190 gold coins?")})
	travelNode:addChildKeyword({"yes"}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 190, destination = {x=32816, y=31272, z=6} })
	travelNode:addChildKeyword({"no"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = "N�s gostar�amos de lhe servir de algum modo."})
	
local travelNode = keywordHandler:addKeyword({'eremo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voc� quer ir para eremo, voc� tem certeza ?'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost = 10, destination = {x=33321, y=31883, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})	
	
keywordHandler:addKeyword({"sail"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Thais, Carlin, Ab\'Dendriel, Venore, Port Hope, Ankrahmun, Eremo, Liberty Bay or the isle Cormaya?"})
keywordHandler:addKeyword({"job"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I\"m the captain of this sailing ship."})
keywordHandler:addKeyword({"captain"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I\"m the captain of this sailing ship."})


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())