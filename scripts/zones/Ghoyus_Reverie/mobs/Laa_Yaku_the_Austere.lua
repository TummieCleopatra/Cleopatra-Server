-----------------------------------
-- Area: BCNM
--  MOB: Yagudo Herald
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)

   printf("Spawnned NM")
end

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance();
    if (instance:completed() == false) then
        instance:complete();
    end
end;