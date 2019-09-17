-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: Dea(ZNM T3)
-- @pos F-7
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/IDs"] = nil;
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/IDs");
require("scripts/globals/status");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    znmT3Size(mob) 
end;

function onMobFight(mob, target)
    znmScalerT3(mob,target)
end;

function onCriticalHit(mob)



end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local nm = 21;
    znmTherionT3(mob, player, nm)	
end;