-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Seiryu (Pet version)
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/mobscaler");
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",9);  -- Large Party of 75's can defeat Kirin
end


function onMonsterMagicPrepare(mob,target)
    if (mob:hasStatusEffect(dsp.effect.HUNDRED_FISTS,0) == false) then
        local rnd = math.random();
        if (rnd < 0.5) then
            return 186; -- aeroga 3
        elseif (rnd < 0.7) then
            return 157; -- aero 4
        elseif (rnd < 0.9) then
            return 208; -- tornado
        else
            return 237; -- choke
        end
    end
    return 0; -- Still need a return, so use 0 when not casting
end;

function onMobFight(mob, target)
    mobScaler(mob,target);
end

function onMobDeath(mob, player, isKiller)
end;
