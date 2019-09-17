--------------------------
-- Area: Dynamis - B
-- NPC: ??? (qm7)
-- Type: Spawns Mildaunegeux
-- Trade Sadist's Fortune
-- @pos 60 -2 -334
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
if (GetMobAction(17326088) == 0 and trade:hasItemQty(3361,1)) then
	player:tradeComplete();
	SpawnMob(17326088):updateClaim(player);
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