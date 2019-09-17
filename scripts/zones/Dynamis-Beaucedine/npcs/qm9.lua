--------------------------
-- Area: Dynamis - B
-- NPC: ??? (qm9)
-- Type: Spawns Dagourmarche
-- Trade Traitors's Fortune
-- @pos -176,-40,-219
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
if (GetMobAction(17326090) == 0 and trade:hasItemQty(3363,1)) then
	player:tradeComplete();
	SpawnMob(17326090):updateClaim(player);
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