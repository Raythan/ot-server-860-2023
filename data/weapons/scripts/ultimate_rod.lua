local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_BLOCKSHIELD, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -0, -550, -0, -650)
local area = createCombatArea({
{0, 0, 0},
{0, 3, 0},
{0, 0, 0}
})
setCombatArea(combat, area)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)


end