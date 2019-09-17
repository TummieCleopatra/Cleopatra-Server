-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: Nosferatu(ZNM T3)
-- @pos F-9
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/IDs"] = nil;
-----------------------------------
require("scripts/zones/Aydeewa_Subterrane/IDs");
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
    local nm = 22;
    znmTherionT3(mob, player, nm)	
end;