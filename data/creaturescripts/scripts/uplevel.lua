function onAdvance(cid, skill, oldLevel, newLevel)
	restoreHp(cid)
	restoreMana(cid)
	addPotionByVocation(cid)
	
	return true
end