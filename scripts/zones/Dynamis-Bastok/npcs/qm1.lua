-----------------------------------
-- Area:  Dynamis Bastok
-- NPC:   qm1 (???)
-- Notes: Forgesoul and Manameister
-----------------------------------
local ID = require("scripts/zones/Dynamis-Bastok/IDs")
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Bastok/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
if (GetMobAction(17539307) == 0 and trade:hasItemQty(3354,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17539307):updateClaim(player);
elseif (GetMobAction(17539307) == 0 and trade:hasItemQty(3354,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17539307):updateClaim(player);
elseif (GetMobAction(17539307) == 0 and trade:hasItemQty(3354,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17539307):updateClaim(player);
elseif (GetMobAction(17539307) == 0 and trade:hasItemQty(3354,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17539307):updateClaim(player);
end	


if (GetMobAction(17539188) == 0 and trade:hasItemQty(3410,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17539188):updateClaim(player);
elseif (GetMobAction(17539188) == 0 and trade:hasItemQty(3410,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17539188):updateClaim(player);
elseif (GetMobAction(17539188) == 0 and trade:hasItemQty(3410,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17539188):updateClaim(player);
elseif (GetMobAction(17539188) == 0 and trade:hasItemQty(3410,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17539188):updateClaim(player);
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