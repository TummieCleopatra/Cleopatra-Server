-----------------------------------
-- Area: Arrapago Reef
--  NPC: Nuhn(ZNM T3)
-- @pos G-6
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/IDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/IDs");
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
    local nm = 27;
    znmTherionT3(mob, player, nm)	
end;