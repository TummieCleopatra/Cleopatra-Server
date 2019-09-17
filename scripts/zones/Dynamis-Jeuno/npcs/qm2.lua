-----------------------------------
-- Area:  Dynamis Jeuno
-- NPC:   qm2 (???)
-- Notes: Loglimbs and Feralox Honeylips
-----------------------------------
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Jeuno/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

local qm2 = GetNPCByID(17547511);
	
if (GetMobAction(17547291) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17547291):updateClaim(player);
    qm2:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547291) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17547291):updateClaim(player);
	qm2:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547291) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17547291):updateClaim(player);
	qm2:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547291) == 0 and trade:hasItemQty(3356,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17547291):updateClaim(player);
	qm2:setStatus(STATUS_DISAPPEAR);
end	

-- Honey lips

if (GetMobAction(17547494) == 0 and trade:hasItemQty(3421,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17547494):updateClaim(player);
	qm2:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547494) == 0 and trade:hasItemQty(3421,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17547494):updateClaim(player);
	qm2:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547494) == 0 and trade:hasItemQty(3421,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17547494):updateClaim(player);
	qm2:setStatus(STATUS_DISAPPEAR);
elseif (GetMobAction(17547494) == 0 and trade:hasItemQty(3421,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17547494):updateClaim(player);
	qm2:setStatus(STATUS_DISAPPEAR);
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