-----------------------------------
-- Area: Arrapago Reef
--  NPC: Lil Apkallu(ZNM T1)
-- @posI-9
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
    local nm = 8;
    znmTherionT1(mob, player, nm)	
end;