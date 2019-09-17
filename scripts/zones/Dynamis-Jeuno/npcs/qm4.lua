-----------------------------------
-- Area:  Dynamis Jeuno
-- NPC:   qm4 (???)
-- Notes: Callusdigit and Tenderpalm
-----------------------------------
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Jeuno/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

local qm4 = GetNPCByID(17547513);

-- Callusdigit 17547300
	
if (GetMobAction(17547300) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17547300):updateClaim(player);
    qm4:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547300) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17547300):updateClaim(player);
	qm4:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547300) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17547300):updateClaim(player);
	qm4:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547300) == 0 and trade:hasItemQty(3356,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17547300):updateClaim(player);
	qm4:setStatus(STATUS_DISAPPEAR);
end	

-- Tenderpalm 17547498

if (GetMobAction(17547498) == 0 and trade:hasItemQty(3423,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17547498):updateClaim(player);
	qm4:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547498) == 0 and trade:hasItemQty(3423,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17547498):updateClaim(player);
	qm4:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547498) == 0 and trade:hasItemQty(3423,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17547498):updateClaim(player);
	qm4:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547498) == 0 and trade:hasItemQty(3423,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17547498):updateClaim(player);
	qm4:setStatus(STATUS_DISAPPEAR);
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