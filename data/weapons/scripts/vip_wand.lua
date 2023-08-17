local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HOLYDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SMALLHOLY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -120, 0, -220)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end
