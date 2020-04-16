-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Adamantking Effigy
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas1.htm
-- Map Position: http://www.dynamislounge.com/html/zone/frame_bas2.htm
-----------------------------------
local ID = require("scripts/zones/Dynamis-Bastok/IDs")
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Bastok/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	-- this is my super id and all my children will have the same number
	-- mob:setMobMod(MOBdsp.mod.SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
   -- dynamis.spawnGroup(mob, bastyList);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player)


end;
