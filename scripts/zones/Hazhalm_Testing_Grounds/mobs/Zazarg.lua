-- Area: Hazhalm Testing Grounds
--  MOB: General Zazarg
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("AccBuff",1);
	mob:setLocalVar("HasteBuff",1);
	mob:setLocalVar("CounterBuff",1);
	mob:setLocalVar("HF",1);
	mob:addStatusEffect(dsp.effect.SLOW, 400, 0, 1200);  -- Hack to slow his melee's down
	mob:addMod(dsp.mod.ATT, -100);
end


function onMobFight(mob,target)
    -- Zazarg gains 3 buffs based on HP triggers
	-- 75% gains accuracy bonus
	-- 50% gains haste bonus
	-- 25% gains high counter bonus
	local acc = mob:getLocalVar("AccBuff");
	local haste = mob:getLocalVar("HasteBuff");
	local counter = mob:getLocalVar("ParryBuff");	
	local hf = mob:getLocalVar("INV");
	local twohr = math.random(30,70);
	local hp = mob:getHPP();
	if (acc == 1 and hp < 75) then
	    mob:addMod(dsp.mod.ACC,30);
		mob:addMod(dsp.mod.EVA,20);
		mob:addStatusEffect(dsp.effect.SLOW, 75, 0, 1500); 
	    mob:setLocalVar("AccBuff",2);
	elseif (haste == 1 and hp < 50) then
	    -- mob:addMod(dsp.mod.HASTE_MAGIC,1500);

	    mob:setLocalVar("HasteBuff",2);	
		mob:addStatusEffect(dsp.effect.ENSTONE, 10, 0, 1500);
	elseif (counter == 1 and hp < 25) then
	    mob:addMod(dsp.mod.COUNTER,30);
	    mob:setLocalVar("CounterBuff",2);
    end

    if (hp < twohr and hf == 1) then
        mob:useMobAbility(434);
        mob:setLocalVar("HF",0);
    end		
    
	
end


function onMobDeath(mob,player,isKiller)
end