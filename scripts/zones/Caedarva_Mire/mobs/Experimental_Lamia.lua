-----------------------------------
-- Area: Caedarva mire
--  NPC: Experimental Lamia(ZNM T3)
-- @pos F-7
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/IDs"] = nil;
-----------------------------------
require("scripts/zones/Caedarva_Mire/IDs");
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
    local nm = 26;
    znmTherionT3(mob, player, nm)	
end;