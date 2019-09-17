-----------------------------------
-- Area:  Dynamis San d'Oria
-- NPC:   qm4 (???)
-- Notes: Spawns Bjakdek and Djokvuuk
-- Uses Chapter 5 Tome and Odious Strongbox
-----------------------------------
local ID = require("scripts/zones/Dynamis-San_dOria/IDs")
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-San_dOria/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
if (GetMobAction(17535032) == 0 and trade:hasItemQty(3353,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17535032):updateClaim(player);
elseif (GetMobAction(17535032) == 0 and trade:hasItemQty(3353,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17535032):updateClaim(player);
elseif (GetMobAction(17535032) == 0 and trade:hasItemQty(3353,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17535032):updateClaim(player);
elseif (GetMobAction(17535032) == 0 and trade:hasItemQty(3353,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17535032):updateClaim(player);
end	



if (GetMobAction(17535211) == 0 and trade:hasItemQty(3408,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17535211):updateClaim(player);
elseif (GetMobAction(17535211) == 0 and trade:hasItemQty(3408,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17535211):updateClaim(player);
elseif (GetMobAction(17535211) == 0 and trade:hasItemQty(3408,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17535211):updateClaim(player);
elseif (GetMobAction(17535211) == 0 and trade:hasItemQty(3408,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17535211):updateClaim(player);
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