-- Area: Nyzul Isle
--  MOB: General Rughadjeen
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("AccBuff",1);
	mob:setLocalVar("HasteBuff",1);
	mob:setLocalVar("ParryBuff",1);
	mob:setLocalVar("INV",1);
end


function onMobFight(mob,target)
    -- Zazarg gains 3 buffs based on HP triggers
	-- 75% gains accuracy bonus
	-- 50% gains haste bonus
	-- 25% gains high counter bonus
	local acc = mob:getLocalVar("AccBuff");
	local haste = mob:getLocalVar("HasteBuff");
	local counter = mob:getLocalVar("ParryBuff");	
	local inv = mob:getLocalVar("INV");
	local twohr = math.random(30,70);
	local hp = mob:getHPP();
	if (acc == 1 and hp < 75) then
	    mob:addMod(dsp.mod.ACC,30);
		mob:addMod(dsp.mod.EVA,20);
	    mob:setLocalVar("AccBuff",2);
	elseif (haste == 1 and hp < 50) then
	    mob:addMod(dsp.mod.HASTE_MAGIC,1500);
	    mob:setLocalVar("HasteBuff",2);	
		mob:addStatusEffect(dsp.effect.ENLIGHT, 10, 0, 1500);
	elseif (counter == 1 and hp < 25) then
	    mob:addMod(dsp.mod.PARRY,50);
	    mob:setLocalVar("ParryBuff",2);
    end

    if (hp < twohr and inv == 1) then
        mob:useMobAbility(438);
        mob:setLocalVar("INV",0);
    end		
    
	
end


function onMobDeath(mob,player,isKiller)
end