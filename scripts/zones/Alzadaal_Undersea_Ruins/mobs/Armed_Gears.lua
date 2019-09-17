-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Armed Gears(ZNM T3)
-- @pos G-11
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/IDs"] = nil;
-----------------------------------
require("scripts/zones/Alzadaal_Undersea_Ruins/IDs");
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
    local nm = 19;
    znmTherionT3(mob, player, nm)	
end;