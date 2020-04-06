-----------------------------------
-- Area: Sealion den
-- NPC:  Prishe
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)

    mob:setAggressive(1)
    mob:setMobMod(dsp.mobMod.NO_MOVE, 1)
    -- mob:addStatusEffect(dsp.effect.SLOW, 100, 0, 1800);
    mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,18,0,0);
    mob:addHP(20000)
    -- mob:addMod(dsp.mod.HASTE_MAGIC, 1000)
    mob:addMod(dsp.mod.DOUBLE_ATTACK, 20)
    mob:addMod(dsp.mod.KICK_ATTACK_RATE, 40)
    mob:addMod(dsp.mod.STR, 30)
    mob:addMod(dsp.mod.ATT, 70)
    mob:setLocalVar("TwoHourBene", 0); -- initialize 2 hr
    mob:setLocalVar("TwoHourHF", 0); -- initialize 2 hr
    mob:setLocalVar("SpellCast",0)
    local spellCooldown = 30
    local hpone = math.random(35,45)
    local hptwo = math.random(40,65)
    printf("Benediction is %u",hpone)
    printf("Hundred Fists is %u",hptwo)
    mob:setLocalVar("Bene", hpone)
    mob:setLocalVar("HF", hptwo)


end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
switch (mob:getID()) : caseof {
[16908475] = function (x)
	GetMobByID(16908476):updateEnmity(target);
	end,
    }
end;

function onMobFight(mob,target)
    local spellCooldown = 25
    mob:setMobMod(dsp.mobMod.NO_MOVE, 0)
    local twohrbene = mob:getLocalVar("TwoHourBene")
    local twohrhf = mob:getLocalVar("TwoHourHF")
    local hf = mob:getLocalVar("HF")
    local bene = mob:getLocalVar("Bene")
    local hp = mob:getHPP()
    local tp = mob:getTP()




    GetMobByID(16908476):updateEnmity(target);
    if (mob:getHPP() < bene and twohrbene ~= 10) then
        mob:useMobAbility(689)
        mob:setLocalVar("TwoHourBene", 10);
        printf("BENEDICTION!!!!!")
    elseif (mob:getHPP() < hf and twohrhf ~= 10) then
        mob:useMobAbility(690)
        mob:setLocalVar("TwoHourHF", 10);
        printf("HUNDRED FISTS!!!!!")
    end

    local battletime = mob:getBattleTime()
    local spellCast = mob:getLocalVar("SpellCast")
    local spellrand = math.random(1,10)
    if (battletime > spellCast + (spellCooldown + spellrand)) then
        local pickSpell = math.random(1,100)
        if (hp > 75) then
            if (pickSpell < 30) then
                mob:castSpell(22,target) -- Holy II
            elseif (pickSpell < 60) then
                mob:castSpell(41, target) -- Banishaga IV
            elseif (pickSpell < 70) then
                mob:castSpell(356, target)  -- Paralyga
            else
                mob:castSpell(57,mob) -- Haste
            end
        elseif (hp > 35) then
            if (pickSpell < 60) then
                mob:castSpell(5, mob) -- Cure V
            else
                mob:castSpell(57,mob) -- Haste
            end
        else
            if (pickSpell < 40) then
                mob:castSpell(5, mob) -- Cure V
            elseif (pickSpell < 70) then
                mob:castSpell(356, target)  -- Paralyga
            else
                mob:castSpell(57,mob) -- Haste
            end
        end

        local nextCast = math.random(3,20)
        mob:setLocalVar("SpellCast",battletime + nextCast)
    end

    -- TP Moves
    --3234 dropkick
    --3235 uppercut
    --3236 sandwhich
    local randtp = math.random(100,400)
    if (hp > 25 and tp >= 1000 + randtp) then
        local pick = math.random(1,2)

        if (pick == 1) then
            mob:useMobAbility(3234)
        else
            mob:useMobAbility(3235)
        end
        mob:setTP(0)
    elseif (hp <= 25 and tp >= 1000) then
        mob:useMobAbility(3236)
        mob:setTP(0)
    end




end;



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player,isKiller)
    DespawnMob(16908476);

end;