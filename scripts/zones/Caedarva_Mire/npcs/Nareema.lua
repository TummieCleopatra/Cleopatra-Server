-----------------------------------
-- Area: Caedarva Mire
--  NPC: Nareema
-- Type: Assault
-- !pos 518.387 -24.707 -467.297 79
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
local ID = require("scripts/zones/Caedarva_Mire/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local currentTokens = player:getVar("CurrentTokens_Darc");

	if ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 0) and (trade:hasItemQty(65535, 1000)) and (currentTokens >= 1)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's Attack is raised by 5 points! (Total: 5)", 0x15);
	    player:setVar("TrustAtt_Darc",5);
	    player:setVar("TributeRank_Darc",1);
	    currentTokens = currentTokens - 1;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 1) and (trade:hasItemQty(65535, 2000)) and (currentTokens >= 2)) then
	    player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's Accuracy is raised by 5 points! (Total: 5)", 0x15);
	    player:setVar("TrustAcc_Darc",5);
	    player:setVar("TributeRank_Darc",2);
	    currentTokens = currentTokens - 2;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 2) and (trade:hasItemQty(65535, 3000)) and (currentTokens >= 3)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's MP is raised by 10 points! (Total: 10)", 0x15);
	    player:setVar("TrustMP_Darc",10);
	    player:setVar("TributeRank_Darc",3);
	    currentTokens = currentTokens - 3;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 3) and (trade:hasItemQty(65535, 4000)) and (currentTokens >= 4)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's Attack is raised by 5 points! (Total: 10)", 0x15);
	    player:setVar("TrustAtt_Darc",10);
	    player:setVar("TributeRank_Darc",4);
	    currentTokens = currentTokens - 4;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 4) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= 5)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's Accuracy is raised by 5 points! (Total: 10)", 0x15);
	    player:setVar("TrustAcc_Darc",10);
	    player:setVar("TributeRank_Darc",5);
	    currentTokens = currentTokens - 5;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 5) and (trade:hasItemQty(65535, 10000)) and (currentTokens >= 10)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's MP is raised by 10 points! (Total: 30)", 0x15);
	    player:setVar("TrustMP_Darc",30);
	    player:setVar("TributeRank_Darc",6);
	    currentTokens = currentTokens - 10;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 6) and (trade:hasItemQty(65535, 15000)) and (currentTokens >= 15)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's Attack is raised by 5 points! (Total: 15)", 0x15);
	    player:setVar("TrustAtt_Darc",15);
	    player:setVar("TributeRank_Darc",7);
	    currentTokens = currentTokens - 15;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 7) and (trade:hasItemQty(65535, 30000)) and (currentTokens >= 20)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's Accuracy is raised by 5 points! (Total: 15)", 0x15);
	    player:setVar("TrustAcc_Darc",15);
	    player:setVar("TributeRank_Darc",8);
	    currentTokens = currentTokens - 20;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 8) and (trade:hasItemQty(65535, 75000)) and (currentTokens >= 30)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's Magic Accuracy has been raised by 10! (Total: 10)", 0x15);
	    player:setVar("TrustMA_Darc",10);
	    player:setVar("TributeRank_Darc",9);
	    currentTokens = currentTokens - 30;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 9) and (trade:hasItemQty(65535, 150000)) and (currentTokens >= 35)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        player:PrintToPlayer("Darcullin's Chain Affinity TP bonus has increased!", 0x15);
	    player:setVar("TrustCA_Darc",15);
	    player:setVar("TributeRank_Darc",10);
	    currentTokens = currentTokens - 35;
	    player:setVar("CurrentTokens_Darc",currentTokens);
    else
        player:PrintToPlayer("Nareema : Please trade the correct amount of Tokens and Gil.",0x0D);
	end
end;

