-----------------------------------
-- Area:    Caedarva Mire
-- NPC:     Verdelet
-- ID:      17101202
-- @pos 417 -19.3 -70
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/mobscaler");
    
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    znmT2Size(mob) 
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    znmScalerT2(mob,target)
end;

-----------------------------------
-- onCriticalHit
-----------------------------------

function onCriticalHit(mob)   
 
    if (math.random(100) < 20 and mob:AnimationSub() == 0) then  -- 20% change to break that horn on crit   
        mob:AnimationSub(1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local nm = 15;
    znmTherionT2(mob, player, nm)	
end;
