-----------------------------------
-- Area: Mamook
--  NPC: Chamrosh(ZNM T1)
-- @pos ??
-----------------------------------
package.loaded["scripts/zones/Mamook/IDs"] = nil;
-----------------------------------
require("scripts/zones/Mamook/IDs");
require("scripts/globals/status");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    znmT1Size(mob) 
end;

function onMobFight(mob, target)
    znmScalerT1(mob,target)
end;

function onCriticalHit(mob)



end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local nm = 2;
    znmTherionT1(mob, player, nm)	
end;