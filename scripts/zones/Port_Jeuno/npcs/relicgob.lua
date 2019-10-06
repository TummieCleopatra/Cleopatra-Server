-----------------------------------
-- Area: Lower Jeuno
--  NPC: Relic Goblin
-- Type: Starts Relic Process changing AF to Relic
-- NOTES:
-- 1st Stage gives Dynamis XYZ Weapon
-- Augment is -5 STR or -5 MND or -5 INT

-----------------------------------
local ID = require("scripts/zones/Port_Jeuno/IDs")
require("scripts/globals/chocobo");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local level = player:getMainLvl();
local job = player:getMainJob();

-- Warrior Trade
	if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1450,10) and (player:getVar("WARAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18292, 1, 519, 5); -- STR-5
			player:setVar("WARAFweapon", 0);
			player:setVar("WARRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18292);
	elseif (job == 1) and (trade:hasItemQty(18292, 1)) and trade:hasItemQty( 1453,20) and (player:getVar("WARRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18292, 1, 519, 4); -- STR-4
			player:setVar("WARRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18292);
	elseif (job == 1) and (trade:hasItemQty(18292, 1)) and trade:hasItemQty( 1456,30) and (player:getVar("WARRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18292, 1, 519, 3); -- STR-3
			player:setVar("WARRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18292);
	elseif (job == 1) and (trade:hasItemQty(18292, 1)) and trade:hasItemQty( 1456,40) and (player:getVar("WARRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18292, 1, 519, 2); -- STR-2
			player:setVar("WARRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18292);
	elseif (job == 1) and (trade:hasItemQty(18292, 1)) and trade:hasItemQty( 1453,50) and (player:getVar("WARRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18292, 1, 519, 1); -- STR-1
			player:setVar("WARRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18292);
	elseif (job == 1) and (trade:hasItemQty(18292, 1)) and trade:hasItemQty( 1450,60) and (player:getVar("WARRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18292, 1); 
			player:setVar("WARRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18292);
	elseif (job == 1) and (trade:hasItemQty(18292, 1)) and trade:hasItemQty( 1453,70) and trade:hasItemQty( 1561,1) and (player:getVar("WARRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Ah, you are almost done.  Here you go.", 0xD);
			player:addItem(18293, 1); 
			player:setVar("WARRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18293);				
    end
	if (job == 1) and (trade:hasItemQty(18214, 1)) and (player:getVar("WARAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Bravura...eventually with 10 L.Jadeshells", 0xD);		
    elseif (job == 1) and (trade:hasItemQty(18292, 1)) and (player:getVar("WARRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Bravura...eventually with 20 Montiont Silverpieces", 0xD);		
    elseif (job == 1) and (trade:hasItemQty(18292, 1)) and (player:getVar("WARRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Bravura...eventually with 30 100 Byne Bills", 0xD);
    elseif (job == 1) and (trade:hasItemQty(18292, 1)) and (player:getVar("WARRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Bravura...eventually with 40 100 Byne Bills", 0xD);
    elseif (job == 1) and (trade:hasItemQty(18292, 1)) and (player:getVar("WARRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Bravura...eventually with 50 Montion Silverpieces", 0xD);
    elseif (job == 1) and (trade:hasItemQty(18292, 1)) and (player:getVar("WARRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Bravura...eventually with 60 L.Jadeshells", 0xD);
    elseif (job == 1) and (trade:hasItemQty(18292, 1)) and (player:getVar("WARRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 Montiont Silverpieces and an Attestation of Force", 0xD);	
    elseif (job == 1) and (trade:hasItemQty(18293, 1)) and (player:getVar("WARRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Serephic Fragment, Necropsyche, and 10,000 Byne Bill and go to Ru'Lude Gardens...", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",4);			
    end
	
			

--------------------------------------------------------
--       MONK TRADE Beat Cesti 17478                  --
--------------------------------------------------------


	if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1453, 10 ) and (player:getVar("MNKAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18262, 1, 519,6);
			player:setVar("MNKAFweapon", 0);
			player:setVar("MNKRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18262);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and trade:hasItemQty( 1456,20) and (player:getVar("MNKRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18262, 1, 519, 4); -- STR-4
			player:setVar("MNKRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18262);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and trade:hasItemQty( 1450,30) and (player:getVar("MNKRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18262, 1, 519, 3); -- STR-3
			player:setVar("MNKRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18262);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and trade:hasItemQty( 1450,40) and (player:getVar("MNKRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18262, 1, 519, 2); -- STR-2
			player:setVar("MNKRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18262);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("MNKRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18262, 1, 519, 1); -- STR-1
			player:setVar("MNKRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18262);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and trade:hasItemQty( 1453,60) and (player:getVar("MNKRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18262, 1); 
			player:setVar("MNKRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18262);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and trade:hasItemQty( 1456,70) and trade:hasItemQty( 1556,1) and (player:getVar("MNKRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : You are almost done.  Here you go.", 0xD);
			player:addItem(18263, 1); 
			player:setVar("MNKRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18263);				
    end	
	if (job == 2) and (trade:hasItemQty(17478, 1)) and (player:getVar("MNKAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Spharai...eventually with 10 Montiont Silverpieces", 0xD);		
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and (player:getVar("MNKRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Spharai...eventually with 20 100 Byne Bills", 0xD);	
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and (player:getVar("MNKRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Spharai...eventually with 30 L.Jadeshells", 0xD);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and (player:getVar("MNKRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Spharai...eventually with 40 L.Jadeshells", 0xD);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and (player:getVar("MNKRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Spharai...eventually with 50 100 Byne Bills", 0xD);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and (player:getVar("MNKRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Spharai...eventually with 60 Montiont Silverpieces", 0xD);
	elseif (job == 2) and (trade:hasItemQty(18262, 1)) and (player:getVar("MNKRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 100 Byne Bills and an Attestation of Might", 0xD);
	elseif (job == 2) and (trade:hasItemQty(18263, 1)) and (player:getVar("MNKRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Mystic Fragment, Necropysche and a 10,000 Byne Bill ad go to Castle O", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",4);				
    end   


	



--------------------------------------------------------
--      WHITE MAGE TRADE Blessed Hammer 17422         --
--------------------------------------------------------

if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1453, 10 ) and (player:getVar("WHMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18322, 1, 519, 5);
			player:setVar("WHMAFweapon", 0);
			player:setVar("WHMRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18322);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and trade:hasItemQty( 1456,20) and (player:getVar("WHMRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18322, 1, 519, 4); -- STR-4
			player:setVar("WHMRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18322);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and trade:hasItemQty( 1450,30) and (player:getVar("WHMRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18322, 1, 519, 3); -- STR-3
			player:setVar("WHMRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18322);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and trade:hasItemQty( 1450,40) and (player:getVar("WHMRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18322, 1, 519, 2); -- STR-2
			player:setVar("WHMRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18322);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("WHMRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18322, 1, 519, 1); -- STR-1
			player:setVar("WHMRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18322);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and trade:hasItemQty( 1453,60) and (player:getVar("WHMRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18322, 1); 
			player:setVar("WHMRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18322);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and trade:hasItemQty( 1456,70) and trade:hasItemQty( 1566,1) and (player:getVar("WHMRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18323, 1); 
			player:setVar("WHMRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18323);				
    end
	if (job == 3) and (trade:hasItemQty(17422, 1)) and (player:getVar("WHMAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Mjolnir...eventually with 10 Montiont Silverpieces", 0xD);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and (player:getVar("WHMRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Mjolnir...eventually with 20 100 Byne Bills", 0xD);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and (player:getVar("WHMRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Mjolnir...eventually with 30 L.Jadeshells", 0xD);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and (player:getVar("WHMRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Mjolnir...eventually with 40 L.Jadeshells", 0xD);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and (player:getVar("WHMRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Mjolnir...eventually with 50 100 Byne Bills", 0xD);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and (player:getVar("WHMRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Mjolnir...eventually with 60 Montiont Silverpieces", 0xD);
	elseif (job == 3) and (trade:hasItemQty(18322, 1)) and (player:getVar("WHMRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 100 Byne Bills and an Attestation of Sacrifice", 0xD);	
	 elseif (job == 3) and (trade:hasItemQty(18323, 1)) and (player:getVar("WHMRelicweapon") == 7) then
		player:PrintToPlayer("Netblyx : Get a Heavenly Fragment, Necropsyche, and R. Goldpiece and go to Zi'Tah", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",4);			
    end



--------------------------------------------------------
--      BLACK MAGE TRADE DUSKY STAFF 17572             --
--------------------------------------------------------



if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1450, 10 ) and (player:getVar("BLMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519,6);
			player:setVar("BLMAFweapon", 0);
			player:setVar("BLMRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1453,20) and (player:getVar("BLMRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519, 4); -- STR-4
			player:setVar("BLMRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1450,30) and (player:getVar("BLMRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519, 3); -- STR-3
			player:setVar("BLMRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1456,40) and (player:getVar("BLMRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519, 2); -- STR-2
			player:setVar("BLMRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("BLMRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519, 1); -- STR-1
			player:setVar("BLMRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1450,60) and (player:getVar("BLMRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1); 
			player:setVar("BLMRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1453,70) and trade:hasItemQty( 1567,1) and (player:getVar("BLMRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18329, 1); 
			player:setVar("BLMRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18329);					
    end
	if (job == 4) and (trade:hasItemQty(17572, 1)) and (player:getVar("BLMAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 10 L.Jadeshells", 0xD);		
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and (player:getVar("BLMRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 20 Montiont Silverpieces", 0xD);	
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and (player:getVar("BLMRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 30 One-Hundred Byne Bills", 0xD);		
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and (player:getVar("BLMRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 40 One-Hundred Byne Bills", 0xD);		
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and (player:getVar("BLMRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 50 Montiont Silverpieces", 0xD);		
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and (player:getVar("BLMRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 60 L.Jadeshells", 0xD);	
	elseif (job == 4) and (trade:hasItemQty(18328, 1)) and (player:getVar("BLMRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 Montiont Silver Pieces and an Attestation of Virtue", 0xD);	
	elseif (job == 4) and (trade:hasItemQty(18329, 1)) and (player:getVar("BLMRelicweapon") == 7) then
		   player:PrintToPlayer("Netblyx :Get a Celestial Fragment, Necropysche and R.Stripeshell and go to the Cauldron", 0xD);
            player:setVar("RELIC_IN_PROGRESS",4);			   
    end	

--------------------------------------------------------
--      RED MAGE TRADE FENCING DEGEN 16829            --
--------------------------------------------------------



if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1456, 10 ) and (player:getVar("RDMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519,6);
			player:setVar("RDMAFweapon", 0);
			player:setVar("RDMRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1456,20) and (player:getVar("RDMRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519, 4); -- STR-4
			player:setVar("RDMRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1450,30) and (player:getVar("RDMRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519, 3); -- STR-3
			player:setVar("RDMRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1450,40) and (player:getVar("RDMRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519, 2); -- STR-2
			player:setVar("RDMRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("RDMRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519, 1); -- STR-1
			player:setVar("RDMRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1453,60) and (player:getVar("RDMRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1); 
			player:setVar("RDMRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1456,70) and trade:hasItemQty( 1558,1) and (player:getVar("RDMRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18275, 1); 
			player:setVar("RDMRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18275);			
    end	
	if (job == 5) and (trade:hasItemQty(16829, 1)) and (player:getVar("RDMAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 10 Montiont Silverpices.", 0xD);	
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and (player:getVar("RDMRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 20 One-Hundred Byne Bills.", 0xD);	
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and (player:getVar("RDMRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 30 L.Jadeshells.", 0xD);	
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and (player:getVar("RDMRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 40 L.Jadeshells.", 0xD);	
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and (player:getVar("RDMRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 50 One-Hundred Byne Bills.", 0xD);	
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and (player:getVar("RDMRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 60 Montiont Silverpices", 0xD);	
	elseif (job == 5) and (trade:hasItemQty(18274, 1)) and (player:getVar("RDMRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 100 Byne Bills and an Attestation of Glory", 0xD);	
	elseif (job == 5) and (trade:hasItemQty(18275, 1)) and (player:getVar("RDMRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Holy Fragment, Necropsyche and an R. Goldpiece and go to the Aery", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",4);				
    end


--------------------------------------------------------
--      THF TRADE MARAUDER'S KNIFE 16764              --
--------------------------------------------------------



if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1453, 10 ) and (player:getVar("THFAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519,6);
			player:setVar("THFAFweapon", 0);
			player:setVar("THFRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1450,20) and (player:getVar("THFRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519, 4); -- STR-4
			player:setVar("THFRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1456,30) and (player:getVar("THFRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519, 3); -- STR-3
			player:setVar("THFRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1456,40) and (player:getVar("THFRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519, 2); -- STR-2
			player:setVar("THFRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1450,50) and (player:getVar("THFRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519, 1); -- STR-1
			player:setVar("THFRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1453,60) and (player:getVar("THFRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1); 
			player:setVar("THFRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1450,70) and trade:hasItemQty( 1557,1) and (player:getVar("THFRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18269, 1); 
			player:setVar("THFRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18269);							
    end		
	if (job == 6) and (trade:hasItemQty(16764, 1)) and (player:getVar("THFAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 10 Montiont Silverpieces", 0xD);	
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and (player:getVar("THFRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 20 L.Jadeshells", 0xD);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and (player:getVar("THFRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 30 One-Hundred Byne Bills", 0xD);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and (player:getVar("THFRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 40 One-Hundred Byne Bills", 0xD);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and (player:getVar("THFRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 50 L.Jadeshells", 0xD);
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and (player:getVar("THFRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 60 Montiont Silverpieces", 0xD);	
	elseif (job == 6) and (trade:hasItemQty(18268, 1)) and (player:getVar("THFRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 L.Jadeshells and an Attestation of Celerity", 0xD);	
	elseif (job == 6) and (trade:hasItemQty(18269, 1)) and (player:getVar("THFRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get n Ornate Fragment, Necropsyche, and 10,000 Byne Bill and go to Zi'Tah", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",18269);				
    end


--------------------------------------------------------
--      PLD TRADE HONOR SWORD 17643                   --
--------------------------------------------------------



if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1453, 10 ) and (player:getVar("PLDAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519,6);
			player:setVar("PLDAFweapon", 0);
			player:setVar("PLDRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1456,20) and (player:getVar("PLDRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519, 4); -- STR-4
			player:setVar("PLDRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1450,30) and (player:getVar("PLDRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519, 3); -- STR-3
			player:setVar("PLDRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1450,40) and (player:getVar("PLDRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519, 2); -- STR-2
			player:setVar("PLDRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("PLDRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1, 519, 1); -- STR-1
			player:setVar("PLDRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1453,60) and (player:getVar("PLDRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18274, 1); 
			player:setVar("PLDRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18274);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and trade:hasItemQty( 1456,70) and trade:hasItemQty( 1558,1) and (player:getVar("PLDRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18275, 1); 
			player:setVar("PLDRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18275);					
    end	
	if (job == 7) and (trade:hasItemQty(17643, 1)) and (player:getVar("PLDAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 10 Montiont Silverpieces.", 0xD);	
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and (player:getVar("PLDRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 20 One-Hundred Byne Bills.", 0xD);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and (player:getVar("PLDRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 30 L.Jadeshells.", 0xD);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and (player:getVar("PLDRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 40 L.Jadeshells.", 0xD);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and (player:getVar("PLDRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 50 One-Hundred Byne Bills.", 0xD);
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and (player:getVar("PLDRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into an Excalibur...eventually with 60 Montiont Silverpieces.", 0xD);			
	elseif (job == 7) and (trade:hasItemQty(18274, 1)) and (player:getVar("PLDRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 100 Byne Bills and an Attestation of Glory", 0xD);
	elseif (job == 7) and (trade:hasItemQty(18275, 1)) and (player:getVar("PLDRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Holy Fragment, Necropsyche and an R. Goldpiece and go to the Aery", 0xD);
            player:setVar("RELIC_IN_PROGRESS",18275);				
    end




--------------------------------------------------------
--      PLD TRADE HEATER SHIELD 12307                 --
--------------------------------------------------------


if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1450, 10 ) and (player:getVar("PLDAFshield") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(15068, 1, 521,6);
			player:setVar("PLDAFshield", 0);
			player:setVar("PLDRelicshield", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 15068);
    elseif (job == 7) and (trade:hasItemQty(15068, 1)) and trade:hasItemQty( 1456, 20 ) and (player:getVar("PLDRelicshield") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(15068, 1, 521,5);
			player:setVar("PLDRelicshield", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 15068);
    elseif (job == 7) and (trade:hasItemQty(15068, 1)) and trade:hasItemQty( 1453, 30 ) and (player:getVar("PLDRelicshield") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(15068, 1, 521,4);
			player:setVar("PLDRelicshield", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 15068);
    elseif (job == 7) and (trade:hasItemQty(15068, 1)) and trade:hasItemQty( 1453, 40 ) and (player:getVar("PLDRelicshield") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(15068, 1, 521,3);
			player:setVar("PLDRelicshield", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 15068);
    elseif (job == 7) and (trade:hasItemQty(15068, 1)) and trade:hasItemQty( 1456, 50 ) and (player:getVar("PLDRelicshield") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(15068, 1, 521,2);
			player:setVar("PLDRelicshield", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 15068);
    elseif (job == 7) and (trade:hasItemQty(15068, 1)) and trade:hasItemQty( 1450, 60 ) and (player:getVar("PLDRelicshield") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(15068, 1, 521,1);
			player:setVar("PLDRelicshield", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 15068);	
    elseif (job == 7) and (trade:hasItemQty(15068, 1)) and trade:hasItemQty( 1456, 70 ) and trade:hasItemQty( 1821, 1 )and (player:getVar("PLDRelicshield") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(15069, 1);
			player:setVar("PLDRelicshield", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 15069);				
			
		
	end	
	
	if (job == 7) and (trade:hasItemQty(15068, 1)) and (player:getVar("PLDAFshield") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Aegis...eventually with 10 L.Jadeshells", 0xD);	
	elseif (job == 7) and (trade:hasItemQty(15068, 1)) and (player:getVar("PLDRelicshield") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into an Aegis...eventually with 20 One-Hundred Byne Bills", 0xD);
	elseif (job == 7) and (trade:hasItemQty(15068, 1)) and (player:getVar("PLDRelicshield") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into an Aegis...eventually with 30 Montiont Silverpieces", 0xD);
	elseif (job == 7) and (trade:hasItemQty(15068, 1)) and (player:getVar("PLDRelicshield") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Aegis...eventually with 40 Montiont Silverpieces", 0xD);
	elseif (job == 7) and (trade:hasItemQty(15068, 1)) and (player:getVar("PLDRelicshield") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into an Aegis...eventually with 50 One-Hundred Byne Bills", 0xD);
	elseif (job == 7) and (trade:hasItemQty(15068, 1)) and (player:getVar("PLDRelicshield") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into an Aegis...eventually with 60 L.Jadeshells", 0xD);	
	elseif (job == 7) and (trade:hasItemQty(15068, 1)) and (player:getVar("PLDRelicshield") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 100 Hundred Byne Bills and an Attestation of Invulnerability", 0xD);	
	elseif (job == 7) and (trade:hasItemQty(15069, 1)) and (player:getVar("PLDRelicshield") == 7) then
			player:PrintToPlayer("Netblyx : Get a Supernal Fragment, Necropsyche, and R. Goldpiece and go to Carp Landing", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",15069);				
    end
	

--------------------------------------------------------
--      DRK TRADE RAVEN SCYTHE 16798                  --
--------------------------------------------------------



if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1450, 10 ) and (player:getVar("DRKAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18304, 1, 519,6);
			player:setVar("DRKAFweapon", 0);
			player:setVar("DRKRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18304);
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and trade:hasItemQty( 1453,20) and (player:getVar("DRKRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18304, 1, 519, 4); -- STR-4
			player:setVar("DRKRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18304);
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and trade:hasItemQty( 1456,30) and (player:getVar("DRKRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18304, 1, 519, 3); -- STR-3
			player:setVar("DRKRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18304);
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and trade:hasItemQty( 1456,40) and (player:getVar("DRKRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18304, 1, 519, 2); -- STR-2
			player:setVar("DRKRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18304);
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and trade:hasItemQty( 1453,50) and (player:getVar("DRKRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18304, 1, 519, 1); -- STR-1
			player:setVar("DRKRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18304);
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and trade:hasItemQty( 1450,60) and (player:getVar("DRKRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18304, 1); 
			player:setVar("DRKRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18304);
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and trade:hasItemQty( 1453,70) and trade:hasItemQty( 1562,1) and (player:getVar("DRKRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18305, 1); 
			player:setVar("DRKRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18305);					
    end		
	if (job == 8) and (trade:hasItemQty(16798, 1)) and (player:getVar("DRKAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Apocalypse...eventually with 10 L.Jadeshells.", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and (player:getVar("DRKRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into an Apocalypse...eventually with 20 Montiont Silverpieces.", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and (player:getVar("DRKRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into an Apocalypse...eventually with 30 One-Hundred Byne Bills.", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and (player:getVar("DRKRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Apocalypse...eventually with 40 One-Hundred Byne Bills.", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and (player:getVar("DRKRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into an Apocalypse...eventually with 50 Montiont Silverpieces.", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and (player:getVar("DRKRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into an Apocalypse...eventually with 60 L.Jadeshells.", 0xD);
	elseif (job == 8) and (trade:hasItemQty(18304, 1)) and (player:getVar("DRKRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 Montiont Silverpieces and an Attestation of Vigor", 0xD);
	elseif (job == 8) and (trade:hasItemQty(18305, 1)) and (player:getVar("DRKRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Tenebrous Fragment, Necropsyche and R. Stripeshell and go to N. Gustaberg.", 0xD);
            player:setVar("RELIC_IN_PROGRESS",18305);				
			
    end




--------------------------------------------------------
--      DRK TRADE GREATSWORD 16590                    --
--------------------------------------------------------



if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1450, 10 ) and (player:getVar("DRKAFweapongs") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18280, 1, 519,6);
			player:setVar("DRKAFweapongs", 0);
			player:setVar("DRKRelicweapongs", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18280);
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and trade:hasItemQty( 1456,20) and (player:getVar("DRKRelicweapongs") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18280, 1, 519, 4); -- STR-4
			player:setVar("DRKRelicweapongsgs", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18280);
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and trade:hasItemQty( 1453,30) and (player:getVar("DRKRelicweapongsgs") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18280, 1, 519, 3); -- STR-3
			player:setVar("DRKRelicweapongs", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18280);
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and trade:hasItemQty( 1453,40) and (player:getVar("DRKRelicweapongs") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18280, 1, 519, 2); -- STR-2
			player:setVar("DRKRelicweapongs", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18280);
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("DRKRelicweapongs") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18280, 1, 519, 1); -- STR-1
			player:setVar("DRKRelicweapongs", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18280);
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and trade:hasItemQty( 1450,60) and (player:getVar("DRKRelicweapongs") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18280, 1); 
			player:setVar("DRKRelicweapongs", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18280);
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and trade:hasItemQty( 1456,70) and trade:hasItemQty( 1559,1) and (player:getVar("DRKRelicweapongs") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18281, 1); 
			player:setVar("DRKRelicweapongs", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18281);				
    end	
	if (job == 8) and (trade:hasItemQty(16590, 1)) and (player:getVar("DRKAFweapongs") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Ragnarok...eventually with 10 L.Jadeshells", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and (player:getVar("DRKRelicweapongs") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into an Ragnarok...eventually with 20 One-Hundred Byne Bills", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and (player:getVar("DRKRelicweapongs") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into an Ragnarok...eventually with 30 Montiont Silverpieces.", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and (player:getVar("DRKRelicweapongs") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Ragnarok...eventually with 40 Montiont Silverpieces.", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and (player:getVar("DRKRelicweapongs") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into an Ragnarok...eventually with 50 One-Hundred Byne Bills", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and (player:getVar("DRKRelicweapongs") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into an Ragnarok...eventually with 60 L.Jadeshells", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18280, 1)) and (player:getVar("DRKRelicweapongs") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 100 Hundred Byne Bills and an Attestation of Rightousness", 0xD);	
	elseif (job == 8) and (trade:hasItemQty(18281, 1)) and (player:getVar("DRKRelicweapongs") == 7) then
			player:PrintToPlayer("Netblyx : Get an Intricate Fragment, Necropsyche and R. Goldpiece and go to the Glacier.", 0xD);
            player:setVar("RELIC_IN_PROGRESS",18281);				
    end


--------------------------------------------------------
--      BST TRADE BARABORI AXE 16680                  --
--------------------------------------------------------



if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1450, 10 ) and (player:getVar("BSTAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18286, 1, 519,6);
			player:setVar("BSTAFweapon", 0);
			player:setVar("BSTRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18286);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and trade:hasItemQty( 1453,20) and (player:getVar("BSTRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18286, 1, 519, 4); -- STR-4
			player:setVar("BSTRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18286);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and trade:hasItemQty( 1456,30) and (player:getVar("BSTRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18286, 1, 519, 3); -- STR-3
			player:setVar("BSTRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18286);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and trade:hasItemQty( 1456,40) and (player:getVar("BSTRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18286, 1, 519, 2); -- STR-2
			player:setVar("BSTRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18286);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and trade:hasItemQty( 1453,50) and (player:getVar("BSTRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18286, 1, 519, 1); -- STR-1
			player:setVar("BSTRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18286);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and trade:hasItemQty( 1450,60) and (player:getVar("BSTRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18286, 1); 
			player:setVar("BSTRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18286);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and trade:hasItemQty( 1453,70) and trade:hasItemQty( 1560,1) and (player:getVar("BSTRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18287, 1); 
			player:setVar("BSTRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18287);				
    end	
	if (job == 9) and (trade:hasItemQty(16680, 1)) and (player:getVar("BSTAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Guttler...eventually with 10 L.Jadeshells", 0xD);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and (player:getVar("BSTRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Guttler...eventually with 20 Montiont Silverpieces", 0xD);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and (player:getVar("BSTRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Guttler...eventually with 30 One-Hundred Byne Bills", 0xD);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and (player:getVar("BSTRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Guttler...eventually with 40 One-Hundred Byne Bills", 0xD);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and (player:getVar("BSTRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Guttler...eventually with 50 Montiont Silverpieces", 0xD);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and (player:getVar("BSTRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Guttler...eventually with 60 L.Jadeshells", 0xD);
	elseif (job == 9) and (trade:hasItemQty(18286, 1)) and (player:getVar("BSTRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 Montiont Silverpieces and an Attestation of Bravery", 0xD);	
	elseif (job == 9) and (trade:hasItemQty(18287, 1)) and (player:getVar("BSTRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Runaeic Fragment, Necropsyche and R. Stripeshell and go to W. Altepa.", 0xD);		
            player:setVar("RELIC_IN_PROGRESS",18287);				
    end



--------------------------------------------------------
--      BRD TRADE PAPER KNIFE 16766                   --
--------------------------------------------------------




if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1453, 10 ) and (player:getVar("BRDAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 520,6);
			player:setVar("BRDAFweapon", 0);
			player:setVar("BRDRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1450,20) and (player:getVar("BRDRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519, 4); -- STR-4
			player:setVar("BRDRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1456,30) and (player:getVar("BRDRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519, 3); -- STR-3
			player:setVar("BRDRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1456,40) and (player:getVar("BRDRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519, 2); -- STR-2
			player:setVar("BRDRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1450,50) and (player:getVar("BRDRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1, 519, 1); -- STR-1
			player:setVar("BRDRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1453,60) and (player:getVar("BRDRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18268, 1); 
			player:setVar("BRDRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18268);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and trade:hasItemQty( 1450,70) and trade:hasItemQty( 1557,1) and (player:getVar("BRDRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18269, 1); 
			player:setVar("BRDRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18269);				
	
    end	
	if (job == 10) and (trade:hasItemQty(16766, 1)) and (player:getVar("BRDAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 10 Montiont Silverpieces", 0xD);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and (player:getVar("BRDRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 20 L.Jadeshells", 0xD);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and (player:getVar("BRDRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 30 One-Hundred Byne Bills", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and (player:getVar("BRDRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 40 One-Hundred Byne Bills", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and (player:getVar("BRDRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 50 L.Jadeshells", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and (player:getVar("BRDRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Mandau...eventually with 60 Montiont Silverpieces", 0xD);
	elseif (job == 10) and (trade:hasItemQty(18268, 1)) and (player:getVar("BRDRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 L.Jadeshells and an Attestation of Celerity.", 0xD);
	elseif (job == 10) and (trade:hasItemQty(18269, 1)) and (player:getVar("BRDRelicweapon") == 7) then
		player:PrintToPlayer("Netblyx : Get an Ornate Fragment, Necropsyche, and 10,000 Byne Bill and go to Zi'Tah", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",18269);			
    end

--------------------------------------------------------
--             BRD TRADE HORN 17352                   --
--------------------------------------------------------

if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1450, 10 ) and (player:getVar("BRDAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18340, 1, 525,6);
			player:setVar("BRDAFweapon", 0);
			player:setVar("BRDRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18340);
    elseif (job == 10) and (trade:hasItemQty(18340, 1)) and trade:hasItemQty( 1456, 20 ) and (player:getVar("BRDRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18340, 1, 525,5);
			player:setVar("BRDRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18340);
    elseif (job == 10) and (trade:hasItemQty(18340, 1)) and trade:hasItemQty( 1453, 30 ) and (player:getVar("BRDRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18340, 1, 525,4);
			player:setVar("BRDRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18340);
    elseif (job == 10) and (trade:hasItemQty(18340, 1)) and trade:hasItemQty( 1453, 40 ) and (player:getVar("BRDRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18340, 1, 525,3);
			player:setVar("BRDRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18340);
    elseif (job == 10) and (trade:hasItemQty(18340, 1)) and trade:hasItemQty( 1456, 50 ) and (player:getVar("BRDRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18340, 1, 525,2);
			player:setVar("BRDRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18340);
    elseif (job == 10) and (trade:hasItemQty(18340, 1)) and trade:hasItemQty( 1450, 60 ) and (player:getVar("BRDRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18340, 1, 525,1);
			player:setVar("BRDRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18340);	
    elseif (job == 10) and (trade:hasItemQty(18340, 1)) and trade:hasItemQty( 1456, 70 ) and trade:hasItemQty( 1569,1) and (player:getVar("BRDRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18341, 1);
			player:setVar("BRDRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18341);			
	end		
	if (job == 10) and (trade:hasItemQty(18340, 1)) and (player:getVar("BRDAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Gjallahorn...eventually with 10 L.Jadeshells", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18340, 1)) and (player:getVar("BRDRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Gjallahorn...eventually with 20 One-Hundred Byne Bills", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18340, 1)) and (player:getVar("BRDRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Gjallahorn...eventually with 30 Montiont Silverpieces", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18340, 1)) and (player:getVar("BRDRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Gjallahorn...eventually with 40 Montiont Silverpieces", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18340, 1)) and (player:getVar("BRDRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Gjallahorn...eventually with 50 One-Hundred Byne Bills", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18340, 1)) and (player:getVar("BRDRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Gjallahorn...eventually with 60 L.Jadeshells", 0xD);	
	elseif (job == 10) and (trade:hasItemQty(18340, 1)) and (player:getVar("BRDRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 One-Hundred Byne Bills and an Attestation of Harmony.", 0xD);				
 	elseif (job == 10) and (trade:hasItemQty(18341, 1)) and (player:getVar("BRDRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Mysternal Fragment, Necropsyche, 10,000 Shells, and go to the Valley of Sorrows.", 0xD);  
            player:setVar("RELIC_IN_PROGRESS",18341);				
	end


--------------------------------------------------------
--      RNG TRADE SNIPING BOW 17188                   --
--------------------------------------------------------



if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1453, 10 ) and (player:getVar("RNGAFweaponbow") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18346, 1, 519,6);
			player:setVar("RNGAFweaponbow", 0);
			player:setVar("RNGRelicbowweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18346);
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and trade:hasItemQty( 1456,20) and (player:getVar("RNGRelicbowweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18346, 1, 519, 4); -- STR-4
			player:setVar("RNGRelicbowweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18346);
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and trade:hasItemQty( 1450,30) and (player:getVar("RNGRelicbowweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18346, 1, 519, 3); -- STR-3
			player:setVar("RNGRelicbowweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18346);
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and trade:hasItemQty( 1450,40) and (player:getVar("RNGRelicbowweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18346, 1, 519, 2); -- STR-2
			player:setVar("RNGRelicbowweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18346);
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("RNGRelicbowweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18346, 1, 519, 1); -- STR-1
			player:setVar("RNGRelicbowweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18346);
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and trade:hasItemQty( 1453,60) and (player:getVar("RNGRelicbowweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18346, 1); 
			player:setVar("RNGRelicbowweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18346);
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and trade:hasItemQty( 1456,70) and trade:hasItemQty( 1568,1) and (player:getVar("RNGRelicbowweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18347, 1); 
			player:setVar("RNGRelicbowweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18347);					
    end	
	if (job == 11) and (trade:hasItemQty(17188, 1)) and (player:getVar("RNGAFweaponbow") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Yoichinoyumi...eventually with 10 Montiont Silverpieces", 0xD);
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and (player:getVar("RNGRelicbowweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Yoichinoyumi...eventually with 20 One-Hundred Byne Bills", 0xD);
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and (player:getVar("RNGRelicbowweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Yoichinoyumi...eventually with 30 L.Jadeshells", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and (player:getVar("RNGRelicbowweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Yoichinoyumi...eventually with 40 L.Jadeshells", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and (player:getVar("RNGRelicbowweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Yoichinoyumi...eventually with 50 One-Hundred Byne Bills.", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and (player:getVar("RNGRelicbowweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Yoichinoyumi...eventually with 60 Montiont Silverpieces", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18346, 1)) and (player:getVar("RNGRelicbowweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 100 Hundred Byne Bills and an Attestation of Transcendence", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18347, 1)) and (player:getVar("RNGRelicbowweapon") == 7) then
		player:PrintToPlayer("Netblyx : Get a Snarled Fragment, Necropsyche, and an R.Goldpiece and go to Cape Teriggan.", 0xD);
            player:setVar("RELIC_IN_PROGRESS",18347);			
    end


--------------------------------------------------------
--      RNG TRADE SERPENTINE GUN 17256                --
--------------------------------------------------------


if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1456, 10 ) and (player:getVar("RNGAFweapongun") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18334, 1, 519,6);
			player:setVar("RNGAFweapongun", 0);
			player:setVar("RNGRelicgunweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18334);
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18334, 1, 519, 3); -- STR-3
			player:setVar("RNGRelicgunweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18334);
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and trade:hasItemQty( 1453,40) and (player:getVar("RNGRelicgunweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18334, 1, 519, 2); -- STR-2
			player:setVar("RNGRelicgunweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18334);
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and trade:hasItemQty( 1450,50) and (player:getVar("RNGRelicgunweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18334, 1, 519, 1); -- STR-1
			player:setVar("RNGRelicgunweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18334);
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and trade:hasItemQty( 1456,60) and (player:getVar("RNGRelicgunweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18334, 1); 
			player:setVar("RNGRelicgunweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18334);
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and trade:hasItemQty( 1450,70) and trade:hasItemQty( 1570,1) and (player:getVar("RNGRelicgunweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18335, 1); 
			player:setVar("RNGRelicgunweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18335);					
    end	
	if (job == 11) and (trade:hasItemQty(17256, 1)) and (player:getVar("RNGAFweapongun") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Annihilator...eventually with 10 One-Hundred Byne Bills", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and (player:getVar("RNGRelicgunweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into an Annihilator...eventually with 20 L.Jadeshells", 0xD);
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and (player:getVar("RNGRelicgunweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into an Annihilator...eventually with 30 Montiont Silverpieces", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and (player:getVar("RNGRelicgunweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Annihilator...eventually with 40 Montiont Silverpieces", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and (player:getVar("RNGRelicgunweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into an Annihilator...eventually with 50 L.Jadeshells", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and (player:getVar("RNGRelicgunweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into an Annihilator...eventually with 60 One-Hundred Byne Bills", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18334, 1)) and (player:getVar("RNGRelicgunweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 L.Jadeshells and an Attestation of Accuracy", 0xD);	
	elseif (job == 11) and (trade:hasItemQty(18335, 1)) and (player:getVar("RNGRelicgunweapon") == 7) then
		player:PrintToPlayer("Netblyx : Get an Ethereal Fragment, Necropsyche, and a 10,0000 Byne Bill and go to Metalworks", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",18335);			
    end

	
--------------------------------------------------------
--            SAM TRADE MAGOROKU 17812                --
--------------------------------------------------------



if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1453, 10 ) and (player:getVar("SAMAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18316, 1, 519,6);
			player:setVar("SAMAFweapon", 0);
			player:setVar("SAMRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18316);
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and trade:hasItemQty( 1450,20) and (player:getVar("SAMRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18316, 1, 519, 4); -- STR-4
			player:setVar("SAMRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18316);
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and trade:hasItemQty( 1456,30) and (player:getVar("SAMRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18316, 1, 519, 3); -- STR-3
			player:setVar("SAMRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18316);
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and trade:hasItemQty( 1456,40) and (player:getVar("SAMRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18316, 1, 519, 2); -- STR-2
			player:setVar("SAMRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18316);
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and trade:hasItemQty( 1450,50) and (player:getVar("SAMRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18316, 1, 519, 1); -- STR-1
			player:setVar("SAMRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18316);
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and trade:hasItemQty( 1453,60) and (player:getVar("SAMRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18316, 1); 
			player:setVar("SAMRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18316);
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and trade:hasItemQty( 1450,70) and trade:hasItemQty( 1565,1) and (player:getVar("SAMRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18317, 1); 
			player:setVar("SAMRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18317);			
    end		
	if (job == 12) and (trade:hasItemQty(17812, 1)) and (player:getVar("SAMAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Amanomurakumo...eventually with 10 Montiont Silverpieces", 0xD);	
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and (player:getVar("SAMRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Amanomurakumo...eventually with 20 L.Jadeshells", 0xD);	
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and (player:getVar("SAMRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Amanomurakumo...eventually with 30 One-Hundred Byne Bills", 0xD);	
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and (player:getVar("SAMRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Amanomurakumo...eventually with 40 One-Hundred Byne Bills", 0xD);	
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and (player:getVar("SAMRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Amanomurakumo...eventually with 50 L.Jadeshells", 0xD);	
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and (player:getVar("SAMRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Amanomurakumo...eventually with 60 Montiont Silverpices", 0xD);	
	elseif (job == 12) and (trade:hasItemQty(18316, 1)) and (player:getVar("SAMRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 L.Jadeshells and an Attestation of Decisiveness", 0xD);
	 elseif (job == 12) and (trade:hasItemQty(18317, 1)) and (player:getVar("SAMRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Divine Fragment, Necropsyche, and an R. Goldpiece and go to Horlais Peak.", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",18317);				
    end	

--------------------------------------------------------
--      NIN TRADE ANJU & ZUSHIO 17771 / 17772         --
--------------------------------------------------------



if (job == 13) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty(17771, 1) and trade:hasItemQty( 1456, 10 ) and (player:getVar("NINAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18310, 1, 523,6);
			player:setVar("NINAFweapon", 0);
			player:setVar("NINRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18310);
	elseif (job == 13) and (trade:hasItemQty(18310, 1)) and trade:hasItemQty( 1450,20) and (player:getVar("NINRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18310, 1, 519, 4); -- STR-4
			player:setVar("NINRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18310);
	elseif (job == 13) and (trade:hasItemQty(18310, 1)) and trade:hasItemQty( 1453,30) and (player:getVar("NINRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18310, 1, 519, 3); -- STR-3
			player:setVar("NINRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18310);
	elseif (job == 13) and (trade:hasItemQty(18310, 1)) and trade:hasItemQty( 1453,40) and (player:getVar("NINRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18310, 1, 519, 2); -- STR-2
			player:setVar("NINRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18310);
	elseif (job == 13) and (trade:hasItemQty(18310, 1)) and trade:hasItemQty( 1450,50) and (player:getVar("NINRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18310, 1, 519, 1); -- STR-1
			player:setVar("NINRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18310);
	elseif (job == 13) and (trade:hasItemQty(18310, 1)) and trade:hasItemQty( 1456,60) and (player:getVar("NINRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18310, 1); 
			player:setVar("NINRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18310);
	elseif (job == 13) and (trade:hasItemQty(18310, 1)) and trade:hasItemQty( 1450,70) and trade:hasItemQty( 1564,1) and (player:getVar("NINRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18311, 1); 
			player:setVar("NINRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18311);				
    end		
if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and (player:getVar("NINAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : Here's the deal, trade me your Zushio and Anju and I'll make it a Kikoku eventually with 10 One-Hundred Byne Bills", 0xD);
elseif (job == 13) and (trade:hasItemQty(18310, 1)) and (player:getVar("NINRelicweapon") == 1) then
			player:PrintToPlayer("Netblyx : I'll make it a Kikoku eventually with 20 L.Jadeshells", 0xD);			
elseif (job == 13) and (trade:hasItemQty(18310, 1)) and (player:getVar("NINRelicweapon") == 2) then
			player:PrintToPlayer("Netblyx : I'll make it a Kikoku eventually with 30 Montiont Silverpieces", 0xD);			
elseif (job == 13) and (trade:hasItemQty(18310, 1)) and (player:getVar("NINRelicweapon") == 3) then
			player:PrintToPlayer("Netblyx : I'll make it a Kikoku eventually with 40 Montiont Silverpieces", 0xD);			
elseif (job == 13) and (trade:hasItemQty(18310, 1)) and (player:getVar("NINRelicweapon") == 4) then
			player:PrintToPlayer("Netblyx : I'll make it a Kikoku eventually with 50 L.Jadeshells", 0xD);			
elseif (job == 13) and (trade:hasItemQty(18310, 1)) and (player:getVar("NINRelicweapon") == 5) then
			player:PrintToPlayer("Netblyx : I'll make it a Kikoku eventually with 60 One-Hundred Byne Bills", 0xD);	
elseif (job == 13) and (trade:hasItemQty(18310, 1)) and (player:getVar("NINRelicweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 L.Jadeshells and an Attestation of Legerity", 0xD);	
elseif (job == 13) and (trade:hasItemQty(18311, 1)) and (player:getVar("NINRelicweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Demoniac Fragment, Necropsyche and 10,000 Byne Bill and go to Sea Serpent Grotto.", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",18311);				
    end	


--------------------------------------------------------
--            DRG TRADE PEREGRINE 16887               --
--------------------------------------------------------



if (job == 14) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1450, 10 ) and (player:getVar("DRGAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18298, 1, 519,6);
			player:setVar("DRGAFweapon", 0);
			player:setVar("DRGRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18298);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and trade:hasItemQty( 1456,20) and (player:getVar("DRGRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18298, 1, 519, 4); -- STR-4
			player:setVar("DRGRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18298);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and trade:hasItemQty( 1453,30) and (player:getVar("DRGRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18298, 1, 519, 3); -- STR-3
			player:setVar("DRGRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18298);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and trade:hasItemQty( 1453,40) and (player:getVar("DRGRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18298, 1, 519, 2); -- STR-2
			player:setVar("DRGRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18298);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("DRGRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18298, 1, 519, 1); -- STR-1
			player:setVar("DRGRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18298);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and trade:hasItemQty( 1450,60) and (player:getVar("DRGRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18298, 1); 
			player:setVar("DRGRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18298);	
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and trade:hasItemQty( 1456,70) and trade:hasItemQty( 1563,1) and (player:getVar("DRGRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18299, 1); 
			player:setVar("DRGRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18299);				
    end		
	if (job == 14) and (trade:hasItemQty(17478, 1)) and (player:getVar("DRGAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Gungnir...eventually with 10 L.Jadeshells", 0xD);	
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and (player:getVar("DRGAFweapon") == 1) then
			player:PrintToPlayer("Netblyx : I can make this into a Gungnir...eventually with 20 One-Hundred Byne Bills", 0xD);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and (player:getVar("DRGAFweapon") == 2) then
			player:PrintToPlayer("Netblyx : I can make this into a Gungnir...eventually with 30 Montiont Silverpieces", 0xD);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and (player:getVar("DRGAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into a Gungnir...eventually with 40 Montiont Silverpieces", 0xD);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and (player:getVar("DRGAFweapon") == 4) then
			player:PrintToPlayer("Netblyx : I can make this into a Gungnir...eventually with 50 One-Hundred Byne Bills", 0xD);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and (player:getVar("DRGAFweapon") == 5) then
			player:PrintToPlayer("Netblyx : I can make this into a Gungnir...eventually with 60 L.Jadeshells", 0xD);
	elseif (job == 14) and (trade:hasItemQty(18298, 1)) and (player:getVar("DRGAFweapon") == 6) then
			player:PrintToPlayer("Netblyx : Bring me 70 100 Byne Bills and an Attestation of Fortitude", 0xD);	
	elseif (job == 14) and (trade:hasItemQty(18299, 1)) and (player:getVar("DRGAFweapon") == 7) then
			player:PrintToPlayer("Netblyx : Get a Stellar Fragment, Necropsyche and an R. Stripeshell and go to Ru'Aun Gardens", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",18299);				
    end


--------------------------------------------------------
--         SMN TRADE DRAGON STAFF 17597               --
--------------------------------------------------------

if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1450, 10 ) and (player:getVar("SMNAFweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 523,6);
			player:setVar("SMNAFweapon", 0);
			player:setVar("SMNRelicweapon", 1);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 15) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1456,20) and (player:getVar("SMNRelicweapon") == 1) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519, 4); -- STR-4
			player:setVar("SMNRelicweapon", 2);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 15) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1453,30) and (player:getVar("SMNRelicweapon") == 2) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519, 3); -- STR-3
			player:setVar("SMNRelicweapon", 3);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 15) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1453,40) and (player:getVar("SMNRelicweapon") == 3) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519, 2); -- STR-2
			player:setVar("SMNRelicweapon", 4);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 15) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1456,50) and (player:getVar("SMNRelicweapon") == 4) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1, 519, 1); -- STR-1
			player:setVar("SMNRelicweapon", 5);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 15) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1450,60) and (player:getVar("SMNRelicweapon") == 5) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18328, 1); 
			player:setVar("SMNRelicweapon", 6);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18328);
	elseif (job == 15) and (trade:hasItemQty(18328, 1)) and trade:hasItemQty( 1453,70) and trade:hasItemQty( 1567,1) and (player:getVar("SMNRelicweapon") == 6) then
             -- Complete the trade..
            player:tradeComplete();
			player:PrintToPlayer("Netblyx : Here you go.", 0xD);
			player:addItem(18329, 1); 
			player:setVar("SMNRelicweapon", 7);
			player:messageSpecial(ID.text.ITEM_OBTAINED, 18329);					
    end		
	if (job == 15) and (trade:hasItemQty(17597, 1)) and (player:getVar("SMNAFweapon") == 3) then
			player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 10 L.Jadeshells", 0xD);	
    elseif (job == 15) and (trade:hasItemQty(18328, 1)) and (player:getVar("SMNRelicweapon") == 1) then
		player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 20 One-Hundred Byne Bills", 0xD);	
    elseif (job == 15) and (trade:hasItemQty(18328, 1)) and (player:getVar("SMNRelicweapon") == 2) then
		player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 30 Montiont Silverpieces", 0xD);	
    elseif (job == 15) and (trade:hasItemQty(18328, 1)) and (player:getVar("SMNRelicweapon") == 3) then
		player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 40 Montiont Silverpieces", 0xD);	
    elseif (job == 15) and (trade:hasItemQty(18328, 1)) and (player:getVar("SMNRelicweapon") == 4) then
		player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 50 One-Hundred Byne Bills", 0xD);	
    elseif (job == 15) and (trade:hasItemQty(18328, 1)) and (player:getVar("SMNRelicweapon") == 5) then
		player:PrintToPlayer("Netblyx : I can make this into an Claustrum...eventually with 60 L.Jadeshells", 0xD);	
    elseif (job == 15) and (trade:hasItemQty(18328, 1)) and (player:getVar("SMNRelicweapon") == 6) then
		player:PrintToPlayer("Netblyx : Bring me 70 100 Byne bills and an Attestation of Virtue", 0xD);	
	elseif (job == 15) and (trade:hasItemQty(18329, 1)) and (player:getVar("SMNRelicweapon") == 7) then
		player:PrintToPlayer("Netblyx : Get a Celestial Fragment, Necropysche and R.Stripeshell and go to the Cauldron", 0xD);	
            player:setVar("RELIC_IN_PROGRESS",18329);			
    end




	


end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local job = player:getMainJob();

	if ((job == 1) and (player:getVar("WARAFweapon") == 3)) or
	((job == 2) and (player:getVar("MNKAFweapon") == 3)) or
	((job == 3) and (player:getVar("WHMAFweapon") == 3)) or
	((job == 4) and (player:getVar("BLMAFweapon") == 3)) or
	((job == 5) and (player:getVar("RDMAFweapon") == 3)) or
	((job == 6) and (player:getVar("THFAFweapon") == 3)) or
	((job == 7) and (player:getVar("PLDAFweapon") == 3)) or
	((job == 7) and (player:getVar("PLDAFshield") == 3)) or
	((job == 8) and (player:getVar("DRKAFweapon") == 3)) or
	((job == 8) and (player:getVar("DRKAFweapongs") == 3)) or
	((job == 9) and (player:getVar("BSTAFweapon") == 3)) or
	((job == 10) and (player:getVar("BRDAFweapon") == 3)) or
	((job == 10) and (player:getVar("BRDAFhorn") == 3)) or
	((job == 10) and (player:getVar("BRDAFharp") == 3)) or
	((job == 11) and (player:getVar("RNGAFweaponbow") == 3)) or
	((job == 11) and (player:getVar("RNGAFweapongun") == 3)) or
	((job == 12) and (player:getVar("SMNAFweapon") == 3)) or
	((job == 13) and (player:getVar("NINAFweapon") == 3)) or
	((job == 14) and (player:getVar("DRGAFweapon") == 3)) or
	((job == 15) and (player:getVar("SAMAFweapon") == 3)) then
	player:PrintToPlayer("Netblyx : You want relic thingy? Trade me your artifact and I tell you a secret", 0xD);
   else
   player:PrintToPlayer("Netblyx : Go away!", 0xD);
   end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
  
-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    
end;
