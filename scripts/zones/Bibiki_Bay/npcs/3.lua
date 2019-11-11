-----------------------------------
-- Area: Bibiki Bay
-- NPC:  ??? Spawns Mob for High Artifact
-- @pos -602 -3 -686
-----------------------------------
package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;
-----------------------------------

local ID = require("scripts/zones/Bibiki_Bay/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local balance = 0;
    local payment = 60000;
    local pinfamy = player:getCurrency("infamy");

    if (player:getVar("WARHAWeapon") == 2 and trade:hasItemQty(18505,1)) then
        player:tradeComplete();
        player:setVar("WARHAWeapon",0);
        player:setVar("WARHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("MNKHAWeapon") == 2 and trade:hasItemQty(18764,1)) then
        player:tradeComplete();
        player:setVar("MNKHAWeapon",0);
        player:setVar("MNKHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("WHMHAWeapon") == 2 and trade:hasItemQty(18870,1)) then
        player:tradeComplete();
        player:setVar("WHMHAWeapon",0);
        player:setVar("WHMHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("BLMHAWeapon") == 2 and trade:hasItemQty(18589,1)) then
        player:tradeComplete();
        player:setVar("BLMHAWeapon",0);
        player:setVar("BLMHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("RDMHAWeapon") == 2 and trade:hasItemQty(17761,1)) then
        player:tradeComplete();
        player:setVar("RDMHAWeapon",0);
        player:setVar("RDMHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("THFHAWeapon") == 2 and trade:hasItemQty(19115,1)) then
        player:tradeComplete();
        player:setVar("THFHAWeapon",0);
        player:setVar("THFHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("PLDHAWeapon") == 2 and trade:hasItemQty(17762,1)) then
        player:tradeComplete();
        player:setVar("PLDHAWeapon",0);
        player:setVar("PLDHAFight",1);
        player:PrintToPlayer("Your shield begins to react violently!", 0xD);
    elseif (player:getVar("PLDHAshield") == 2 and trade:hasItemQty(12307,1)) then
        player:tradeComplete();
        player:setVar("PLDHAshield",0);
        player:setVar("PLDHAFightShield",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("DRKHAWeapon") == 2 and trade:hasItemQty(18995,1)) then
        player:tradeComplete();
        player:setVar("DRKHAWeapon",0);
        player:setVar("DRKHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("BSTHAWeapon") == 2 and trade:hasItemQty(17966,1)) then
        player:tradeComplete();
        player:setVar("BSTHAWeapon",0);
        player:setVar("BSTHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("BRDHAWeapon") == 2 and trade:hasItemQty(19116,1)) then
        player:tradeComplete();
        player:setVar("BRDHAWeapon",0);
        player:setVar("BRDHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("RNGHAWeapon") == 2 and trade:hasItemQty(18763,1)) then
        player:tradeComplete();
        player:setVar("RNGHAWeapon",0);
        player:setVar("RNGHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("SAMHAWeapon") == 2 and trade:hasItemQty(18452,1)) then
        player:tradeComplete();
        player:setVar("SAMHAWeapon",0);
        player:setVar("SAMHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("NINHAWeapon") == 2 and trade:hasItemQty(19275,1)) then
        player:tradeComplete();
        player:setVar("NINHAWeapon",0);
        player:setVar("NINHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("DRGHAWeapon") == 2 and trade:hasItemQty(19303,1)) then
        player:tradeComplete();
        player:setVar("DRGHAWeapon",0);
        player:setVar("DRGHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("SMNHAWeapon") == 2 and trade:hasItemQty(18601,1)) then
        player:tradeComplete();
        player:setVar("SMNHAWeapon",0);
        player:setVar("SMNHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("BLUHAWeapon") == 2 and trade:hasItemQty(17763,1)) then
        player:tradeComplete();
        player:setVar("BLUHAWeapon",0);
        player:setVar("BLUHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("CORHAWeapon") == 2 and trade:hasItemQty(18737,1)) then
        player:tradeComplete();
        player:setVar("CORHAWeapon",0);
        player:setVar("CORHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("PUPHAWeapon") == 2 and trade:hasItemQty(18765,1)) then
        player:tradeComplete();
        player:setVar("PUPHAWeapon",0);
        player:setVar("PUPHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("DNCHAWeapon") == 2 and trade:hasItemQty(19117,1)) then
        player:tradeComplete();
        player:setVar("DNCHAWeapon",0);
        player:setVar("DNCHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("SCHHAWeapon") == 2 and trade:hasItemQty(18602,1)) then
        player:tradeComplete();
        player:setVar("SCHHAWeapon",0);
        player:setVar("SCHHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    elseif (player:getVar("GEOHAWeapon") == 2 and trade:hasItemQty(21460,1)) then
        player:tradeComplete();
        player:setVar("GEOHAWeapon",0);
        player:setVar("GEOHAFight",1);
        player:PrintToPlayer("Your Matre Bell begins to react violently!", 0xD);
    elseif (player:getVar("RUNHAWeapon") == 2 and trade:hasItemQty(20781,1)) then
        player:tradeComplete();
        player:setVar("RUNHAWeapon",0);
        player:setVar("RUNHAFight",1);
        player:PrintToPlayer("Your weapon begins to react violently!", 0xD);
    end

    if (pinfamy >= payment) then
        player:delCurrency("infamy", payment);
        player:tradeComplete();
    end

    if (trade:hasItemQty(1404, 1 )) and (trade:hasItemQty(1405, 1)) and (trade:hasItemQty(1406, 1)) and (trade:hasItemQty(1407, 1)) then
      -- Obtain High Artifact
      if (pinfamy >= payment) then
        if (player:getVar("WARHAFight") == 3) then  -- WAR
            player:addItem(18505,1,143,1,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18505);
            player:setVar("WARHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("MNKHAFight") == 3) then  -- MNK
            player:addItem(18764,1,194,1,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18764);
            player:setVar("MNKHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("WHMHAFight") == 3) then  -- WHM
            player:addItem(18870,1,329,9,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18870);
            player:setVar("WHMHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("BLMHAFight") == 3) then  -- BLM
            player:addItem(18589,1,362,4,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18589);
            player:setVar("BLMHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("RDMHAFight") == 3) then  -- RDM
            player:addItem(17761,1,896,1,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,17761);
            player:setVar("RDMHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("THFHAFight") == 3) then  -- THF
            player:addItem(19115,1,147,0,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,19115);
            player:setVar("THFHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("PLDHAFight") == 3) then  -- PLD
            player:addItem(17762,1,137,0,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,17762);
            player:setVar("PLDHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("PLDHAFightShield") == 3) then  -- PLD Shield
            player:addItem(12407,1)
            player:messageSpecial(ID.text.ITEM_OBTAINED,12407);
            player:setVar("PLDHAFightShield",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("DRKHAFight") == 3) then  -- DRK
            player:addItem(18955,1,343,9,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18995);
            player:setVar("DRKHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("BSTHAFight") == 3) then  -- BST
            player:addItem(17966,1,124,6,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,17966);
            player:setVar("BSTHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("BRDHAFight") == 3) then  -- BRD
            player:addItem(19116,1,322,4,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,19116);
            player:setVar("BRDHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("RNGHAFight") == 3) then  -- RNG
            player:addItem(18736,1,139,4,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18763);
            player:setVar("RNGHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("SAMHAFight") == 3) then  -- SAM
            player:addItem(18452,1,353,2,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18452);
            player:setVar("SAMHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("NINHAFight") == 3) then  -- NIN
            player:addItem(19275,1,140,4,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,19275);
            player:setVar("NINHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("DRGHAFight") == 3) then  -- DRG
            player:addItem(19303,1,124,6,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,19303);
            player:setVar("DRGHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("SMNHAFight") == 3) then  -- SMN
            player:addItem(18601,1,321,2,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18601);
            player:setVar("SMNHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("BLUHAFight") == 3) then  -- BLU
            player:addItem(17763,1,299,9,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,17763);
            player:setVar("BLUHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("CORHAFight") == 3) then  -- COR
            player:addItem(18737,1,133,14,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18737);
            player:setVar("CORHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("PUPHAFight") == 3) then  -- PUP
            player:addItem(18765,1,124,6,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18765);
            player:setVar("PUPHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("DNCHAFight") == 3) then  -- DNC
            player:addItem(19117,1,330,9,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,19117);
            player:setVar("DNCHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("SCHHAFight") == 3) then  -- SCH
            player:addItem(18602,1,1249,14,59,0)
            player:messageSpecial(ID.text.ITEM_OBTAINED,18602);
            player:setVar("SCHHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("GEOHAFight") == 3) then  -- GEO
            player:addItem(21460,1,11,4,140,4,1250,29,2030,1) -- MP + 70, Fast Cast + 5, Indi Duration + 30, Hidden Geomancy +2
            player:messageSpecial(ID.text.ITEM_OBTAINED,21460);
            player:setVar("GEOHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        elseif (player:getVar("RUNHAFight") == 3) then  -- RUN
            player:addItem(20783,1,133,9,54,4,39,6,59,0) -- MAB+10, Phys DMG Taken -4, Enmity +7
            player:messageSpecial(ID.text.ITEM_OBTAINED,20783);
            player:setVar("RUNHAFight",4);
            player:delCurrency("infamy", payment);
            player:tradeComplete();
        end
   else
        balance = payment - pinfamy;
        player:PrintToPlayer( "??? : You can't fool me, you need "..balance.." more infamy.", 0xD);
      end

      -- Standard Message
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-- Spawn Mechanism

    if ((player:getVar("WARHAFight") == 1) or (player:getVar("MNKHAFight") == 1) or (player:getVar("WHMHAFight") == 1) or (player:getVar("BLMHAFight") == 1) or (player:getVar("RDMHAFight") == 1) or
       (player:getVar("THFHAFight") == 1) or (player:getVar("PLDHAFight") == 1) or (player:getVar("DRKHAFight") == 1) or (player:getVar("BSTHAFight") == 1) or (player:getVar("BRDHAFight") == 1) or
       (player:getVar("RNGHAFight") == 1) or (player:getVar("SAMHAFight") == 1) or (player:getVar("NINHAFight") == 1) or (player:getVar("DRGHAFight") == 1) or (player:getVar("SMNHAFight") == 1) or
       (player:getVar("BLUHAFight") == 1) or (player:getVar("CORHAFight") == 1) or (player:getVar("PUPHAFight") == 1) or (player:getVar("DNCHAFight") == 1) or (player:getVar("SCHHAFight") == 1) or
       (player:getVar("PLDHAFightShield") == 1)) then
       SpawnMob(16793977):updateEnmity(player);
       player:PrintToPlayer("You feel an ominous presence nearby...", 0xD);
    end


    if ((player:getVar("WARHAFight") == 2) or (player:getVar("MNKHAFight") == 2) or (player:getVar("WHMHAFight") == 2) or (player:getVar("BLMHAFight") == 2) or (player:getVar("RDMHAFight") == 2) or
       (player:getVar("THFHAFight") == 2) or (player:getVar("PLDHAFight") == 2) or (player:getVar("DRKHAFight") == 2) or (player:getVar("BSTHAFight") == 2) or (player:getVar("BRDHAFight") == 2) or
       (player:getVar("RNGHAFight") == 2) or (player:getVar("SAMHAFight") == 2) or (player:getVar("NINHAFight") == 2) or (player:getVar("DRGHAFight") == 2) or (player:getVar("SMNHAFight") == 2) or
       (player:getVar("BLUHAFight") == 2) or (player:getVar("CORHAFight") == 2) or (player:getVar("PUPHAFight") == 2) or (player:getVar("DNCHAFight") == 2) or (player:getVar("SCHHAFight") == 2) or
       (player:getVar("PLDHAFightShield") == 2)) then
       player:PrintToPlayer("??? : Bring more power to me!!!  Four seals of the Gods and 60,000 Infamy!!", 0xD);
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
end