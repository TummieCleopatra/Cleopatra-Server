-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  qm1 (???)
-- Notes: Spawns Xuu Bhoqa the Enigma with Divine Bijou
--        Spawns Stentorian with Chapter 12 which drops Odious Necklace
-- Dispalcers weaken the mob
-----------------------------------
package.loaded["scripts/zones/Dynamis-Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
local ID = require("scripts/zones/Dynamis-Windurst/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade,mob)
if (GetMobAction(17543464) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	player:tradeComplete();
	SpawnMob(17543464):updateClaim(player);
	SetDropRate(5004,0,1449,150); -- T Whiteshell
    SetDropRate(5004,0,3415,500); -- Fiendish Tome 12
elseif (GetMobAction(17543464) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	player:tradeComplete();
	SpawnMob(17543464):updateClaim(player);
	SetDropRate(5004,0,1449,150); -- T Whiteshell
    SetDropRate(5004,0,3415,700); -- Fiendish Tome 12
elseif (GetMobAction(17543464) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	player:tradeComplete();
	SpawnMob(17543464):updateClaim(player);
	SetDropRate(5004,0,1449,150); -- T Whiteshell
    SetDropRate(5004,0,3415,900); -- Fiendish Tome 12
elseif (GetMobAction(17543464) == 0 and trade:hasItemQty(3355,1)) then
    player:setVar("DynaWeakener",0);
    player:tradeComplete();
	SpawnMob(17543464):updateClaim(player);
end	


if (GetMobAction(17543294) == 0 and trade:hasItemQty(3415,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17543294):updateClaim(player);
	SetDropRate(5008,0,1449,150); -- T Whiteshell
    SetDropRate(5008,0,3388,300); -- Odious Necklace
elseif (GetMobAction(17543294) == 0 and trade:hasItemQty(3415,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17543294):updateClaim(player);
	SetDropRate(5008,0,1449,150); -- T Whiteshell
    SetDropRate(5008,0,3388,500); -- Odious Necklace
elseif (GetMobAction(17543294) == 0 and trade:hasItemQty(3415,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17543294):updateClaim(player);
	SetDropRate(5008,0,1449,150); -- T Whiteshell
    SetDropRate(5008,0,3388,900); -- Odious Necklace
elseif (GetMobAction(17543294) == 0 and trade:hasItemQty(3415,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17543294):updateClaim(player);
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