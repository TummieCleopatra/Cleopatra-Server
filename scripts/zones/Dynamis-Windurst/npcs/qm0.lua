-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  qm0 (???)
-- Notes: Spawns Megaboss
-----------------------------------

-----------------------------------

require("scripts/globals/keyitems");
local ID = require("scripts/zones/Dynamis-Windurst/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
if ((trade:hasItemQty(3388,1)) and (trade:hasItemQty(3389,1)) and (trade:hasItemQty(3390,1)) and (trade:hasItemQty(3391,1))) then
player:addKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,ALABASTER_GRANULES_OF_TIME);
player:tradeComplete();
elseif ((trade:hasItemQty(3388,1)) and (trade:hasItemQty(3389,1)) and (trade:hasItemQty(3390,1))) then
player:addKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,AMBER_GRANULES_OF_TIME);
player:tradeComplete();
elseif ((trade:hasItemQty(3388,1)) and (trade:hasItemQty(3389,1))) then
player:addKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,AZURE_GRANULES_OF_TIME);
player:tradeComplete();
elseif (trade:hasItemQty(3388,1)) then
player:addKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,CRIMSON_GRANULES_OF_TIME);
player:tradeComplete();
end

if (GetMobAction(17543169) == 0 and trade:hasItemQty(3415,1)) and trade:hasItemQty(3416,1) and trade:hasItemQty(3417,1) and trade:hasItemQty(3418,1) and player:hasKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",4);
	player:tradeComplete();
	SpawnMob(17543169):updateClaim(player);
	player:delKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);
elseif (GetMobAction(17543169) == 0 and trade:hasItemQty(3415,1)) and trade:hasItemQty(3416,1) and trade:hasItemQty(3417,1) and trade:hasItemQty(3418,1) and player:hasKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",2);
	player:tradeComplete();
	SpawnMob(17543169):updateClaim(player);
    player:delKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);
elseif (GetMobAction(17543169) == 0 and trade:hasItemQty(3415,1)) and trade:hasItemQty(3416,1) and trade:hasItemQty(3417,1) and trade:hasItemQty(3418,1) and player:hasKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME) then
	player:setVar("DynaWeakener",2);
	player:tradeComplete();
	SpawnMob(17543169):updateClaim(player);
	player:delKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);
elseif (GetMobAction(17543169) == 0 and trade:hasItemQty(3415,1)) and trade:hasItemQty(3416,1) and trade:hasItemQty(3417,1) and trade:hasItemQty(3418,1) and player:hasKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME) then
    player:setVar("DynaWeakener",1);
	player:tradeComplete();
	SpawnMob(17543169):updateClaim(player);
	player:delKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);
elseif (GetMobAction(17543169) == 0 and trade:hasItemQty(3415,1)) and trade:hasItemQty(3416,1) and trade:hasItemQty(3417,1) and trade:hasItemQty(3418,1) then
player:setVar("DynaWeakener",0);
    player:tradeComplete();
	SpawnMob(17543169):updateClaim(player);
end

end;




-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)



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