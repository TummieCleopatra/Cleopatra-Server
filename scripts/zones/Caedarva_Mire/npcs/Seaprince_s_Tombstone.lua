-----------------------------------
-- Area: Caedarva Mire
--  NPC: Seaprince's Tombstone
-- Involved in quest: Forging a New Myth
-- !pos  -433 7 -586 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs");
-----------------------------------

function onTrade(player,npc,trade)
  local level = player:getMainLvl();
  local job = player:getMainJob();

  -- Warrior Trade
  local test = player:getVar("PLDMythicWeapon")

  print(test)


  if (job == 1) and (trade:hasItemQty(18971, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("WARMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    -- --
    player:addItem(18991,1); -- Attack +10
    player:setVar("WARMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18991);

  end

  --------------------------------------------------------
  --       MONK TRADE Beat Cesti 17478                  --
  --------------------------------------------------------


  if (job == 2) and (trade:hasItemQty(18972, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and level >= 71 and (player:getVar("MNKMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18993, 1);
    player:setVar("MNKMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18993);

  end



  --------------------------------------------------------
  --      WHITE MAGE TRADE Blessed Hammer 17422         --
  --------------------------------------------------------



  if (job == 3) and (trade:hasItemQty(18973, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("WHMMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18993, 1); -- Cure Potency +12%
    player:setVar("WHMMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18993);

  end


  --------------------------------------------------------
  --      BLACK MAGE TRADE DUSKY STAFF 17572             --
  --------------------------------------------------------


  if (job == 4) and (trade:hasItemQty(18974, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("BLMMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18994, 1);
    player:setVar("BLMMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18994);

  end

  --------------------------------------------------------
  --      RED MAGE TRADE FENCING DEGEN 16829            --
  --------------------------------------------------------



  if (job == 5) and (trade:hasItemQty(18975, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("RDMMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18995, 1); -- Fast Cast +4
    player:setVar("RDMMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18995);

  end


  --------------------------------------------------------
  --      THF TRADE MARAUDER'S KNIFE 16764              --
  --------------------------------------------------------



  if (job == 6) and (trade:hasItemQty(18976, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("THFMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18996, 1);  -- Crit hitrate +4
    player:setVar("THFMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18996);

  end


  --------------------------------------------------------
  --      PLD TRADE HONOR SWORD 17643                   --
  --------------------------------------------------------


  if (job == 7) and (trade:hasItemQty(18977, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("PLDMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18997, 1); -- Attack +7 Enmity +4
    player:setVar("PLDMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18997);

  end






  --------------------------------------------------------
  --      DRK TRADE RAVEN SCYTHE 16798                  --
  --------------------------------------------------------



  if (job == 8) and (trade:hasItemQty(18978, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("DRKMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18998, 1);
    player:setVar("DRKMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18998);

  end



  --------------------------------------------------------
  --      BST TRADE BARABORI AXE 16680                  --
  --------------------------------------------------------


  if (job == 9) and (trade:hasItemQty(18979, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("BSTMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18999, 1);
    player:setVar("BSTMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18999);

  end



  --------------------------------------------------------
  --      BRD TRADE PAPER KNIFE 16766                   --
  --------------------------------------------------------


  if (job == 10) and (trade:hasItemQty(18980, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("BRDMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19000, 1);
    player:setVar("BRDMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19000);

  end




  --------------------------------------------------------
  --         RNG TRADE ZAMBURAK 17218                   --
  --------------------------------------------------------



  if (job == 11) and (trade:hasItemQty(18981, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("RNGMythicWeaponxbow") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19001, 1);
    player:setVar("RNGMythicWeaponxbow", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19001);

  end



  --------------------------------------------------------
  --            SAM TRADE MAGOROKU 17812                --
  --------------------------------------------------------



  if (job == 12) and (trade:hasItemQty(18982, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("SAMMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19002, 1);
    player:setVar("SAMMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19002);

  end



  --------------------------------------------------------
  --      NIN TRADE ANJU & ZUSHIO 17771 / 17772         --
  --------------------------------------------------------



  if (job == 13) and (trade:hasItemQty(18983, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("NINMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19003, 1);
    player:setVar("NINMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19003);

  end


  --------------------------------------------------------
  --            DRG TRADE PEREGRINE 16887               --
  --------------------------------------------------------



  if (job == 14) and (trade:hasItemQty(18984, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("DRGMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19004, 1);
    player:setVar("DRGMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19004);

  end


  --------------------------------------------------------
  --         SMN TRADE DRAGON STAFF 17597               --
  --------------------------------------------------------



  if (job == 15) and (trade:hasItemQty(18985, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("SMNMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19005, 1);
    player:setVar("SMNMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19005);

  end


  --------------------------------------------------------
  --         BLU TRADE IMMORTAL SCIMITAR  17717         --
  --------------------------------------------------------


  if (job == 16) and (trade:hasItemQty(18986, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("BLUMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19006, 1); -- STR/DEX+6
    player:setVar("BLUMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19006);

  end


  --------------------------------------------------------
  --      COR TRADE HEXAGUN 18702                    --
  --------------------------------------------------------


  if (job == 17) and (trade:hasItemQty(18987, 1)) and trade:hasItemQty(3443, 1) and trade:hasItemQty(2571, 1) and level >= 71 and (player:getVar("CORMythicWeapon") == 4) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19007, 1);
    player:setVar("CORMythicWeapon", 5);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19007);
  end


  --------------------------------------------------------
  --      PUP TRADE ADARGAS 18353                     --
  --------------------------------------------------------


  if (job == 18) and (trade:hasItemQty(18988, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("PUPMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19008,1); -- Attack +7
    player:setVar("PUPMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19008);

  end

  --------------------------------------------------------
  --      DNC TRADE Mythril Knife 16467                    --
  --------------------------------------------------------


  if (job == 19) and (trade:hasItemQty(18969, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("DNCMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19989, 1);
    player:setVar("DNCMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18989);
  end



  --------------------------------------------------------
  --      SCH TRADE OAK POLE 17098                     --
  --------------------------------------------------------


  if (job == 20) and (trade:hasItemQty(18970, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("SCHMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(18990, 1);
    player:setVar("SCHMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 18990);
  end


  --------------------------------------------------------
  --      GEO TRADE OAK POLE 17098                     --
  --------------------------------------------------------


  if (job == 21) and (trade:hasItemQty(21460, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("GEOMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(19381, 1, 45, 18, 35, 9, 300,4);
    player:setVar("GEOMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 19381);
  end


  --------------------------------------------------------
  --      RUN TRADE OAK POLE 20781                     --
  --------------------------------------------------------


  if (job == 22) and (trade:hasItemQty(20781, 1)) and trade:hasItemQty(2629,1) and trade:hasItemQty(2619,1) and trade:hasItemQty(2609,1) and (player:getVar("RUNMythicWeapon") == 5) then
    -- Complete the trade..
    player:tradeComplete();
    --
    player:addItem(20784, 1, 1472, 4, 39, 9, 1155, 5);
    player:setVar("RUNMythicWeapon", 6);
    player:messageSpecial(ID.text.ITEM_OBTAINED, 20784);
  end
end;

function onTrigger(player,npc)

    player:messageSpecial(ID.text.SEAPRINCES_TOMBSTONE);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;