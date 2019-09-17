-----------------------------------
-- Area: Mount Zhayolm
-- NPC: Khromasoul Bhurborlor
-- @pos H-8
-----------------------------------

require("scripts/globals/magic");
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
    local nm = 23;
    znmTherionT3(mob, player, nm)	
end;