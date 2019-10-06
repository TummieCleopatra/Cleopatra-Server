-----------------------------------
-- Area: Metalworks
--  NPC: Naji
-- Involved in Quests: The doorman (finish), Riding on the Clouds
-- Involved in Mission: Bastok 6-2
-- !pos 64 -14 -4 237
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/missions");
local ID = require("scripts/zones/Metalworks/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    local currentTokens = player:getVar("CurrentTokens_Naji");
    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 6) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SMILING_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SMILING_STONE);
        end
    end

    local sjQuest = player:getVar("TRUST_SJ_QUEST")
    local war = 11988;
    local rdm = 11992;
    local sam = 11999;
    local nin = 12000;
    if (trade:hasItemQty(nin, 1) and sjQuest == 4) then
        player:setVar("NAJI_TYPE", 1)
        player:PrintToPlayer("Naji: Ok, my subjob is now Ninja", 0x15);
    end

    if ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 0) and (trade:hasItemQty(65535, 1000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Attack is raised by 5 points! (Total: 5)", 0x15);
		  player:setVar("TrustAtt_Naji",5);
		  player:setVar("TributeRank_Naji",1);
	      currentTokens = currentTokens - 1;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 1) and (trade:hasItemQty(65535, 2000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Accuracy is raised by 5 points! (Total: 5)", 0x15);
		  player:setVar("TrustAcc_Naji",5);
		  player:setVar("TributeRank_Naji",2);
		  currentTokens = currentTokens - 2;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 2) and (trade:hasItemQty(65535, 3000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Double Attack is raised by 2 points! (Total: 2%)", 0x15);
		  player:setVar("TrustDA_Naji",2);
		  player:setVar("TributeRank_Naji",3);
		  currentTokens = currentTokens - 3;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 3) and (trade:hasItemQty(65535, 4000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Attack is raised by 5 points! (Total: 10)", 0x15);
		  player:setVar("TrustAtt_Naji",10);
		  player:setVar("TributeRank_Naji",4);
		  currentTokens = currentTokens - 4;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 4) and (trade:hasItemQty(65535, 5000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Accuracy is raised by 5 points! (Total: 10)", 0x15);
		  player:setVar("TrustAcc_Naji",10);
		  player:setVar("TributeRank_Naji",5);
		  currentTokens = currentTokens - 5;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 5) and (trade:hasItemQty(65535, 10000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Double Attack is raised by 3 points! (Total: 5%)", 0x15);
		  player:setVar("TrustDA_Naji",5);
		  player:setVar("TributeRank_Naji",6);
		  currentTokens = currentTokens - 10;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 6) and (trade:hasItemQty(65535, 15000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Attack is raised by 5 points! (Total: 15)", 0x15);
		  player:setVar("TrustAtt_Naji",15);
		  player:setVar("TributeRank_Naji",7);
		  currentTokens = currentTokens - 15;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 7) and (trade:hasItemQty(65535, 30000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Accuracy is raised by 5 points! (Total: 15)", 0x15);
		  player:setVar("TrustAcc_Naji",15);
		  player:setVar("TributeRank_Naji",8);
		  currentTokens = currentTokens - 20;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 8) and (trade:hasItemQty(65535, 75000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Crit. Hit Rate is raised by 3%! (Total: 3%)", 0x15);
		  player:setVar("TrustCrit_Naji",3);
		  player:setVar("TributeRank_Naji",9);
          currentTokens = currentTokens - 30;
        elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 9) and (trade:hasItemQty(65535, 150000))) then
	      player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
          player:PrintToPlayer("Naji's Berserk Effect is raised by 1%! (Total: 1%)", 0x15);
		  player:setVar("TrustBerserk_Naji",1);
		  player:setVar("TributeRank_Naji",10);
		  currentTokens = currentTokens - 35;
		end
end;

function onTrigger(player,npc)
    local srank = player:getRank();
	local wrank = player:getRank();
	local brank = player:getRank();
	local mainlvl = player:getMainLvl();
    local tribfight = player:getVar("NAJI_TRIB_FIGHT");


	if (srank >= 2) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(897) == false) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Naji : Ah a Red Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(897);
	elseif (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(897) == false) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Red Institute Card flashes dimly!", 0x1C);
        player:PrintToPlayer("Naji : I cannot recognize your efforts.  Please try again at a higher rank", 0xD);
    end

	if (wrank >= 2) and (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(897) == false) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Green Institute Card flashes brilliantly...", 0x1C);
        player:PrintToPlayer("Naji : Ah a Green Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(897);
	elseif (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(897) == false) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Green Institute Card flashes dimly...", 0x1C);
        player:PrintToPlayer("Naji : I cannot recognize your efforts.  Please try again at a higher rank", 0xD);
    end

    if (brank >= 1) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(897) == false) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Blue Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Naji : Ah a Blue Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(897);
	end

    if (player:hasKeyItem(dsp.ki.YASINS_SWORD)) then -- The Doorman, WAR AF1
        player:startEvent(750);
    elseif (player:getCurrentMission(BASTOK) ~= dsp.mission.id.bastok.NONE) then
        local currentMission = player:getCurrentMission(BASTOK);

        if (currentMission == dsp.mission.id.bastok.THE_ZERUHN_REPORT and player:hasKeyItem(dsp.ki.ZERUHN_REPORT)) then
            if (player:seenKeyItem(dsp.ki.ZERUHN_REPORT)) then
                player:startEvent(710,0);
            else
                player:startEvent(710,1);
            end
        elseif (currentMission == dsp.mission.id.bastok.THE_CRYSTAL_LINE and player:hasKeyItem(dsp.ki.C_L_REPORTS)) then
            player:startEvent(711);
        elseif (currentMission == dsp.mission.id.bastok.THE_EMISSARY and player:hasKeyItem(dsp.ki.KINDRED_REPORT)) then
            player:startEvent(714);
        elseif (currentMission == dsp.mission.id.bastok.THE_EMISSARY) then
            if (player:hasKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_BASTOK) == false and player:getVar("MissionStatus") == 0) then
                player:startEvent(713);
            else
                player:showText(npc,ID.text.GOOD_LUCK);
            end
        elseif (player:hasKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK) and player:getVar("MissionStatus") == 0) then
            player:startEvent(720);
        elseif (currentMission == dsp.mission.id.bastok.DARKNESS_RISING and player:getVar("MissionStatus") == 1) then
            player:startEvent(721);
        elseif (player:hasKeyItem(dsp.ki.BURNT_SEAL)) then
            player:startEvent(722);
        elseif (currentMission == dsp.mission.id.bastok.THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 0) then
            player:startEvent(761);
        elseif (currentMission == dsp.mission.id.bastok.THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 3) then
            player:startEvent(762);
        else
            player:startEvent(700);
        end
    elseif (player:hasKeyItem(dsp.ki.YASINS_SWORD)) then -- The Doorman
        player:startEvent(750);
    else
        player:startEvent(700);
    end

	    ------- Trust Fight --------
	if ((mainlvl >= 71 and tribfight == 0 and (player:hasSpell(897)) and (player:getVar("FerretoryAura") >= 7) and (player:getVar("TRIB_FIGHT") ~= 1))) then
	player:PrintToPlayer("Naji : There is someone running around claming to me at Waughroon Shrine.  Please head there and I'll join you.", 0xD);
    player:PrintToPlayer("Naji : When you are ready, examine the Burning Circle in Waughroon Shrine and call me to your side.", 0xD);
	player:setVar("NAJI_TRIB_FIGHT",1);
    player:setVar("TRIB_FIGHT",1);
	elseif (mainlvl >= 75 and tribfight == 2 and (player:hasSpell(897))) then
	player:PrintToPlayer("Naji : You have done well to help with the imposter investigation.  I am in your debt.", 0xD);
	player:PrintToPlayer("You are now able to collect Trust Tokens for Naji!", 0x15);
	player:setVar("NAJI_TRIB_FIGHT",3);
    player:setVar("TRIB_FIGHT",0);
	end

-- Handle Token Quest
  if ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 0)) then
    player:PrintToPlayer("Naji : Bring me 1 of my Trust Tokens and 1,000 gil to raise my Attack by 5",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 1)) then
    player:PrintToPlayer("Naji : Bring me 2 of my Trust Tokens and 2,000 gil to raise my Accuracy by 5",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 2)) then
    player:PrintToPlayer("Naji : Bring me 3 of my Trust Tokens and 3,000 gil to raise my Double Attack by 2%",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 3)) then
    player:PrintToPlayer("Naji : Bring me 4 of my Trust Tokens and 4,000 gil to raise my Attack by 5",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 4)) then
    player:PrintToPlayer("Naji : Bring me 5 of my Trust Tokens and 5,000 gil to raise my Accuracy by 5",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 5)) then
    player:PrintToPlayer("Naji : Bring me 10 of my Trust Tokens and 10,000 gil to raise my Double Attack by 3%",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 6)) then
    player:PrintToPlayer("Naji : Bring me 15 of my Trust Tokens and 15,000 gil to raise my Attack by 5",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 7)) then
    player:PrintToPlayer("Naji : Bring me 20 of my Trust Tokens and 30,000 gil to raise my Accuracy by 5",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 8)) then
    player:PrintToPlayer("Naji : Bring me 30 of my Trust Tokens and 75,000 gil so I can raise my Critical Hitrate by 3%'",0x0D);
  elseif ((player:getVar("NAJI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Naji") == 9)) then
    player:PrintToPlayer("Naji : Bring me 35 of my Trust Tokens and 150,000 gil to raise my Berserk by 1%",0x0D);
  end
