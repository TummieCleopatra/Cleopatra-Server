-----------------------------------
-- Area:  Dynamis Bastok
-- NPC:   qm4 (???)
-- Notes: Truesteel and Fallsplitter
-----------------------------------
local ID = require("scripts/zones/Dynamis-Bastok/IDs")
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Bastok/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
if (GetMobAction(17539311) == 0 and trade:hasItemQty(3354,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17539311):updateClaim(player);
elseif (GetMobAction(17539311) == 0 and trade:hasItemQty(3354,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17539311):updateClaim(player);
elseif (GetMobAction(17539311) == 0 and trade:hasItemQty(3354,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17539311):updateClaim(player);
elseif (GetMobAction(17539311) == 0 and trade:hasItemQty(3354,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17539311):updateClaim(player);
end	


if (GetMobAction(17539147) == 0 and trade:hasItemQty(3413,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17539147):updateClaim(player);
elseif (GetMobAction(17539147) == 0 and trade:hasItemQty(3413,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17539147):updateClaim(player);
elseif (GetMobAction(17539147) == 0 and trade:hasItemQty(3413,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17539147):updateClaim(player);
elseif (GetMobAction(17539147) == 0 and trade:hasItemQty(3413,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17539147):updateClaim(player);
end
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	

				player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);		
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;