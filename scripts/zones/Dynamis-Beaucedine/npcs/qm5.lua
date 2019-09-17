--------------------------
-- Area: Dynamis - B
-- NPC: ??? (qm5)
-- Type: Spawns Goublefaupe
-- Trade Despot's Fortune
-- @pos 101 -20 134
--------------------------
local ID = require ("scripts/zones/Dynamis-Beaucedine/IDs")
--------------------------

require("scripts/zones/Beadeaux/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/weather");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
if (GetMobAction(17326086) == 0 and trade:hasItemQty(3359,1)) then
	player:tradeComplete();
	SpawnMob(17326086):updateClaim(player);
end	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;