end;

-- 710  711  700  713  714  715  717  720  721  750  1008  1009  761
-- 762  782  805  845  877  938  939  940  941  942  971  969  970
function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 750) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addItem(16678);
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16678); -- Razor Axe
            player:delKeyItem(dsp.ki.YASINS_SWORD);
            player:setVar("theDoormanCS",0);
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,dsp.quest.id.bastok.THE_DOORMAN);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16678); -- Razor Axe
        end
    elseif (csid == 710) then
        player:delKeyItem(dsp.ki.ZERUHN_REPORT);
        player:completeMission(BASTOK,dsp.mission.id.bastok.THE_ZERUHN_REPORT);
    elseif (csid == 713) then
        player:addKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_BASTOK);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_TO_THE_CONSULS_BASTOK);
        player:setVar("MissionStatus",1);
    elseif (csid == 720 and option == 0 or csid == 721) then
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK);
        player:addKeyItem(dsp.ki.NEW_FEIYIN_SEAL);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.NEW_FEIYIN_SEAL);
        player:setVar("MissionStatus",10);
    elseif (csid == 720 and option == 1) then
        player:delKeyItem(dsp.ki.MESSAGE_TO_JEUNO_BASTOK);
        player:setVar("MissionStatus",1);
    elseif (csid == 761) then
        player:setVar("MissionStatus",1);
    elseif (csid == 714 or csid == 722 or csid == 762) then
        finishMissionTimeline(player,1,csid,option);
    end

end;