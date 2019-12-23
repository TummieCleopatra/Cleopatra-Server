-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  qm4 (???)
-- Notes: Tee Zaksa the Ceaseless with Divine Bijou
--        Spawns Solemn with Chapter 15 which drops Odious Quipus
-- Dispalcers weaken the mob
-----------------------------------

-----------------------------------

require("scripts/globals/keyitems");
local ID = require("scripts/zones/Dynamis-Windurst/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade,mob)
if (GetMobAction(17543468) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	player:tradeComplete();
	SpawnMob(17543468):updateClaim(player);
	SetDropRate(5007,0,1449,150); -- T Whiteshell
	SetDropRate(5007,0,3418,500); -- Fiendish Tome 15
elseif (GetMobAction(17543468) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	player:tradeComplete();
	SpawnMob(17543468):updateClaim(player);
	SetDropRate(5007,0,1449,150); -- T Whiteshell
	SetDropRate(5007,0,3418,700); -- Fiendish Tome 15
elseif (GetMobAction(17543468) == 0 and trade:hasItemQty(3355,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	player:tradeComplete();
	SpawnMob(17543468):updateClaim(player);
	SetDropRate(5007,0,1449,150); -- T Whiteshell
	SetDropRate(5007,0,3418,900); -- Fiendish Tome 15
elseif (GetMobAction(17543468) == 0 and trade:hasItemQty(3355,1)) then
    player:setVar("DynaWeakener",0);
    player:tradeComplete();
	SpawnMob(17543468):updateClaim(player);
end

-- Spawn for Solemn with Tome 15

if (GetMobAction(17543375) == 0 and trade:hasItemQty(3418,1) and trade:hasItemQty(3853,3)) then
	player:setVar("DynaWeakener",3);
	SpawnMob(17543375):updateClaim(player);
	SetDropRate(5011,0,1449,150); -- T Whiteshell
    SetDropRate(5011,0,3391,300); -- Odious Quipus
elseif (GetMobAction(17543375) == 0 and trade:hasItemQty(3418,1) and trade:hasItemQty(3853,2)) then
	player:setVar("DynaWeakener",2);
	SpawnMob(17543375):updateClaim(player);
	SetDropRate(5011,0,1449,150); -- T Whiteshell
    SetDropRate(5011,0,3391,500); -- Odious Quipus
elseif (GetMobAction(17543375) == 0 and trade:hasItemQty(3418,1) and trade:hasItemQty(3853,1)) then
	player:setVar("DynaWeakener",1);
	SpawnMob(17543375):updateClaim(player);
	SetDropRate(5011,0,1449,150); -- T Whiteshell
    SetDropRate(5011,0,3391,900); -- Odious Quipus
elseif (GetMobAction(17543375) == 0 and trade:hasItemQty(3418,1)) then
player:setVar("DynaWeakener",0);
	SpawnMob(17543375):updateClaim(player);
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