-----------------------------------
-- Area: Wajoam Woodlands
-- NPC: Tinnin
-- ID:  16986431
-- @pos 276 0 -694
-- Spawned with Monkey Wine: @additem 2573
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Tinnin
-----------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.GIL_MIN, 12000);
    mob:setMobMod(dsp.mobMod.GIL_MAX, 30000);
    mob:setMobMod(dsp.mobMod.MUG_GIL, 8000);

end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setHP(mob:getMaxHP()/2);
    mob:setUnkillable(true);
    mob:setMod(dsp.mod.REGAIN, 50);
    mob:setMod(dsp.mod.REGEN, 90);
    mob:AnimationSub(2);

    -- Regen Head every 1.5-4 minutes 90-240
    mob:setLocalVar("headTimer", os.time() + math.random(60,190));

    -- Number of crits to lose a head
    mob:setLocalVar("CritToTheFace", math.random(10,30));
    mob:setLocalVar("crits", 0);
    znmT4Size(mob)
end;

-----------------------------------
-- onMobRoam Action
-- Regen head
-----------------------------------

function onMobRoam(mob)
    local headTimer = mob:getLocalVar("headTimer");
    if (mob:AnimationSub() == 2 and os.time() > headTimer) then
        mob:AnimationSub(1);
        mob:setLocalVar("headTimer", os.time() + math.random(60,190));

        -- First time it regens second head, 25%. Reduced afterwards.
        if (mob:getLocalVar("secondHead") == 0) then
            mob:addHP(mob:getMaxHP() * .25);
            mob:setMod(dsp.mod.REGEN, 60);
            mob:setLocalVar("secondHead", 1);
        else
            mob:addHP(mob:getMaxHP() * .05);
        end

    elseif (mob:AnimationSub() == 1 and os.time() > headTimer) then
        mob:AnimationSub(0);
        mob:setLocalVar("headTimer", os.time() + math.random(60,190));

        -- First time it regens third head, 25%. Reduced afterwards.
        if (mob:getLocalVar("thirdHead") == 0) then
            mob:addHP(mob:getMaxHP() * .25);
            mob:setMod(dsp.mod.REGEN, 30);
            mob:setLocalVar("thirdHead", 1);
            mob:setUnkillable(false); -- It can be killed now that has all his heads
        else
            mob:addHP(mob:getMaxHP() * .05);
        end
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    znmScalerT4(mob,target)
    local headTimer = mob:getLocalVar("headTimer");
    if (mob:AnimationSub() == 2 and os.time() > headTimer) then
        mob:AnimationSub(1);
        mob:setMod(dsp.mod.REGEN, 60);
        mob:setLocalVar("headTimer", os.time() + math.random(60,190));

        -- First time it regens second head, 25%. Reduced afterwards.
        if (mob:getLocalVar("secondHead") == 0) then
            mob:addHP(mob:getMaxHP() * .25);
            mob:setLocalVar("secondHead", 1);
        else
            mob:addHP(mob:getMaxHP() * .05);
        end
        mob:useMobAbility(1576); -- Barofield
        mob:useMobAbility(1572); -- Pyric Blast

    elseif (mob:AnimationSub() == 1 and os.time() > headTimer) then
        mob:AnimationSub(0);
        mob:setMod(dsp.mod.REGEN, 30);
        mob:setLocalVar("headTimer", os.time() + math.random(60,190));

        -- First time it regens third head, 25%. Reduced afterwards.
        if (mob:getLocalVar("thirdHead") == 0) then
            mob:addHP(mob:getMaxHP() * .25);
            mob:setLocalVar("thirdHead", 1);
            mob:setUnkillable(false); -- It can be killed now that has all his heads
        else
            mob:addHP(mob:getMaxHP() * .05);
        end
        mob:useMobAbility(1576); -- Barofield
        mob:useMobAbility(1574); -- Polar Blast

    end
end;

-----------------------------------
-- onCriticalHit
-----------------------------------

function onCriticalHit(mob)
    local critNum = mob:getLocalVar("crits");

    if ((critNum+1) > mob:getLocalVar("CritToTheFace")) then  -- Lose a head
        if (mob:AnimationSub() == 0) then
            mob:AnimationSub(1);
            mob:setMod(dsp.mod.REGEN, 60);
            mob:setLocalVar("headTimer", os.time() + math.random(60,190));
        elseif (mob:AnimationSub() == 1) then
            mob:AnimationSub(2);
            mob:setMod(dsp.mod.REGEN, 90);
            mob:setLocalVar("headTimer", os.time() + math.random(60,190));
        else
            -- Meh
        end

        -- Number of crits to lose a head, re-randoming
        mob:setLocalVar("CritToTheFace", math.random(10,30));

        critNum = 0; -- reset the crits on the NM
    else
        critNum = critNum + 1;
    end
    mob:setLocalVar("crits", critNum);
end;

-----------------------------------
-- onMagicHit
-----------------------------------

function onMagicHit(caster, mob, spell)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local nm = 28;
    znmTherionT4(mob, player, nm)
end;
