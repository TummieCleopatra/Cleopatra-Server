-----------------------------------
-- Area: Feretory
-- NPC: Leovad
-- Melee Boon NPC
-----------------------------------
package.loaded["scripts/zones/Heavens_Tower/TextIDs"] = nil;
-----------------------------------

local ID = require("scripts/zones/Feretory/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local balance = 0;
local calculus = 5000;
local twobud = 10000;
local threebud = 15000;
local fourbud = 20000;
local potshard = 25000;
local demonhorn = 30000;
local testimony = 60000;

local infamy = player:getCurrency("infamy");
local meleeboon = player:getVar("FerretoryMeleeBoon");
local aura = player:getVar("FerretoryAura");

if (trade:hasItemQty( 1156, 1 )) and (meleeboon == 1) and (aura > 0) then
	if (infamy >= calculus) then
    player:delCurrency("infamy", 5000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",2);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",1);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 1: Atk/R.Atk +3, Acc/R.Acc +1.", 0x15);
	else
	balance = calculus - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
	end
	end

if (trade:hasItemQty( 4368, 1 )) and (meleeboon == 2) and (aura > 1) then
	if (infamy >= twobud) then
    player:delCurrency("infamy", 10000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",3);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",2);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 2: Atk/R.Atk +5, Acc/R.Acc +3.", 0x15);
	else
	balance = twobud - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end



if (trade:hasItemQty( 1154, 1 )) and (meleeboon == 3) and (aura > 2) then
	if (infamy >= threebud) then
    player:delCurrency("infamy", 15000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",4);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",3);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 3: Atk/R.Atk +7, Acc/R.Acc +4.", 0x15);
	else
	balance = threebud - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end




if (trade:hasItemQty( 4369, 1 )) and (meleeboon == 4) and (aura > 3) then
	if (infamy >= fourbud) then
    player:delCurrency("infamy", 20000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",5);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",4);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 4: Atk/R.Atk +9, Acc/R.Acc +6", 0x15);
	else
	balance = fourbud - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end


if (trade:hasItemQty( 954, 3 )) and (meleeboon == 5) and (aura > 4) then
	if (infamy >= potshard) then
    player:delCurrency("infamy", 25000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",6);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",5);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 5: Atk/R.Atk +11, Acc/R.Acc +7, Store TP: +1", 0x15);
	else
	balance = potshard - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end

if (trade:hasItemQty( 902, 12 )) and (meleeboon == 6) and (aura > 5) then
	if (infamy >= demonhorn) then
    player:delCurrency("infamy", 30000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",7);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",6);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 6: Atk/R.Atk +13, Acc/R.Acc +9, Store TP: +1", 0x15);
	else
	balance = demonhorn - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end

if (trade:hasItemQty( 1426, 1 )) and (meleeboon == 7) and (aura > 6) then
	if (infamy >= testimony) then
    player:delCurrency("infamy", 60000);
	player:tradeComplete();
	player:setVar("FerretoryMeleeBoon",8);  -- Quest Number you can now accept
	player:setVar("FerretoryMeleeBoonPower",7);
	player:PrintToPlayer("Leovad : Here is your Melee Boon.", 0xD);
	player:PrintToPlayer("Melee Boon Lvl 7: Atk/R.Atk +15, Acc/R.Acc +10, Store TP: +2", 0x15);
	else
	balance = testimony - infamy;
	player:PrintToPlayer( "Leovad : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end
















end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local aura = player:getVar("FerretoryAura");
local meleeboon = player:getVar("FerretoryMeleeBoon");




if (aura == 0) then
player:PrintToPlayer("Leovad : You don't have an aura, therefore I can't help you.", 0xD);
else if (aura > 0) and (meleeboon == 1) then
player:PrintToPlayer("Leovad : Hey, bring me a crawler calculus and 5,000 Infamy Points for a Melee Boon.", 0xD);
else if (aura > 1) and (meleeboon == 2) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me a 2-Leaf Mandragora Bud and 10,000 Infamy Points.", 0xD);
else if (aura > 2) and (meleeboon == 3) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me a 3-Leaf Mandragora Bud and 15,000 Infamy Points.", 0xD);
else if (aura > 3) and (meleeboon == 4) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me a 4-Leaf Mandragora Bud and 20,000 Infamy Points.", 0xD);
else if (aura > 4) and (meleeboon == 5) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me 3 Magic Pot Shards and 25,000 Infamy Points.", 0xD);
else if (aura > 5) and (meleeboon == 6) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me 12 Demon Horns and 30,000 Infamy Points.", 0xD);
else if (aura > 6) and (meleeboon == 7) then
player:PrintToPlayer("Leovad : Looking to upgrade your Melee Boon? Bring me a Warrior Testimony and 60,000 Infamy Points.", 0xD);
else
player:PrintToPlayer("Leovad : Your Aura isn't high enough.", 0xD);
end
end
end
end
end
end
end
end






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