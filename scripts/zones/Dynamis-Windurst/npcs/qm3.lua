-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  qm3 (???)
-- Notes: Spawns Naa Yixo the Stillrage with Divine Bijou
--        Spawns Razorclaw with Chapter 14 which drops Odious Holy Water
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
if (GetMobAction(17543467) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	player:tradeComplete();
	SpawnMob(17543467):updateClaim(player);
	SetDropRate(5006,0,1449,150); -- T Whiteshell
    SetDropRate(5006,0,3417,500); -- Fiendish Tome 14
elseif (GetMobAction(17543467) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	player:tradeComplete();
	SpawnMob(17543467):updateClaim(player);
	SetDropRate(5006,0,1449,150); -- T Whiteshell
    SetDropRate(5006,0,3417,700); -- Fiendish Tome 14
elseif (GetMobAction(17543467) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	player:tradeComplete();
	SpawnMob(17543467):updateClaim(player);
	SetDropRate(5006,0,1449,150); -- T Whiteshell
    SetDropRate(5006,0,3417,900); -- Fiendish Tome 14
elseif (GetMobAction(17543467) == 0 and trade:hasItemQty(3355,1)) then
    player:setVar("DynaWeakener",0);
    player:tradeComplete();
	SpawnMob(17543467):updateClaim(player);
end

-- Spawn for RazorClaw with Tome 14

if (GetMobAction(17543357) == 0 and trade:hasItemQty(3417,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17543357):updateClaim(player);
	SetDropRate(5010,0,1449,150); -- T Whiteshell
    SetDropRate(5010,0,3390,300); -- Odious Holy Water
elseif (GetMobAction(17543357) == 0 and trade:hasItemQty(3417,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17543357):updateClaim(player);
	SetDropRate(5010,0,1449,150); -- T Whiteshell
    SetDropRate(5010,0,3390,500); -- Odious Holy Water
elseif (GetMobAction(17543357) == 0 and trade:hasItemQty(3417,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17543357):updateClaim(player);
	SetDropRate(5010,0,1449,150); -- T Whiteshell
    SetDropRate(5010,0,3390,900); -- Odious Holy Water
elseif (GetMobAction(17543357) == 0 and trade:hasItemQty(3417,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17543357):updateClaim(player);
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