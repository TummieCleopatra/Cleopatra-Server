-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Vanguard Armorer

-----------------------------------
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Jeuno/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    local hp = math.random(30,60)
    mob:setLocalVar("Invincible", hp);
end;


-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

    local inv = mob:getLocalVar("Invincible");


    if (mob:getHPP() < inv) then
        mob:useMobAbility(438);
		
        mob:setLocalVar("Invincible", 0);
    end

end;




-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	
end;
