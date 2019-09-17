-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Wulgaru(ZNM T2)
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
    znmT2Size(mob) 
end;

function onMobFight(mob, target)
    znmScalerT2(mob,target)
end;

function onCriticalHit(mob)



end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local nm = 18;
    znmTherionT2(mob, player, nm)	
end;