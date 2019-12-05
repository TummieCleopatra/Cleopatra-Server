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
    mob:setLocalVar("BloodWeapon", hp);
end;


-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

    local bw = mob:getLocalVar("BloodWeapon");


    if (mob:getHPP() < bw) then
        mob:useMobAbility(439);
		
        mob:setLocalVar("BloodWeapon", 0);
    end

end;




-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player)

	
end;
