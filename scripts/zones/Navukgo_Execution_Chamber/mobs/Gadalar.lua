-- Area: Navukgo Execution Chamber
--  MOB: General Gadalar
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("MattBuff",1);
	mob:setLocalVar("HasteBuff",1);
	mob:setLocalVar("FCBuff",1);
	mob:setLocalVar("Mana",1);
    mob:setMod(dsp.mod.MATT, -30); -- Too strong on casts
    mob:setMod(dsp.mod.ATT, 50)
    mob:setMoc(dsp.mod.STR, 75)
end


function onMobFight(mob,target)
    -- Zazarg gains 3 buffs based on HP triggers
	-- 75% gains accuracy bonus
	-- 50% gains haste bonus
	-- 25% gains high counter bonus
	local matt = mob:getLocalVar("MattBuff");
	local haste = mob:getLocalVar("HasteBuff");
	local fc = mob:getLocalVar("FCBuff");
	local mana = mob:getLocalVar("Mana");
	local twohr = math.random(30,70);
	local hp = mob:getHPP();
	if (matt == 1 and hp < 75) then
		mob:addMod(dsp.mod.MATT,40);
	    mob:setLocalVar("MattBuff",2);
	elseif (haste == 1 and hp < 50) then
	    mob:addMod(dsp.mod.HASTE_MAGIC,1500);
	    mob:setLocalVar("HasteBuff",2);
		mob:addStatusEffect(dsp.effect.ENFIRE, 10, 0, 1500);
	elseif (fc == 1 and hp < 25) then
	    mob:addMod(dsp.mod.FASTCAST,40);
	    mob:setLocalVar("FCBuff",2);
    end

    if (hp < twohr and mana == 1) then
        mob:useMobAbility(691);
        mob:setLocalVar("Mana",0);
    end

    -- printf("Weapon Skill Damage: %u",wsDamage)
    local randtp = math.random(100,500)
    if (mob:getTP() >= 1000 + randtp and hp > 25) then
        mob:useMobAbility(2089, target) -- Salamander Flame
        mob:setTP(0)
    elseif (mob:getTP() >= 1000 and hp <= 25) then
        mob:useMobAbility(2089, target) -- Salamander Flame
        mob:setTP(0)
    end


end


function onMobDeath(mob,player,isKiller)
end