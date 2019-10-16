-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Chasalvige
-- Type: Standard Info NPC
--  Involved in Mission: The Road Forks
--  Involved in Mission: Promathia Mission 5 - Three Paths
-- !pos 96.432 -0.520 134.046 231
--
-----------------------------------
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
    local balance = 0;
    local amount = 30000;
    local job = player:getMainJob();
    local pinfamy = player:getCurrency("infamy");
    local mainlvl = player:getMainLvl();

    -- War Trade

    if ((job == 1) and (player:getVar("WARAFweapon") == 3) and (trade:hasItemQty(18214,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("WARHAweapon",1);
        player:setVar("WARAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 1) and (player:getVar("WARAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(18214,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- MNK Trade
    if ((job == 2) and (player:getVar("MNKAFweapon") == 3) and (trade:hasItemQty(17478,1)) and (trade:hasItemQty(2766,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("MNKHAweapon",1);
        player:setVar("MNKAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 2) and (player:getVar("MNKAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17478,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Oberon's Gold Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- WHM Trade
    if ((job == 3) and (player:getVar("WHMAFweapon") == 3) and (trade:hasItemQty(17422,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("WHMHAweapon",1);
        player:setVar("WHMAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 3) and (player:getVar("WHMAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17422,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- BLM Trade
    if ((job == 4) and (player:getVar("BLMAFweapon") == 3) and (trade:hasItemQty(17572,1)) and (trade:hasItemQty(2762,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("BLMHAweapon",1);
        player:setVar("BLMAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 4) and (player:getVar("BLMAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17572,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Feyweald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- RDM Trade
    if ((job == 5) and (player:getVar("RDMAFweapon") == 3) and (trade:hasItemQty(16829,1)) and (trade:hasItemQty(2766,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("RDMHAweapon",1);
        player:setVar("RDMAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 5) and (player:getVar("RDMAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16829,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Oberon's Gold Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- THF Trade
    if ((job == 6) and (player:getVar("THFAFweapon") == 3) and (trade:hasItemQty(16764,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("THFHAweapon",1);
        player:setVar("THFAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 6) and (player:getVar("THFAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16764,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- PLD Trade
    if ((job == 7) and (player:getVar("PLDAFweapon") == 3) and (trade:hasItemQty(17643,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("PLDHAweapon",1);
        player:setVar("PLDAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 7) and (player:getVar("PLDAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17643,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- PLD Shield Trade
    if ((job == 7) and (player:getVar("PLDAFshield") == 3) and (trade:hasItemQty(12307,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("PLDHAshield",1);
        player:setVar("PLDAFshield",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 7) and (player:getVar("PLDAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17643,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end



    -- DRK Trade
    if ((job == 8) and (player:getVar("DRKAFweapon") == 3) and (trade:hasItemQty(16798,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("DRKHAweapon",1);
        player:setVar("DRKAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 8) and (player:getVar("DRKAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16798,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- BST Trade
    if ((job == 9) and (player:getVar("BSTAFweapon") == 3) and (trade:hasItemQty(16680,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("BSTHAweapon",1);
        player:setVar("BSTAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 9) and (player:getVar("BSTAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16680,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- BRD Trade
    if ((job == 10) and (player:getVar("BRDAFweapon") == 3) and (trade:hasItemQty(16766,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("BRDHAweapon",1);
        player:setVar("BRDAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 10) and (player:getVar("BRDAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16766,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- RNG Trade
    if ((job == 11) and (player:getVar("RNGAFweaponbow") == 3) and (trade:hasItemQty(17188,1)) and (trade:hasItemQty(2762,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("RNGHAweapon",1);
        player:setVar("RNGAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 11) and (player:getVar("RNGAFweaponbow") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17188,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Feyweald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- SAM Trade
    if ((job == 12) and (player:getVar("SAMAFweapon") == 3) and (trade:hasItemQty(17812,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("SAMHAweapon",1);
        player:setVar("SAMAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 12) and (player:getVar("SAMAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17812,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- NIN Trade
    if ((job == 13) and (player:getVar("NINAFweapon") == 3) and (trade:hasItemQty(17771,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("NINHAweapon",1);
        player:setVar("NINAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 13) and (player:getVar("NINAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17771,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingots and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- DRG Trade
    if ((job == 14) and (player:getVar("DRGAFweapon") == 3) and (trade:hasItemQty(16887,1)) and (trade:hasItemQty(2762,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("DRGHAweapon",1);
        player:setVar("DRGAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 14) and (player:getVar("DRGAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(16887,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Feyweald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- SMN Trade
    if ((job == 15) and (player:getVar("SMNAFweapon") == 3) and (trade:hasItemQty(17597,1)) and (trade:hasItemQty(2762,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("SMNHAweapon",1);
        player:setVar("SMNAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 15) and (player:getVar("SMNAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17597,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Feyweald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- BLU Trade
    if ((job == 16) and (player:getVar("BLUAFweapon") == 3) and (trade:hasItemQty(17717,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("BLUHAweapon",1);
        player:setVar("BLUAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 16) and (player:getVar("BLUAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17717,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingot and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- COR Trade
    if ((job == 17) and (player:getVar("CORAFweapon") == 3) and (trade:hasItemQty(18702,1)) and (trade:hasItemQty(2764,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("CORHAweapon",1);
        player:setVar("CORAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 17) and (player:getVar("CORAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(18702,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Dweomer Steel Ingot and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end


    -- PUP Trade
    if ((job == 18) and (player:getVar("PUPAFweapon") == 3) and (trade:hasItemQty(18353,1)) and (trade:hasItemQty(2766,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("PUPHAweapon",1);
        player:setVar("PUPAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 18) and (player:getVar("PUPAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(18353,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Oberon's Gold Ingot and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end


    -- DNC Trade
    if ((job == 19) and (player:getVar("DNCAFweapon") == 3) and (trade:hasItemQty(16467,1)) and (trade:hasItemQty(2769,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("DNCHAweapon",1);
        player:setVar("DNCAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 19) and (player:getVar("DNCAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17098,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Buggane Horns and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end

    -- SCH Trade
    if ((job == 20) and (player:getVar("SCHAFweapon") == 3) and (trade:hasItemQty(17098,1)) and (trade:hasItemQty(2762,3))) then
      if (pinfamy >= amount) then
        player:delCurrency("infamy", amount);
        player:tradeComplete();
        player:PrintToPlayer("Chasalvige : I will roughly one day to finish the ritual.  Please come back then.", 0xD);
        player:setVar("SCHHAweapon",1);
        player:setVar("SCHAFweapon",0);
        player:setVar("HA_Weapon_Wait", os.time());
      else
        balance = amount - pinfamy;
        player:PrintToPlayer("Chasalvige : I am sorry.  You need "..balance.." more infamy for the donation.", 0xD);
      end
    elseif ((job == 20) and (player:getVar("SCHAFweapon") == 3) and (mainlvl >= 75) and (player:getVar("HA_Weapon_Start") == 1) and (trade:hasItemQty(17098,1))) then
      player:PrintToPlayer("Chasalvige : I will need 3x Feyewald Lumber and 30,000 infamy donation to purify that Artifact Weapon.", 0xD);
    end
end;

function onTrigger(player,npc)
    local daywait = player:getVar("HA_Weapon_Wait") + 600;

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_ROAD_FORKS and player:getVar("EMERALD_WATERS_Status") == 3) then
        player:startEvent(38); --COP event
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_ENDURING_TUMULT_OF_WAR and player:getVar("COP_optional_CS_chasalvigne") == 0) then
        player:startEvent(761);
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.THREE_PATHS and player:getVar("COP_Ulmia_s_Path") == 2) then
        player:startEvent(762);
      -- Pickup
      -- War
    elseif (daywait > os.time()) then
      player:PrintToPlayer("Chasalvige : Please have patience.  The purification takes time to get right.", 0xD);
      -- WAR
    elseif ((player:getVar("WARHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18505, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("WARHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18505);
      -- MNK
    elseif ((player:getVar("MNKHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18764, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("MNKHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18764);
      -- WHM
    elseif ((player:getVar("WHMHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18870, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("WHMHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18870);
      -- BLM
    elseif ((player:getVar("BLMHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18589, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("BLMHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18589);
      -- RDM
    elseif ((player:getVar("RDMHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(17761, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("RDMHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 17761);
      -- THF
    elseif ((player:getVar("THFHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(19115, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("THFHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 19115);
      -- PLD
    elseif ((player:getVar("PLDHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(17762, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("PLDHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 17762);
      -- PLD Shield
    elseif ((player:getVar("PLDHAshield") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your shield is mostly ready.", 0xD);
      player:addItem(12307, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("PLDHAshield", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 17762);
      -- DRK
    elseif ((player:getVar("DRKHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18995, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("DRKHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18995);
      -- BST
    elseif ((player:getVar("BSTHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(17966, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("BSTHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 17966);
      -- BRD
    elseif ((player:getVar("BRDHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(19116, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("BRDHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 19116);
      -- RNG
    elseif ((player:getVar("RNGHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18763, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("RNGHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18763);
      -- SAM
    elseif ((player:getVar("SAMHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18452, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("SAMHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18452);
      -- NIN
    elseif ((player:getVar("NINHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(19275, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("NINHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 19275);
      -- DRG
    elseif ((player:getVar("DRGHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(19303, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("DRGHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 19303);
      -- SMN
    elseif ((player:getVar("SMNHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18601, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("SMNHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18601);
      -- BLU
    elseif ((player:getVar("BLUHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(17763, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("BLUHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 17763);
      -- COR
    elseif ((player:getVar("CORHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18737, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("CORHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18737);
      -- PUP
    elseif ((player:getVar("PUPHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18765, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("PUPHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18765);
      -- DNC
    elseif ((player:getVar("DNCHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(19117, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("DNCHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 19117);
      -- SCH
    elseif ((player:getVar("SCHHAWeapon") == 1) and (daywait < os.time())) then
      player:PrintToPlayer("Chasalvige : Now your weapon is mostly ready.", 0xD);
      player:addItem(18602, 1, 2047, 0, 2047, 0 , 2047, 0);
      player:setVar("HA_Weapon_Wait", 0);
      player:setVar("SCHHAWeapon", 2);
      player:messageSpecial(ID.text.ITEM_OBTAINED, 18602);
    elseif ((player:getVar("WARHAweapon") == 2) or (player:getVar("MNKHAweapon") == 2) or (player:getVar("WHMHAweapon") == 2) or (player:getVar("BLMHAweapon") == 2)
      or (player:getVar("RDMHAweapon") == 2) or (player:getVar("THFHAweapon") == 2) or (player:getVar("PLDHAweapon") == 2) or (player:getVar("DRKHAweapon") == 2)
      or (player:getVar("BSTHAweapon") == 2) or (player:getVar("BRDHAweapon") == 2) or (player:getVar("RNGHAweapon") == 2) or (player:getVar("SAMHAweapon") == 2)
      or (player:getVar("NINHAweapon") == 2) or (player:getVar("DRGHAweapon") == 2) or (player:getVar("SMNHAweapon") == 2) or (player:getVar("BLUHAweapon") == 2)
      or (player:getVar("CORHAweapon") == 2) or (player:getVar("PUPHAweapon") == 2) or (player:getVar("SCHHAweapon") == 2) or (player:getVar("DNCHAweapon") == 2)
      or (player:getVar("DNCHAshield") == 2)) then
        player:PrintToPlayer("Chasalvige : To finish the Ceremony, bury your weapon near the beach in Purgonorgo Isle to absorb the Malice there.  It should draw ", 0xD);
        player:PrintToPlayer("Chasalvige : out the negative energy your Artifact Weapon once had and allow it to manifest itself.", 0xD);
    elseif ((player:getVar("WARAFweapon") == 3) or (player:getVar("MNKAFweapon") == 3) or (player:getVar("WHMAFweapon") == 3) or (player:getVar("BLMAFweapon") == 3) or
        (player:getVar("RDMAFweapon") == 3) or (player:getVar("THFAFweapon") == 3) or (player:getVar("PLDAFweapon") == 3) or (player:getVar("DRKAFweapon") == 3) or
        (player:getVar("BSTAFweapon") == 3) or (player:getVar("BRDAFweapon") == 3) or (player:getVar("RNGAFweaponbow") == 3) or (player:getVar("SAMAFweapon") == 3) or
        (player:getVar("NINAFweapon") == 3) or (player:getVar("DRGAFweapon") == 3) or (player:getVar("SMNAFweapon") == 3) or (player:getVar("BLUAFweapon") == 3) or
        (player:getVar("CORAFweapon") == 3) or (player:getVar("PUPAFweapon") == 3) or (player:getVar("SCHAFweapon") == 3) or (player:getVar("DNCAFweapon") == 3) or
        (player:getVar("PLDAFshield") == 3)) then
          player:PrintToPlayer("Chasalvige : Looks like Oboro is at it again...If you want a real weapon, trade me your Artifact so I can examine it.", 0xD);
          player:setVar("HA_Weapon_Start",1);
    else
        player:startEvent(6);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 38) then
        player:setVar("EMERALD_WATERS_Status",4);
    elseif (csid == 761) then
        player:setVar("COP_optional_CS_chasalvigne",1);
    elseif (csid == 762) then
        player:setVar("COP_Ulmia_s_Path",3);
    end
end;
