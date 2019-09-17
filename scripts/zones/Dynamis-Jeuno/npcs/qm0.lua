-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Megaboss
-- POS: 0 0 -99 (183)
-----------------------------------
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Jeuno/IDs");

-----------------------------------
-- onTrade
-----------------------------------
function onTrade(player,npc,trade)

local qm0 = GetNPCByID(17547509);

if ((trade:hasItemQty(3392,1)) and (trade:hasItemQty(3393,1)) and (trade:hasItemQty(3394,1)) and (trade:hasItemQty(3395,1))) then
player:addKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,ALABASTER_GRANULES_OF_TIME);
player:tradeComplete();
elseif ((trade:hasItemQty(3392,1)) and (trade:hasItemQty(3393,1)) and (trade:hasItemQty(3394,1))) then
player:addKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,AMBER_GRANULES_OF_TIME);
player:tradeComplete();
elseif ((trade:hasItemQty(3392,1)) and (trade:hasItemQty(3393,1))) then
player:addKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,AZURE_GRANULES_OF_TIME);
player:tradeComplete();
elseif (trade:hasItemQty(3392,1)) then
player:addKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,CRIMSON_GRANULES_OF_TIME);
player:tradeComplete();
end






if (GetMobAction(17547265) == 0 and trade:hasItemQty(3420,1)) and trade:hasItemQty(3421,1) and trade:hasItemQty(3422,1) and trade:hasItemQty(3423,1) and player:hasKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",4);
	SpawnMob(17547265):updateClaim(player);
	qm0:setStatus(STATUS_DISAPPEAR);
	player:delKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);
	player:tradeComplete();
elseif (GetMobAction(17547265) == 0 and trade:hasItemQty(3420,1)) and trade:hasItemQty(3421,1) and trade:hasItemQty(3422,1) and trade:hasItemQty(3423,1) and player:hasKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17547265):updateClaim(player);
	qm0:setStatus(STATUS_DISAPPEAR);	
    player:delKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);
	player:tradeComplete();
elseif (GetMobAction(17547265) == 0 and trade:hasItemQty(3420,1)) and trade:hasItemQty(3421,1) and trade:hasItemQty(3422,1) and trade:hasItemQty(3423,1) and player:hasKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17547265):updateClaim(player);
	qm0:setStatus(STATUS_DISAPPEAR);	
	player:delKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);
	player:tradeComplete();
elseif (GetMobAction(17547265) == 0 and trade:hasItemQty(3420,1)) and trade:hasItemQty(3421,1) and trade:hasItemQty(3422,1) and trade:hasItemQty(3423,1) and player:hasKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME) then
    player:setVar("DynaWeakener",1);
	SpawnMob(17547265):updateClaim(player);
	qm0:setStatus(STATUS_DISAPPEAR);	
	player:delKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);
    player:tradeComplete();	
elseif (GetMobAction(17547265) == 0 and trade:hasItemQty(3420,1)) and trade:hasItemQty(3421,1) and trade:hasItemQty(3422,1) and trade:hasItemQty(3423,1) then
    player:setVar("DynaWeakener",0);
    player:tradeComplete();
	SpawnMob(17547265):updateClaim(player);	
	qm0:setStatus(STATUS_DISAPPEAR);	
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