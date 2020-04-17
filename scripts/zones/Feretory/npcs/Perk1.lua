-----------------------------------
-- Area: Ferretory
-- NPC: Aengus
-- Standard Info NPC
-----------------------------------

-----------------------------------

local ID = require("scripts/zones/Feretory/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local balance = 0;
local calculus = 20000;
local twobud = 25000;
local threebud = 30000;
local fourbud = 35000;
local potshard = 40000;
local demonhorn = 50000;
local testimony = 75000;

local infamy = player:getCurrency("infamy");
local mageboon = player:getVar("FerretoryMageBoon");
local aura = player:getVar("FerretoryAura");

if (trade:hasItemQty( 1156, 1 )) and (mageboon == 1) and (aura > 0) then
	if (infamy >= calculus) then
    player:delCurrency("infamy", 20000);
	player:tradeComplete();
	player:setVar("FerretoryMageBoon",2);  -- Quest Number you can now accept
	player:setVar("FerretoryMageBoonPower",1);
	player:PrintToPlayer("Dolan-Nolan : Here is your Mage Boon.", 0xD);
	player:PrintToPlayer("Mage Boon Lvl 1: Magic Attack Bonus +1, Magic Accuracy +1", 0x15);
	else
	balance = calculus - infamy;
	player:PrintToPlayer( "Dolan-Nolan : You need "..balance.." more Infamy Points to continue.", 0xD);
	end
	end

if (trade:hasItemQty( 4368, 1 )) and (mageboon == 2) and (aura > 1) then
	if (infamy >= twobud) then
    player:delCurrency("infamy", 25000);
	player:tradeComplete();
	player:setVar("FerretoryMageBoon",3);  -- Quest Number you can now accept
	player:setVar("FerretoryMageBoonPower",2);
	player:PrintToPlayer("Dolan-Nolan : Here is your Mage Boon.", 0xD);
	player:PrintToPlayer("Mage Boon Lvl 2: Magic Attack Bonus +2, Magic Accuracy +2", 0x15);
	else
	balance = twobud - infamy;
	player:PrintToPlayer( "Dolan-Nolan : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end



if (trade:hasItemQty( 1154, 1 )) and (mageboon == 3) and (aura > 2) then
	if (infamy >= threebud) then
    player:delCurrency("infamy", 30000);
	player:tradeComplete();
	player:setVar("FerretoryMageBoon",4);  -- Quest Number you can now accept
	player:setVar("FerretoryMageBoonPower",3);
	player:PrintToPlayer("Dolan-Nolan : Here is your Mage Boon.", 0xD);
	player:PrintToPlayer("Mage Boon Lvl 3: Magic Attack Bonus +4, Magic Accuracy +3", 0x15);
	else
	balance = threebud - infamy;
	player:PrintToPlayer( "Dolan-Nolan : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end




if (trade:hasItemQty( 4369, 1 )) and (mageboon == 4) and (aura > 3) then
	if (infamy >= fourbud) then
    player:delCurrency("infamy", 35000);
	player:tradeComplete();
	player:setVar("FerretoryMageBoon",5);  -- Quest Number you can now accept
	player:setVar("FerretoryMageBoonPower",4);
	player:PrintToPlayer("Dolan-Nolan : Here is your Mage Boon.", 0xD);
	player:PrintToPlayer("Mage Boon Lvl 4: Magic Attack Bonus +5, Magic Accuracy +4", 0x15);
	else
	balance = fourbud - infamy;
	player:PrintToPlayer( "Dolan-Nolan : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end


if (trade:hasItemQty( 954, 3 )) and (mageboon == 5) and (aura > 4) then
	if (infamy >= potshard) then
    player:delCurrency("infamy", 40000);
	player:tradeComplete();
	player:setVar("FerretoryMageBoon",6);  -- Quest Number you can now accept
	player:setVar("FerretoryMageBoonPower",5);
	player:PrintToPlayer("Dolan-Nolan : Here is your Mage Boon.", 0xD);
	player:PrintToPlayer("Mage Boon Lvl 5: Magic Attack Bonus +7, FMagic Accuracy +5, Cure Potency+1%", 0x15);
	else
	balance = potshard - infamy;
	player:PrintToPlayer( "Dolan-Nolan : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end


if (trade:hasItemQty( 902, 12 )) and (mageboon == 6) and (aura > 5) then
	if (infamy >= demonhorn) then
    player:delCurrency("infamy", 50000);
	player:tradeComplete();
	player:setVar("FerretoryMageBoon",7);  -- Quest Number you can now accept
	player:setVar("FerretoryMageBoonPower",6);
	player:PrintToPlayer("Dolan-Nolan : Here is your Mage Boon.", 0xD);
	player:PrintToPlayer("Mage Boon Lvl 5: Magic Attack Bonus +8, FMagic Accuracy +6, Cure Potency+2%", 0x15);
	else
	balance = demonhorn - infamy;
	player:PrintToPlayer( "Dolan-Nolan : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end


if (trade:hasItemQty( 1428, 1 )) and (mageboon == 7) and (aura > 6) then
	if (infamy >= testimony) then
    player:delCurrency("infamy", 75000);
	player:tradeComplete();
	player:setVar("FerretoryMageBoon",8);  -- Quest Number you can now accept
	player:setVar("FerretoryMageBoonPower",7);
	player:PrintToPlayer("Dolan-Nolan : Here is your Mage Boon.", 0xD);
	player:PrintToPlayer("Mage Boon Lvl 5: Magic Attack Bonus +10, FMagic Accuracy +7, Cure Potency+3%", 0x15);
	else
	balance = testimony - infamy;
	player:PrintToPlayer( "Dolan-Nolan : You need "..balance.." more Infamy Points to continue.", 0xD);
    end
	end

















end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local aura = player:getVar("FerretoryAura");
local mageboon = player:getVar("FerretoryMageBoon");




if (aura == 0) then
player:PrintToPlayer("Dolan-Nolan : Don'taru bother me with your presence until you have an aura", 0xD);
elseif (aura > 0) and (mageboon == 1) then
player:PrintToPlayer("Dolan-Nolan : Hey, bring me a crawler calculus and 20,000 Infamy Points for a Mage Boon.", 0xD);
elseif (aura > 1) and (mageboon == 2) then
player:PrintToPlayer("Dolan-Nolan : Looking to upgrade your Mage Boon? Bring me a 2-Leaf Mandragora Bud and 25,000 Infamy Points.", 0xD);
elseif (aura > 2) and (mageboon == 3) then
player:PrintToPlayer("Dolan-Nolan : Looking to upgrade your Mage Boon? Bring me a 3-Leaf Mandragora Bud and 30,000 Infamy Points.", 0xD);
elseif (aura > 3) and (mageboon == 4) then
player:PrintToPlayer("Dolan-Nolan : Looking to upgrade your Mage Boon? Bring me a 4-Leaf Mandragora Bud and 35,000 Infamy Points.", 0xD);
elseif (aura > 4) and (mageboon == 5) then
player:PrintToPlayer("Dolan-Nolan : Looking to upgrade your Mage Boon? Bring me 3 Magic Pot Shards and 40,000 Infamy Points.", 0xD);
elseif (aura > 5) and (mageboon == 6) then
player:PrintToPlayer("Dolan-Nolan : Looking to upgrade your Mage Boon? Bring me 12 Demon Horns and 50,000 Infamy Points.", 0xD);
elseif (aura > 6) and (mageboon == 7) then
player:PrintToPlayer("Dolan-Nolan : Looking to upgrade your Mage Boon? Bring me a White Mage Testimony and 75,000 Infamy Points.", 0xD);
else
player:PrintToPlayer("Dolan-Nolan : Your Aura isn't high enough.", 0xD);
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


