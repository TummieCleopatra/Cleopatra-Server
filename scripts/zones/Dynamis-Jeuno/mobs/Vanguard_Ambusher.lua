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
    mob:setLocalVar("EES", hp);
end;


-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

    local ees = mob:getLocalVar("EES");


    if (mob:getHPP() < ees) then
        mob:useMobAbility(479);
		
        mob:setLocalVar("EES", 0);
    end

end;




-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	
end;
