-----------------------------------
-- Area: Port Jeuno
--  NPC: Oboro
-- Type: Artifact Weapon Upgrader and Relic Upgrader
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
  if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(18214, 1, 45, 16);
    player:setVar("WARAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18214);

  end
  if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("WARAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(18214, 1, 45, 25, 25, 4); -- Attack +5
    player:setVar("WARAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18214);

  end
  if (job == 1) and (trade:hasItemQty(18214, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("WARAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(18214, 1, 76, 1, 25, 6); -- Attack +7
    player:setVar("WARAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18214);

  end

  --------------------------------------------------------
  --       MONK TRADE Beat Cesti 17478                  --
  --------------------------------------------------------


  if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17478, 1, 45, 5);
    player:setVar("MNKAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17478);

  end
  if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("MNKAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17478, 1, 45, 9, 25, 4); -- Attack +5
    player:setVar("MNKAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17478);

  end
  if (job == 2) and (trade:hasItemQty(17478, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("MNKAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17478, 1, 45, 15, 25, 6); -- Attack +7
    player:setVar("MNKAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17478);

  end



  --------------------------------------------------------
  --      WHITE MAGE TRADE Blessed Hammer 17422         --
  --------------------------------------------------------

  if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17422, 1, 45, 3, 329, 9); -- Cure Potency +10%
    player:setVar("WHMAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17422);

  end
  if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("WHMAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17422, 1, 45, 7, 329, 10); -- Cure Potency +11%
    player:setVar("WHMAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17422);

  end
  if (job == 3) and (trade:hasItemQty(17422, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("WHMAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17422, 1, 45, 12, 329, 11); -- Cure Potency +12%
    player:setVar("WHMAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17422);

  end



  --------------------------------------------------------
  --      BLACK MAGE TRADE DUSKY STAFF 17572             --
  --------------------------------------------------------



  if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17572, 1, 45, 9, 133, 9);
    player:setVar("BLMAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17572);

  end
  if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BLMAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17572, 1, 45, 76, 0, 133, 10);
    player:setVar("BLMAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17572);

  end
  if (job == 4) and (trade:hasItemQty(17572, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BLMAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17572, 1, 76, 12, 133, 11);
    player:setVar("BLMAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17572);

  end

  --------------------------------------------------------
  --      RED MAGE TRADE FENCING DEGEN 16829            --
  --------------------------------------------------------



  if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16829, 1, 45, 4, 140, 1); -- Fast Cast +2
    player:setVar("RDMAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16829);

  end
  if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RDMAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16829, 1, 45, 9, 140, 2); -- Fast Cast +3
    player:setVar("RDMAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16829);

  end
  if (job == 5) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RDMAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16829, 1, 45, 14, 140, 3); -- Fast Cast +4
    player:setVar("RDMAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16829);

  end


  --------------------------------------------------------
  --      THF TRADE MARAUDER'S KNIFE 16764              --
  --------------------------------------------------------



  if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16764, 1, 45, 4, 41, 1);  -- Crit hitrate +2
    player:setVar("THFAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16764);

  end
  if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("THFAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16764, 1, 45, 9, 41, 2);  -- Crit hitrate +3
    player:setVar("THFAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16764);

  end
  if (job == 6) and (trade:hasItemQty(16764, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("THFAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16764, 1, 45, 14, 41, 3);  -- Crit hitrate +4
    player:setVar("THFAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16764);

  end


  --------------------------------------------------------
  --      PLD TRADE HONOR SWORD 17643                   --
  --------------------------------------------------------



  if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17643, 1, 45, 2, 39, 1); -- DMG+3 Enmity +2
    player:setVar("PLDAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17643);

  end
  if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("PLDAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17643, 1, 45, 6, 25, 4, 39, 2);  -- Attack +5 Enmity +3
    player:setVar("PLDAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17643);

  end
  if (job == 7) and (trade:hasItemQty(17643, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("PLDAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17643, 1, 45, 9, 25, 6, 39, 3); -- Attack +7 Enmity +4
    player:setVar("PLDAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17643);

  end



  --------------------------------------------------------
  --      PLD TRADE HEATER SHIELD 12307                 --
  --------------------------------------------------------



  if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(12307, 1, 33, 4);
    player:setVar("PLDAFshield", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 12307);

  end
  if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("PLDAFshield") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(12307, 1, 33, 9);
    player:setVar("PLDAFshield", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 12307);

  end
  if (job == 7) and (trade:hasItemQty(12307, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("PLDAFshield") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(12307, 1, 33, 9, 286, 4);  -- +5 DEF and +5 Shield Skill
    player:setVar("PLDAFshield", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 12307);

  end




  --------------------------------------------------------
  --      DRK TRADE RAVEN SCYTHE 16798                  --
  --------------------------------------------------------



  if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16798, 1, 45, 6);
    player:setVar("DRKAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16798);

  end
  if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DRKAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16798, 1, 45, 14, 25, 4);
    player:setVar("DRKAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16798);

  end
  if (job == 8) and (trade:hasItemQty(16798, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DRKAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16798, 1, 45, 22, 25, 6);
    player:setVar("DRKAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16798);

  end




  --------------------------------------------------------
  --      DRK TRADE GREATSWORD 16590                    --
  --------------------------------------------------------



  if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16590, 1, 45, 7);
    player:setVar("DRKAFweapongs", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16590);

  end
  if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DRKAFweapongs") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16590, 1, 45, 15, 25, 4);
    player:setVar("DRKAFweapongs", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16590);

  end
  if (job == 8) and (trade:hasItemQty(16590, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DRKAFweapongs") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16590, 1, 45, 23, 25, 6);
    player:setVar("DRKAFweapongs", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16590);

  end


  --------------------------------------------------------
  --      BST TRADE BARABORI AXE 16680                  --
  --------------------------------------------------------



  if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16680, 1, 45, 3);
    player:setVar("BSTAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16680);

  end
  if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BSTAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16680, 1, 45, 7, 43, 2);
    player:setVar("BSTAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16680);

  end
  if (job == 9) and (trade:hasItemQty(16680, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BSTAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16680, 1, 45, 11, 43, 4);
    player:setVar("BSTAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16680);

  end



  --------------------------------------------------------
  --      BRD TRADE PAPER KNIFE 16766                   --
  --------------------------------------------------------



  if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16766, 1, 45, 4, 337, 1);  -- Song Recast
    player:setVar("BRDAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16766);

  end
  if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BRDAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16766, 1, 45, 9, 337, 2);
    player:setVar("BRDAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16766);

  end
  if (job == 10) and (trade:hasItemQty(16766, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BRDAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16766, 1, 45, 14, 337, 3);
    player:setVar("BRDAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16766);

  end


  --------------------------------------------------------
  --             BRD TRADE HORN 17352                   --
  --------------------------------------------------------

  -- singing and wind skill +2/3/4


  if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17352, 1, 296, 2, 298, 2);
    player:setVar("BRDAFhorn", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17352);

  end
  if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BRDAFhorn") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17352, 1, 296, 3, 298, 3);
    player:setVar("BRDAFhorn", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17352);

  end
  if (job == 10) and (trade:hasItemQty(17352, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BRDAFhorn") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17352, 1, 296, 4, 298, 4);
    player:setVar("BRDAFhorn", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17352);

  end


  --------------------------------------------------------
  --          BRD TRADE LAMIA HARP 17356                --
  --------------------------------------------------------

  -- SONG Spellcasting Time


  if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17356, 1, 322, 2);
    player:setVar("BRDAFharp", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17356);

  end
  if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BRDAFharp") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17356, 1, 322, 3);
    player:setVar("BRDAFharp", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17356);

  end
  if (job == 10) and (trade:hasItemQty(17356, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BRDAFharp") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17356, 1, 322, 4);
    player:setVar("BRDAFharp", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17356);

  end


  --------------------------------------------------------
  --          BRD TRADE JUDGES BOW 17174                --
  --------------------------------------------------------

  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 15 and (player:getVar("BRDJudgesBow") == 1)) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Remember after level 45 I require 5000g per upgrade for this bow!", 0xD);
    player:addItem(17174,1,750,31,751,18); -- DMG -82
    player:setVar("BRDJudgesBow",2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174);
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 25 and (player:getVar("BRDJudgesBow") == 2)) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Remember after level 45 I require 5000g per upgrade for this bow!", 0xD);
    player:addItem(17174,1,750,31,751,9);  -- DMG -73
    player:setVar("BRDJudgesBow",3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174);
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 35 and (player:getVar("BRDJudgesBow") == 3)) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Remember after level 45 I require 5000g per upgrade for this bow!", 0xD);
    player:addItem(17174,1,750,31,751,1);  -- DMG -64
    player:setVar("BRDJudgesBow",4);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174);
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 45 and (player:getVar("BRDJudgesBow") == 4)) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Remember after level 45 I require 5000g per upgrade for this bow!", 0xD);
    player:addItem(17174,1,750,24,751,0);  -- DMG -58
    player:setVar("BRDJudgesBow",5);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174);
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 55 and (player:getVar("BRDJudgesBow") == 5) and trade:getGil() == 5000) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Next time I require 5000g to upgrade this bow!", 0xD);
    player:addItem(17174,1,750,16,751,0,35,4);  -- DMG -48/Magic Acc+5
    player:setVar("BRDJudgesBow",6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174);
  elseif (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 55 and (player:getVar("BRDJudgesBow") == 5)) then
    player:PrintToPlayer("Oboro : I require 5000g to upgrade this bow!", 0xD);
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 65 and (player:getVar("BRDJudgesBow") == 6) and trade:getGil() == 5000) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Next time I require 10000g to upgrade this bow!", 0xD);
    player:addItem(17174,1,750,6,751,0,35,6);  -- DMG -39
    player:setVar("BRDJudgesBow",7);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174);
  elseif (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 65 and (player:getVar("BRDJudgesBow") == 6)) then
    player:PrintToPlayer("Oboro : I require 5000g to upgrade this bow!", 0xD);
  end
  if (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 75 and (player:getVar("BRDJudgesBow") == 7)) and trade:getGil(10000) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Here you go!  Not much else I can do at this time.", 0xD);
    player:addItem(17174,1,750,31,35,9,27,19);  -- DMG -32
    player:setVar("BRDJudgesBow",8);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17174);
  elseif (job == 10 and (trade:hasItemQty(17174, 1)) and level >= 75 and (player:getVar("BRDJudgesBow") == 7)) then
    player:PrintToPlayer("Oboro : I require 10000g to upgrade this bow!", 0xD);
  end



  --------------------------------------------------------
  --          BRD TRADE JUDGES ARROW 17324              --
  --------------------------------------------------------
  local tcount = trade:getItemQty(17330);

  if (tcount > 0 and job == 10 and level >=65 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete();
    player:addItem(17326,tcount,751,31,212,9)
    player:PrintToPlayer("Oboro : Here you go!  Not much else I can do at this time.", 0xD);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326);
  elseif(tcount > 0 and job == 10 and level >=55 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete();
    player:addItem(17326,tcount,750,4,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326);
  elseif(tcount > 0 and job == 10 and level >=45 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete();
    player:addItem(17326,tcount,750,7,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326);
  elseif(tcount > 0 and job == 10 and level >=35 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete();
    player:addItem(17326,tcount,750,14,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326);
  elseif(tcount > 0 and job == 10 and level >=25 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete();
    player:addItem(17326,tcount,750,17,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326);
  elseif(tcount > 0 and job == 10 and level >=15 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete();
    player:addItem(17326,tcount,750,22,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326);
  elseif(tcount > 0 and job == 10 and level >=5 and trade:hasItemQty(17330,tcount)) then
    player:tradeComplete();
    player:addItem(17326,tcount,750,29,751,31)
    player:PrintToPlayer("Oboro : Here you go!", 0xD);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17326);
  end



  --------------------------------------------------------
  --      RNG TRADE SNIPING BOW 17188                   --
  --------------------------------------------------------



  if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17188, 1, 45, 11);
    player:setVar("RNGAFweaponbow", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17188);

  end
  if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RNGAFweaponbow") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17188, 1, 45, 24, 29, 4);
    player:setVar("RNGAFweaponbow", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17188);

  end
  if (job == 11) and (trade:hasItemQty(17188, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RNGAFweaponbow") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17188, 1, 76, 3, 29, 6);
    player:setVar("RNGAFweaponbow", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17188);

  end



  --------------------------------------------------------
  --      RNG TRADE SERPENTINE GUN 17256                --
  --------------------------------------------------------



  if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17256, 1, 45, 4);
    player:setVar("RNGAFweapongun", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17256);

  end
  if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RNGAFweapongun") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17256, 1, 45, 8, 29, 4);
    player:setVar("RNGAFweapongun", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17256);

  end
  if (job == 11) and (trade:hasItemQty(17256, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RNGAFweapongun") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17256, 1, 45, 11, 29, 6);
    player:setVar("RNGAFweapongun", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17256);

  end



  --------------------------------------------------------
  --         RNG TRADE ZAMBURAK 17218                   --
  --------------------------------------------------------



  if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17218, 1, 45, 6);
    player:setVar("RNGAFweaponxbow", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17218);

  end
  if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RNGAFweaponxbow") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17218, 1, 45, 10, 29, 4);
    player:setVar("RNGAFweaponxbow", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17218);

  end
  if (job == 11) and (trade:hasItemQty(17218, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RNGAFweaponxbow") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17218, 1, 45, 13, 29, 6);
    player:setVar("RNGAFweaponxbow", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17218);

  end


  --------------------------------------------------------
  --            SAM TRADE MAGOROKU 17812                --
  --------------------------------------------------------



  if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17812, 1, 45, 5);
    player:setVar("SAMAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17812);

  end
  if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("SAMAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17812, 1, 45, 12, 142, 1);
    player:setVar("SAMAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17812);

  end
  if (job == 12) and (trade:hasItemQty(17812, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("SAMAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17812, 1, 45, 19, 142, 2);
    player:setVar("SAMAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17812);

  end



  --------------------------------------------------------
  --      NIN TRADE ANJU & ZUSHIO 17771 / 17772         --
  --------------------------------------------------------



  if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Well Done.  Here are your items");
    player:addItem(17771, 1, 45, 3);
    player:addItem(17772, 1, 45, 2);
    player:setVar("NINAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17771);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17772);

  end
  if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("NINAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Well Done.  Here are your items");
    player:addItem(17771, 1, 45, 7, 25, 1);
    player:addItem(17772, 1, 45, 6, 25, 2);
    player:setVar("NINAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17771);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17772);

  end
  if (job == 13) and (trade:hasItemQty(17771, 1)) and (trade:hasItemQty(17772, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("NINAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Well Done.  Here are your items");
    player:addItem(17771, 1, 45, 11, 25, 2);
    player:addItem(17772, 1, 45, 10, 25, 3);
    player:setVar("NINAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17771);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17772);

  end


  --------------------------------------------------------
  --            DRG TRADE PEREGRINE 16887               --
  --------------------------------------------------------



  if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16887, 1, 45, 6);
    player:setVar("DRGAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16887);

  end
  if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DRGAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16887, 1, 45, 14, 25, 4);
    player:setVar("DRGAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16887);

  end
  if (job == 14) and (trade:hasItemQty(16887, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DRGAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16887, 1, 45, 22, 25, 6);
    player:setVar("DRGAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16887);

  end




  --------------------------------------------------------
  --         SMN TRADE DRAGON STAFF 17597               --
  --------------------------------------------------------



  if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17597, 1, 45, 11, 321, 1);
    player:setVar("SMNAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17597);

  end
  if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("SMNAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17597, 1, 45, 23, 321, 1);
    player:setVar("SMNAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17597);

  end
  if (job == 15) and (trade:hasItemQty(17597, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("SMNAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17597, 1, 76, 1, 321, 1);
    player:setVar("SMNAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17597);

  end


  --------------------------------------------------------
  --         BLU TRADE IMMORTAL SCIMITAR  17717         --
  --------------------------------------------------------


  if (job == 16) and (trade:hasItemQty(17717, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17717, 1, 45, 3, 550, 1); -- STR/DEX+2
    player:setVar("BLUAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17717);

  end
  if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("BLUAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16829, 1, 45, 8, 550, 3); -- STR/DEX+4
    player:setVar("BLUAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17717);

  end
  if (job == 16) and (trade:hasItemQty(16829, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("BLUAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16829, 1, 45, 13, 550, 5); -- STR/DEX+6
    player:setVar("BLUAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17717);

  end




  --------------------------------------------------------
  --      COR TRADE HEXAGUN 18702                    --
  --------------------------------------------------------



  if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(18702, 1, 45, 2, 29, 2, 27, 2);
    player:setVar("CORAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18702);

  end
  if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("CORAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(18702, 1, 45, 5, 29, 4, 27, 4);
    player:setVar("CORAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18702);

  end
  if (job == 17) and (trade:hasItemQty(18702, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("CORAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(18702, 1, 45, 8, 29, 6, 27, 6);
    player:setVar("CORAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18702);
  end


  --------------------------------------------------------
  --      PUP TRADE ADARGAS 18353                     --
  --------------------------------------------------------

  if (job == 18) and (level >=47) and (player:hasItem(18353) == false) and (player:getVar("PUPAFweapon") == 0) and trade:getGil(5000) then
    player:addItem(18353, 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18353);
    player:setVar("PUPAFweapon",1);
    player:PrintToPlayer("Oboro : Don't go off losing that weapon again or I will be very angry.", 0xD);
  end


  if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("PUPAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(18353, 1, 45, 2, 25, 4); -- Attack +5
    player:setVar("PUPAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18353);

  end
  if (job == 18) and (trade:hasItemQty(18353, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("PUPAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(18353, 1, 45, 5, 25, 6); -- Attack +7
    player:setVar("PUPAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18353);

  end



  --------------------------------------------------------
  --      DNC TRADE Mythril Knife 16467                    --
  --------------------------------------------------------

  if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16467, 1, 45, 4, 518, 1);
    player:setVar("DNCAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16467);

  end
  if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("DNCAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16467, 1, 45, 7, 518, 2, 330, 1);
    player:setVar("DNCAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16467);

  end
  if (job == 19) and (trade:hasItemQty(16467, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("DNCAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(16467, 1, 45, 10, 518, 3, 330, 2);
    player:setVar("DNCAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 16467);
  end





  --------------------------------------------------------
  --      SCH TRADE OAK POLE 17098                     --
  --------------------------------------------------------

  if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17098, 1, 45, 11, 141, 2);
    player:setVar("SCHAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17098);

  end
  if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("SCHAFweapon") == 1)  then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17098, 1, 45, 23, 141, 4);
    player:setVar("SCHAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17098);

  end
  if (job == 20) and (trade:hasItemQty(17098, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("SCHAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(17098, 1, 45, 30, 141, 6);
    player:setVar("SCHAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 17098);
  end



  --------------------------------------------------------
  --       GEO TRADE Matre Bell 21460                  --
  --------------------------------------------------------


  if (job == 21) and (trade:hasItemQty(21460, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(21460, 1, 9, 14); -- MP+15
    player:setVar("GEOAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 21460);

  end
  if (job == 21) and (trade:hasItemQty(21460, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("GEOAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(21460, 1, 9, 19, 1250, 9); -- MP+20, Indi Duration + 10
    player:setVar("GEOAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 21460);

  end
  if (job == 21) and (trade:hasItemQty(21460, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("GEOAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(21460, 1, 9, 24, 1250, 14, 301, 4); -- MP+25, Indi Duration + 15, Bell Skill + 5
    player:setVar("GEOAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 21460);

  end

  --------------------------------------------------------
  --      RUN TRADE Sowilo Claymore 20781              --
  --------------------------------------------------------


  if (job == 22) and (trade:hasItemQty(20781, 1)) and trade:hasItemQty( 1126, 15 ) and level >= 51 then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(20781, 1, 76, 19); -- Dmg+52
    player:setVar("RUNAFweapon", 1);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 20781);

  end
  if (job == 22) and (trade:hasItemQty(20781, 1)) and trade:hasItemQty( 1126, 30 ) and level >= 61 and (player:getVar("RUNAFweapon") == 1) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(20781, 1, 76, 25, 796, 4); -- MP+10 Resist all Elements +2
    player:setVar("RUNAFweapon", 2);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 20781);

  end
  if (job == 22) and (trade:hasItemQty(20781, 1)) and trade:hasItemQty( 1127, 15 ) and level >= 71 and (player:getVar("RUNAFweapon") == 2) then
    -- Complete the trade..
    player:tradeComplete();
    player:PrintToPlayer("Oboro : Thank you for the requested items. Come see me again when you are stronger.", 0xD);
    player:addItem(20781, 1, 76, 31, 796, 4, 1156,1); -- MP+10 Resist all Elements +2 Magic DMG taken -2
    player:setVar("RUNAFweapon", 3);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 20781);

  end



  end;

  -----------------------------------
  -- onTrigger Action
  -----------------------------------

  function onTrigger(player,npc)
    local job = player:getMainJob();
    local level = player:getMainLvl();

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
      player:PrintToPlayer("Oboro : I can't do anything else at the moment but you have two choices...Either talk", 0xD);
      player:PrintToPlayer("Oboro : to that Goblin over there or go to my friend Chasalvige in Nothern San d'Oria.", 0xD);

    elseif ((job == 16) and (player:getVar("BLUAFweapon") == 3)) or
      ((job == 17) and (player:getVar("CORAFweapon") == 3)) or
      ((job == 18) and (player:getVar("PUPAFweapon") == 3)) or
      ((job == 19) and (player:getVar("SCHAFweapon") == 3)) or
      ((job == 20) and (player:getVar("PUPAFweapon") == 3)) then
        player:PrintToPlayer("Oboro : You might want to go talk to my friend Chasalvige in Northern San d'Oria.  He might", 0xD);
        player:PrintToPlayer("Oboro : be able to do something else with that weapon.", 0xD);
      elseif ((job == 18) and (level >=47)) and (player:hasItem(18353) == false) then
        player:PrintToPlayer("Oboro : You are becoming a strong Puppetmaster.  I've made these new weapons, try them out.", 0xD);
        player:setVar("PUPAFweapon",1);
        if (player:getFreeSlotsCount() == 0) then
          player:PrintToPlayer("Oboro : Hey make some room in your inventory!", 0xD);
        elseif (player:getVar("PUPWeaponObtained") == 1) and (player:getVar("PUPAFweapon") == 0) and (player:hasItem(18353) == false) then
          player:PrintToPlayer("Oboro : You've lost those magnificent weapons already? Cough up 5,000 and I'll get you another!", 0xD);
        else
          player:addItem(18353, 1);
          player:setVar("PUPWeaponObtained",1);
          player:messageSpecial(ID.text.ITEM_OBTAINED, 18353);
        end

      elseif (player:hasItem(18214) or player:hasItem(17478) or player:hasItem(17422) or player:hasItem(17572) or player:hasItem(16829) or
        player:hasItem(16764) or player:hasItem(17643) or player:hasItem(12307) or player:hasItem(16978) or player:hasItem(16590) or
        player:hasItem(16680) or player:hasItem(16766) or player:hasItem(17352) or player:hasItem(17356) or player:hasItem(17188) or
        player:hasItem(17256) or player:hasItem(17218) or player:hasItem(17597) or player:hasItem(17771) or player:hasItem(17772) or
        player:hasItem(16877) or player:hasItem(17812) or player:hasItem(20781)) then

          player:PrintToPlayer("Oboro : Hey, I can upgrade that weapon for you. Bring me 15 Beastmen seals for the first", 0xD);
          player:PrintToPlayer("Oboro : upgrade, 30 beastmen seals for the second, and 15 Kindred seals for the last", 0xD);

        elseif ((job == 21) and player:hasItem(17478)) then
          player:PrintToPlayer("Oboro : Hey, I can upgrade that Matre Bell for you. Bring me 15 Beastmen seals for the first", 0xD);
          player:PrintToPlayer("Oboro : upgrade, 30 beastmen seals for the second, and 15 Kindred seals for the last", 0xD);
        else
          player:PrintToPlayer("Oboro : I'm busy!", 0xD);
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
