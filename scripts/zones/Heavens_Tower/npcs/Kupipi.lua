-----------------------------------
-- Area: Heaven's Tower
--  NPC: Kupipi
-- Involved in Mission 2-3
-- Involved in Quest: Riding on the Clouds
-- !pos 2 0.1 30 242
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
local ID = require("scripts/zones/Heavens_Tower/IDs");
-----------------------------------

function onTrade(player,npc,trade)

    local currentTokens = player:getVar("CurrentTokens_Kup");
    local war = 11988;
    local rdm = 11992;
    local kupipiSJ = player:getVar("TRUST_SJ_QUEST")

    if (trade:hasItemQty(war,1) and kupipiSJ >= 1) then
        player:setVar("KUPIPI_TYPE",1)
        player:PrintToPlayer("Kupipi : Ok! My Subjob is now Warrior.",0x0D);
    elseif (trade:hasItemQty(rdm,1) and kupipiSJ >= 2) then
        player:setVar("KUPIPI_TYPE",2)
        player:PrintToPlayer("Kupipi : Ok! My Subjob is now Red Mage.",0x0D);
    end

    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 8) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_4",0);
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SPIRITED_STONE);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SPIRITED_STONE);
        end
    end
    if (trade:hasItemQty(4365,1) and trade:getItemCount() == 1 and player:getNation() == dsp.nation.WINDURST and player:getRank() >= 2 and player:hasKeyItem(dsp.ki.PORTAL_CHARM) == false) then -- Trade Rolanberry
        if (player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.WRITTEN_IN_THE_STARS)) then
            player:startEvent(291); -- Qualifies for the reward immediately
        else
            player:startEvent(292); -- Kupipi owes you the portal charm later
        end
    end

    if ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 0) and (trade:hasItemQty(65535, 1000)) and (currentTokens >= 1)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's Attack is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAtt_Kup",5);
	  player:setVar("TributeRank_Kup",1);
	  currentTokens = currentTokens - 1;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 1) and (trade:hasItemQty(65535, 2000)) and (currentTokens >= 2)) then
	  player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's Accuracy is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAcc_Kup",5);
	  player:setVar("TributeRank_Kup",2);
	  currentTokens = currentTokens - 2;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 2) and (trade:hasItemQty(65535, 3000)) and (currentTokens >= 3)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's Cure Potency is raised by 2%! (Total: 2%)", 0x15);
	  player:setVar("TrustCure_Kup",2);
	  player:setVar("TributeRank_Kup",3);
	  currentTokens = currentTokens - 3;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 3) and (trade:hasItemQty(65535, 4000)) and (currentTokens >= 4)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's Cure Spellcasting Time is reduced by 4%! (Total: 4%)", 0x15);
	  player:setVar("TrustCast_Kup",4);
	  player:setVar("TributeRank_Kup",4);
	  currentTokens = currentTokens - 4;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 4) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= 5)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's Attack is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAtt_Kup",10);
	  player:setVar("TributeRank_Kup",5);
	  currentTokens = currentTokens - 5;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 5) and (trade:hasItemQty(65535, 10000)) and (currentTokens >= 10)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's Accuracy is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAcc_Kup",10);
	  player:setVar("TributeRank_Kup",6);
	  currentTokens = currentTokens - 10;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 6) and (trade:hasItemQty(65535, 15000)) and (currentTokens >= 15)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's Cure Potency is raised by 3%! (Total: 5%)", 0x15);
	  player:setVar("TrustCure_Kup",5);
	  player:setVar("TributeRank_Kup",7);
	  currentTokens = currentTokens - 15;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 7) and (trade:hasItemQty(65535, 30000)) and (currentTokens >= 20)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's Cure Spellcasting Time is reduced by 4%! (Total: 8%)", 0x15);
	  player:setVar("TrustCast_Kup",8);
	  player:setVar("TributeRank_Kup",8);
	  currentTokens = currentTokens - 20;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 8) and (trade:hasItemQty(65535, 75000)) and (currentTokens >= 30)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi's learns the spell 'Protectra V!", 0x15);
	  player:setVar("TrustPro_Kup",1);
	  player:setVar("TributeRank_Kup",9);
	  currentTokens = currentTokens - 30;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 9) and (trade:hasItemQty(65535, 150000)) and (currentTokens >= 35)) then
      player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Kupipi learns the spell 'Shellra V!", 0x15);
	  player:setVar("TrustShell_Kup",1);
	  player:setVar("TributeRank_Kup",10);
	  currentTokens = currentTokens - 35;
	  player:setVar("CurrentTokens_Kup",currentTokens);
    else
      player:PrintToPlayer("Kupipi : Please trade the correct amount of Tokens and Gil.",0x0D);
	end
end;

