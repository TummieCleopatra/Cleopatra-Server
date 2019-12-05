-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Vanguard Vindicator
-----------------------------------

require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player)

	if (mob:getID() == 17539300 and alreadyReceived(player,7) == false) then
		player:addTimeToDynamis(10);
		addDynamisList(player,64);
	end

end;