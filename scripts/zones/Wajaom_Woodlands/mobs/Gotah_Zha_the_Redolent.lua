-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Gotah Zha the Redolent(ZNM T3)
-- @pos J-8
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/IDs"] = nil;
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/IDs");
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
    local nm = 20;
    znmTherionT3(mob, player, nm)	
end;