function onTrigger(player,npc)

    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local MissionStatus = player:getVar("MissionStatus");
    local kupipiSJ = player:getVar("KUPIPI_SJ_QUEST")

    if (kupipiSJ == 1) then
        player:PrintToPlayer(string.format("Kupipi : Hello %s.  My current Subjob is Warrior.", player:getName()),0x0D);
    elseif (kupipiSJ == 2) then
        player:PrintToPlayer(string.format("Kupipi : Hello %s.  My current Subjob is Red Mage.", player:getName()),0x0D);
    end

    if (player:getNation() == 0) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(898) == false) and (player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN) == true) then  -- Sandy Nation and mission 2-3 completed
	    player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Kupipi : Ah a Red Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(898);
	    player:PrintToPlayer("You are now able to summon the trust Kupipi!", 0x15);
    elseif (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(898) == false) and (player:hasCompletedMission(BASTOK,FETICHISM) == true) then  -- Bastok Nation and mission 2-3 completed
	    player:PrintToPlayer("Your Blue Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Kupipi : Ah a Red Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(898);
	    player:PrintToPlayer("You are now able to summon the trust Kupipi!", 0x15);
    elseif (player:getNation() == 2) and (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(898) == false) then  -- Windy Nation can obtain without pre-requisites
	    player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Kupipi : Ah a Green Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(898);
	    player:PrintToPlayer("You are now able to summon the trust Kupipi!", 0x15);
    end


    if (pNation == dsp.nation.SANDORIA) then
        -- San d'Oria Mission 2-3 Part I - Windurst > Bastok
        if (currentMission == dsp.mission.id.sandoria.JOURNEY_TO_WINDURST) then
            if (MissionStatus == 4) then
                player:startEvent(238,1,1,1,1,pNation);
            elseif (MissionStatus == 5) then
                player:startEvent(240);
            elseif (MissionStatus == 6) then
                player:startEvent(241);
            end
        -- San d'Oria Mission 2-3 Part II - Bastok > Windurst
        elseif (currentMission == dsp.mission.id.sandoria.JOURNEY_TO_WINDURST2) then
            if (MissionStatus == 7) then
                player:startEvent(242,1,1,1,1,0);
            elseif (MissionStatus == 8) then
                player:startEvent(243);
            elseif (MissionStatus == 9) then
                player:startEvent(246);
            elseif (MissionStatus == 10) then
                player:startEvent(247);
            end
        else
            player:startEvent(251);
        end
    elseif (pNation == dsp.nation.BASTOK) then
        -- Bastok Mission 2-3 Part I - Windurst > San d'Oria
        if (currentMission == dsp.mission.id.bastok.THE_EMISSARY_WINDURST) then
            if (MissionStatus == 3) then
                player:startEvent(238,1,1,1,1,pNation);
            elseif (MissionStatus <= 5) then
                player:startEvent(240);
            elseif (MissionStatus == 6) then
                player:startEvent(241);
            end
        -- Bastok Mission 2-3 Part II - San d'Oria > Windurst
        elseif (currentMission == dsp.mission.id.bastok.THE_EMISSARY_WINDURST2) then
            if (MissionStatus == 7) then
                player:startEvent(242,1,1,1,1,pNation);
            elseif (MissionStatus == 8) then
                player:startEvent(243);
            elseif (MissionStatus == 9) then
                player:startEvent(244);
            elseif (MissionStatus == 10) then
                player:startEvent(245);
            end
        else
            player:startEvent(251);
        end
    elseif (pNation == dsp.nation.WINDURST) then
        if (currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS and MissionStatus == 0) then
            player:startEvent(95,0,0,0,dsp.ki.LETTER_TO_THE_CONSULS_WINDURST);
        elseif (currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS and MissionStatus == 11) then
            player:startEvent(101,0,0,dsp.ki.ADVENTURERS_CERTIFICATE);
        elseif (currentMission == dsp.mission.id.windurst.THE_THREE_KINGDOMS) then
            player:startEvent(97);
        elseif (currentMission == dsp.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT and MissionStatus == 0) then
            player:startEvent(103,0,0,dsp.ki.STARWAY_STAIRWAY_BAUBLE);
        elseif (currentMission == dsp.mission.id.windurst.TO_EACH_HIS_OWN_RIGHT and MissionStatus == 1) then
            player:startEvent(104);
        elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_JESTER_WHO_D_BE_KING and MissionStatus == 3) then
            player:startEvent(326);
        elseif (player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.WRITTEN_IN_THE_STARS) and player:getVar("OwesPortalCharm") == 1) then
            player:startEvent(293); -- Kupipi repays your favor
        elseif (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.MOON_READING and MissionStatus >= 3) then
            player:startEvent(400); -- Kupipi in disbelief over player becoming Rank 10
        elseif (pNation == dsp.nation.WINDURST) and (player:getRank() == 10) then
            player:startEvent(408); -- After achieving Windurst Rank 10, Kupipi has more to say
        else
            player:startEvent(251);
        end

    else
        player:startEvent(251);
    end

	    ------- Trust Fight --------
	if ((mainlvl >= 71 and tribfight == 0 and (player:hasSpell(898)) and (player:getVar("FerretoryAura") >= 7) and (player:getVar("TRIB_FIGHT") ~= 1))) then
	player:PrintToPlayer("Kupipi : There is someone running around claming to be me at Balgas.  Please head there and I'll join you.", 0xD);
    player:PrintToPlayer("Kupipi : When you are ready, examine the Burning Circle in Balgas Dias and call me to your side.", 0xD);
	player:setVar("KUPIPI_TRIB_FIGHT",1);
    player:setVar("TRIB_FIGHT",1);
	elseif (mainlvl >= 75 and tribfight == 2 and (player:hasSpell(898))) then
	player:PrintToPlayer("Kupipi : You have done well to help with the imposter investigation.  I am in your debt.", 0xD);
	player:PrintToPlayer("You are now able to collect Trust Tokens for Kupipi!", 0x15);
	player:setVar("KUPIPI_TRIB_FIGHT",3);
    player:setVar("TRIB_FIGHT",0);
	end

