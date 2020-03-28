-- Area: Hazhalm Testing Grounds
--  MOB: General Zazarg
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("AccBuff",1);
	mob:setLocalVar("HasteBuff",1);

	mob:setLocalVar("twohr",1);
    mob:setLocalVar("CardShotTime",0)
	-- mob:addStatusEffect(dsp.effect.SLOW, 600, 0, 1200);  -- Hack to slow his melee's down
	mob:addMod(dsp.mod.ATT, 200);
    -- mob:addMod(dsp.mod.STR, 70)
    -- mob:addMod(dsp.mod.VIT, 30)
    mob:addMod(dsp.mod.DEF, 30)
    mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,80,0,3600)
    mob:addHP(75000);
    mob:addMod(dsp.mod.DOUBLE_ATTACK, 100)
    mob:addMod(dsp.mod.HASTE_MAGIC,2600);
end


function onMobFight(mob,target)
    -- Zazarg gains 3 buffs based on HP triggers
	-- 75% gains accuracy bonus
	-- 50% gains potent Double Attack and Endark
	-- 25% gains high counter bonus
	local acc = mob:getLocalVar("AccBuff");
	local haste = mob:getLocalVar("HasteBuff");
	local counter = mob:getLocalVar("ParryBuff");
    local cardshottime = mob:getLocalVar("CardShotTime")
    local battletime = mob:getBattleTime();
	local twohrvar = mob:getLocalVar("twohr");
    local startTwoHr = mob:getLocalVar("StartTwoHr")
	local twohr = math.random(30,70);
	local hp = mob:getHPP();
    local randtp = math.random(100,500)
    local countdown = 0
    -- local wsDamage = mob:getLocalVar("wsDamage")
     --[[
    if (battletime > cardshottime + 10) then
        printf("Dark Shot");
        mob:useJobAbility(100, target)
        mob:setLocalVar("CardShotTime",battletime)
    end]]--


    -- printf("Weapon Skill Damage: %u",wsDamage)
    if (mob:getTP() >= 2000 + randtp and hp >= 26 and startTwoHr ~= 1) then
        local randws = math.random(1,2)
        if (randws == 1) then
            mob:useMobAbility(3254, target) -- Akimbo Shot
            mob:setTP(0)
        else
            mob:useMobAbility(3252, target)  -- Bisection
            mob:setTP(0)
        end
    elseif (mob:getTP() >= 1000 + randtp and hp <= 25 and startTwoHr ~= 1) then
        mob:useMobAbility(3253, target) -- Leaden Salute
        mob:setTP(0)
    end

    if (hp < twohr and twohrvar == 1 and startTwoHr ~= 1) then
        if (target:getObjType() ~= dsp.objType.PC) then
            local master = target:getMaster()
            master:PrintToPlayer("Luzaf : Prepare to meet thy doom...", 0x15);
        else
            player:PrintToPlayer("Luzaf : Prepare to meet thy doom...", 0x15);
        end
        mob:messageBasic(dsp.msg.basic.READIES_WS, 0, 2762)
        mob:setLocalVar("StartTwoHr",1)
        mob:setTP(3000)
        battletime = countdown
    end

    if ((battletime > countdown + 5) and (startTwoHr == 1)) then
        mob:useMobAbility(2762);
        mob:setLocalVar("twohr",0)
        mob:setTP(0)
        mob:setLocalVar("StartTwoHr",0)
    end


    --

	if (acc == 1 and hp < 75) then
	    mob:addMod(dsp.mod.ACC,30);
		mob:addMod(dsp.mod.EVA,20);

	    mob:setLocalVar("AccBuff",2);
	elseif (haste == 1 and hp < 50) then
	    -- mob:addMod(dsp.mod.HASTE_MAGIC,1500);
	    mob:setLocalVar("HasteBuff",2);
		mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
        mob:addMod(dsp.mod.TRIPLE_ATTACK, 30)
    end




end

--  NOT READY TO USE THIS

--[[
function onWeaponskillHit(mob, attacker, weaponskill)
    local wsDamage = mob:getLocalVar("wsDamage")
    local battletime = mob:getBattleTime();
    local threshold = 1500
    local current

    if ((threshold / battletime) >  25) then
        mob:addMod(dsp.mod.DMGPHYS, -5)
    end





end
]]--


function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENDARK)
end




function onMobDeath(mob,player,isKiller)
end