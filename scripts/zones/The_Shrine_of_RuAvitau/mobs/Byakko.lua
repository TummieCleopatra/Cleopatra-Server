-----------------------------------
-- Area: The Shrine of Ru'Avitau
--  MOB: Suzaku (Pet version)
-----------------------------------
require("scripts/globals/mobscaler");

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",9);  -- Large Party of 75's can defeat Kirin
end

function onMobDeath(mob, player, isKiller)
end;

function onMobFight(mob, target)
    mobScaler(mob,target);
end