function onTrigger(player,npc)
    local toauMission = player:getCurrentMission(TOAU);
    local beginnings = player:getQuestStatus(AHT_URHGAN,dsp.quest.id.ahtUrhgan.BEGINNINGS);

	if (player:getMainJob() == 16) and (player:hasSpell(991) == false) and (player:getMainLvl() >= 15) then
	    player:addItem(10183);
        player:messageSpecial(ID.text.ITEM_OBTAINED,10183);
	end

    -- IMMORTAL SENTRIES
    if (toauMission == dsp.mission.id.toau.IMMORTAL_SENTRIES) then
        if (player:hasKeyItem(dsp.ki.SUPPLIES_PACKAGE)) then
            player:startEvent(5,1);
        elseif (player:getVar("AhtUrganStatus") == 1) then
            player:startEvent(6,1);
        end;

    -- BEGINNINGS
    elseif (beginnings == QUEST_ACCEPTED) then
        if (not player:hasKeyItem(dsp.ki.BRAND_OF_THE_STONESERPENT)) then
            player:startEvent(12); -- brands you
        else
            player:startEvent(13); -- blue muddies the purest waters
        end;

    -- ASSAULT
    elseif (toauMission >= dsp.mission.id.toau.PRESIDENT_SALAHEEM) then
        local IPpoint = player:getCurrency("imperial_standing");
        if (player:hasKeyItem(dsp.ki.LEUJAOAM_ASSAULT_ORDERS) and player:hasKeyItem(dsp.ki.ASSAULT_ARMBAND) == false) then
            player:startEvent(149,50,IPpoint);
        else
            player:startEvent(7,1);
            -- player:delKeyItem(dsp.ki.ASSAULT_ARMBAND);
        end;

    -- DEFAULT DIALOG
    else
        player:startEvent(4);
    end;

    if ((mainlvl >= 75 and tribfight == 0 and (player:hasSpell(968)) and (player:getVar("FerretoryAura") >= 7)) and (player:getVar("TRIB_FIGHT") ~= 1)) then
	    player:PrintToPlayer("Nameera : There is someone running around claming to be Darcullin at the QuBai Arena.  Please head there and I'll join you.", 0xD);
        player:PrintToPlayer("Nameera : When you are ready, enter the area and Darcullin to your side.", 0xD);
	    player:setVar("DARC_TRIB_FIGHT",1);
	    player:setVar("TRIB_FIGHT",1);
	elseif (mainlvl >= 75 and tribfight == 2 and (player:hasSpell(968))) then
	    player:PrintToPlayer("Nameera : You have done well to help with the imposter investigation.  Darcullin is in your debt.", 0xD);
	    player:PrintToPlayer("You are now able to collect Trust Tokens for Darcullin!", 0x15);
	    player:setVar("DARC_TRIB_FIGHT",3);
	    player:setVar("TRIB_FIGHT",0);
	end

    -- Handle Token Quest
    if ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 0)) then
        player:PrintToPlayer("Nareema : Bring me 1 of Darcullin's Trust Tokens and 1,000 gil to raise Darcullin's Attack by 5",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 1)) then
        player:PrintToPlayer("Nareema : Bring me 2 of Darcullin's Trust Tokens and 2,000 gil to raise Darcullin's Accuracy by 5",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 2)) then
        player:PrintToPlayer("Nareema : Bring me 3 of Darcullin's Trust Tokens and 3,000 gil to raise Darcullin's MP by 10",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 3)) then
        player:PrintToPlayer("Nareema : Bring me 4 of Darcullin's Trust Tokens and 4,000 gil to raise Darcullin's Attack by 5",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 4)) then
        player:PrintToPlayer("Nareema : Bring me 5 of Darcullin's Trust Tokens and 5,000 gil to raise Darcullin's Accuracy by 5",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 5)) then
        player:PrintToPlayer("Nareema : Bring me 10 of Darcullin's Trust Tokens and 10,000 gil to raise Darcullin's MP by 20",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 6)) then
        player:PrintToPlayer("Nareema : Bring me 15 of Darcullin's Trust Tokens and 15,000 gil to raise Darcullin's Attack by 5",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 7)) then
        player:PrintToPlayer("Nareema : Bring me 20 of Darcullin's Trust Tokens and 30,000 gil to raise Darcullin's Accuracy by 5",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 8)) then
        player:PrintToPlayer("Nareema : Bring me 30 of Darcullin's Trust Tokens and 75,000 gil so I can raise Darcullin's Magic Acc by 10",0x0D);
    elseif ((player:getVar("DARC_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Darc") == 9)) then
        player:PrintToPlayer("Nareema : Bring me 35 of Darcullin's Trust Tokens and 150,000 gil grant a TP bonus during Chain Affinity",0x0D);
    end


end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- IMMORTAL SENTRIES
    if (csid == 5 and option == 1) then
        player:delKeyItem(dsp.ki.SUPPLIES_PACKAGE);
        player:setVar("AhtUrganStatus",1);

    -- BEGINNINGS
    elseif (csid == 12) then
        player:addKeyItem(dsp.ki.BRAND_OF_THE_STONESERPENT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BRAND_OF_THE_STONESERPENT);

    -- ASSAULT
    elseif (csid == 149 and option == 1) then
        player:delCurrency("imperial_standing", 50);
        player:addKeyItem(dsp.ki.ASSAULT_ARMBAND);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.ASSAULT_ARMBAND);
    end;
end;