-- Handle Token Quest
  if ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 0)) then
    player:PrintToPlayer("Kupipi : Bring me 1 of my Trust Tokens and 1,000 gil to raise my Attack by 5",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 1)) then
    player:PrintToPlayer("Kupipi : Bring me 2 of my Trust Tokens and 2,000 gil to raise my Accuracy by 5",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 2)) then
    player:PrintToPlayer("Kupipi : Bring me 3 of my Trust Tokens and 3,000 gil to raise my Cure Potency by 2%",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 3)) then
    player:PrintToPlayer("Kupipi : Bring me 4 of my Trust Tokens and 4,000 gil to lower my Cure Casting by 4%",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 4)) then
    player:PrintToPlayer("Kupipi : Bring me 5 of my Trust Tokens and 5,000 gil to raise my Attack by 5",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 5)) then
    player:PrintToPlayer("Kupipi : Bring me 10 of my Trust Tokens and 10,000 gil to raise my Accuracy by 5",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 6)) then
    player:PrintToPlayer("Kupipi : Bring me 15 of my Trust Tokens and 15,000 gil to raise Cure Potency by 3%",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 7)) then
    player:PrintToPlayer("Kupipi : Bring me 20 of my Trust Tokens and 30,000 gil to lower my Cure Casting by 4%",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 8)) then
    player:PrintToPlayer("Kupipi : Bring me 30 of my Trust Tokens and 75,000 gil so I can learn the spell 'Protectra V'",0x0D);
  elseif ((player:getVar("KUPIPI_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Kup") == 9)) then
    player:PrintToPlayer("Kupipi : Bring me 35 of my Trust Tokens and 150,000 gil so I can learn the spell 'Shellra V'",0x0D);
  end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 238) then
        if (player:getNation() == dsp.nation.BASTOK) then
            player:setVar("MissionStatus",4);
            player:addKeyItem(dsp.ki.SWORD_OFFERING);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SWORD_OFFERING);
        else
            player:setVar("MissionStatus",5);
            player:addKeyItem(dsp.ki.SHIELD_OFFERING);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SHIELD_OFFERING);
        end
    elseif (csid == 244 or csid == 246) then
        player:setVar("MissionStatus",10);
    elseif (csid == 242) then
        player:addKeyItem(dsp.ki.DARK_KEY);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DARK_KEY);
        player:setVar("MissionStatus",8);
    elseif (csid == 95) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(dsp.ki.LETTER_TO_THE_CONSULS_WINDURST);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LETTER_TO_THE_CONSULS_WINDURST);
    elseif (csid == 103) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(dsp.ki.STARWAY_STAIRWAY_BAUBLE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.STARWAY_STAIRWAY_BAUBLE);
    elseif (csid == 101) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 291) then -- All condition met, grant Portal Charm
        player:tradeComplete();
        player:addKeyItem(dsp.ki.PORTAL_CHARM);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PORTAL_CHARM);
    elseif (csid == 292) then -- Traded rolanberry, but not all conditions met
        player:tradeComplete();
        player:setVar("OwesPortalCharm",1);
    elseif (csid == 293) then -- Traded rolanberry before, and all conditions are now met
        player:setVar("OwesPortalCharm",0);
        player:addKeyItem(dsp.ki.PORTAL_CHARM);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PORTAL_CHARM);
    elseif (csid == 326) then
        player:setVar("MissionStatus",4);
    elseif (csid == 400) then
        player:setVar("KupipiDisbelief",0);
    elseif (csid == 408) then
        player:setVar("KupipiRankTenText",1);
    end

end;