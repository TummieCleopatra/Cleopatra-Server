-----------------------------------
-- Area:  Dynamis Jeuno
-- NPC:   qm3 (???)
-- Notes: Ninefingers and Scaleskin
-----------------------------------
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Jeuno/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)

local qm3 = GetNPCByID(17547512);

-- Ninefingers
	
if (GetMobAction(17547486) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17547486):updateClaim(player);
    qm3:setStatus(dsp.status.DISAPPEAR);
elseif (GetMobAction(17547486) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17547486):updateClaim(player);
	qm3:setStatus(dsp.status.DISAPPEAR);
elseif (GetMobAction(17547486) == 0 and trade:hasItemQty(3356,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17547486):updateClaim(player);
	qm3:setStatus(dsp.status.DISAPPEAR);
elseif (GetMobAction(17547486) == 0 and trade:hasItemQty(3356,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17547486):updateClaim(player);
	qm3:setStatus(dsp.status.DISAPPEAR);
end	

-- Scaleskin

if (GetMobAction(17547496) == 0 and trade:hasItemQty(3422,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17547496):updateClaim(player);
	qm3:setStatus(dsp.status.DISAPPEAR);
elseif (GetMobAction(17547496) == 0 and trade:hasItemQty(3422,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17547496):updateClaim(player);
	qm3:setStatus(dsp.status.DISAPPEAR);
elseif (GetMobAction(17547496) == 0 and trade:hasItemQty(3422,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17547496):updateClaim(player);
	qm3:setStatus(dsp.status.DISAPPEAR);
elseif (GetMobAction(17547496) == 0 and trade:hasItemQty(3422,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17547496):updateClaim(player);
	qm3:setStatus(dsp.status.DISAPPEAR);
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