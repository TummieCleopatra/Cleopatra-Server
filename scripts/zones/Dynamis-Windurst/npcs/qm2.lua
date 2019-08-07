-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  qm2 (???)
-- Notes: Spawns Fuu Tzapo the Blessed with Divine Bijou
--        Spawns Eyepiercer with Chapter 13 which drops Odious Feather
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
if (GetMobAction(17543466) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	player:tradeComplete();
	SpawnMob(17543466):updateClaim(player);
	SetDropRate(5005,0,1449,150); -- T Whiteshell
    SetDropRate(5005,0,3416,500); -- Fiendish Tome 13
elseif (GetMobAction(17543466) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	player:tradeComplete();
	SpawnMob(17543466):updateClaim(player);
	SetDropRate(5005,0,1449,150); -- T Whiteshell
    SetDropRate(5005,0,3416,700); -- Fiendish Tome 13
elseif (GetMobAction(17543466) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	player:tradeComplete();
	SpawnMob(17543466):updateClaim(player);
	SetDropRate(5005,0,1449,150); -- T Whiteshell
    SetDropRate(5005,0,3416,900); -- Fiendish Tome 13
elseif (GetMobAction(17543466) == 0 and trade:hasItemQty(3355,1)) then
    player:setVar("DynaWeakener",0);
    player:tradeComplete();
	SpawnMob(17543466):updateClaim(player);
end

-- Spawn for Eyepiercer with Tome 13 Tome is NOT lost

if (GetMobAction(17543345) == 0 and trade:hasItemQty(3416,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17543345):updateClaim(player);
	SetDropRate(5009,0,1449,150); -- T Whiteshell
    SetDropRate(5009,0,3389,300); -- Odious Feather
elseif (GetMobAction(17543345) == 0 and trade:hasItemQty(3416,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17543345):updateClaim(player);
	SetDropRate(5009,0,1449,150); -- T Whiteshell
    SetDropRate(5009,0,3389,5000); -- Odious Feather
elseif (GetMobAction(17543345) == 0 and trade:hasItemQty(3416,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17543345):updateClaim(player);
    SetDropRate(5009,0,1449,150); -- T Whiteshell
    SetDropRate(5009,0,3389,900); -- Odious Feather
elseif (GetMobAction(17543345) == 0 and trade:hasItemQty(3416,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17543345):updateClaim(player);
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