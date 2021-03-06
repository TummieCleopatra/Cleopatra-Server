-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: Velionis(ZNM T1)
-- @pos G-11
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
    local nm = 7;
    znmTherionT1(mob, player, nm)	
end;