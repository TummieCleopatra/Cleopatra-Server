-----------------------------------
-- Area: Dynamis Beaucedine
-- NPC:  Yagudo
-- Drops Amber Granules of Time Randomly
-----------------------------------
local ID = require("scripts/zones/Dynamis-Beaucedine/IDs")
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Beaucedine/IDs");
require("scripts/globals/keyitems");

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

function onMobDeath(mob,player,isKiller)
local rand = math.random(1,100);
player:PrintToPlayer("Random Number is"..rand.."!");
if (rand < 15 and player:getObjType() == dsp.objType.PC) then
    if (player:hasKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME) == false) then
	player:addKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);
	player:messageSpecial(ID.text.KEYITEM_OBTAINED,AMBER_GRANULES_OF_TIME);
	end
end

	
end;
