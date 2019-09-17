-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Vulpangue(ZNM T1)
-- @pos -697 -7 -123 51
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/IDs"] = nil;
-----------------------------------
require("scripts/zones/Wajaom_Woodlands/IDs");
require("scripts/globals/status");
require("scripts/zones/Davoi/IDs");
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
    local nm = 1;
    znmTherionT1(mob, player, nm)	
end;