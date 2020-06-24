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

    local war = 11988;
    local rdm = 11992;
    local kupipiSJ = player:getVar("TRUST_SJ_QUEST")

    local currentTokens = player:getVar("CurrentTokens_Kupipi");
    local trib = player:getVar("[TRUST]KUPIPI_TRIB");
    local rank = player:getVar("[TRUST]KupipiRank")
    local subRank = player:getVar("[TRUST]KupipiSubRank")
    local total = player:getVar("[TRUST]KupipiTokensTotal")
    local quest = job.WHM.finish[subRank]
    local finish = dialog.finish
    local meritCount = getMeritCount()


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

    if (trib == 1 and trade:hasItemQty(1428) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Kupipi : "..finish,0x0D);
        player:setVar("[TRUST]KUPIPI_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Kupipi : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]KupipiTokensTotal",total)
        player:PrintToPlayer("Kupipi's "..quest.."  (Total Tokens: "..total.."/550)",0x0D);
	    currentTokens = currentTokens - rank + 1;
	    player:setVar("CurrentTokens_Kupipi",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]KupipiSubRank",0)
            player:setVar("[TRUST]KupipiRank",rank + 1)
            rank = player:getVar("[TRUST]KupipiRank")
            player:PrintToPlayer("Kupipi's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]KupipiSubRank",subRank)
        end
        player:tradeComplete()

        -- Trust Point Bonus
        total = player:getVar("[TRUST]KupipiTokensTotal")
        if (total >= 550) then
            player:setVar("[TRUST]KUPIPI_POINTS_PLUS",26)
            player:PrintToPlayer("Kupipi's will now receive a 26% Trust Point Bonus!", 0x15);
        elseif (total >= 475) then
            player:setVar("[TRUST]KUPIPI_POINTS_PLUS",23)
            player:PrintToPlayer("Kupipi's will now receive a 23% Trust Point Bonus!", 0x15);
        elseif (total >= 400) then
            player:setVar("[TRUST]KUPIPI_POINTS_PLUS",20)
            player:PrintToPlayer("Kupipi's will now receive a 20% Trust Point Bonus!", 0x15);
        elseif (total >= 325) then
            player:setVar("[TRUST]KUPIPI_POINTS_PLUS",17)
            player:PrintToPlayer("Kupipi's will now receive a 17% Trust Point Bonus!", 0x15);
        elseif (total >= 250) then
            player:setVar("[TRUST]KUPIPI_POINTS_PLUS",14)
            player:PrintToPlayer("Kupipi's will now receive a 14% Trust Point Bonus!", 0x15);
        elseif (total >= 175) then
            player:setVar("[TRUST]KUPIPI_POINTS_PLUS",11)
            player:PrintToPlayer("Kupipi's will now receive a 11% Trust Point Bonus!", 0x15);
        elseif (total >= 100) then
            player:setVar("[TRUST]KUPIPI_POINTS_PLUS",8)
            player:PrintToPlayer("Kupipi's will now receive a 8% Trust Point Bonus!", 0x15);
        elseif (total >= 25) then
            player:setVar("[TRUST]KUPIPI_POINTS_PLUS",5)
            player:PrintToPlayer("Kupipi's will now receive a 5% Trust Point Bonus!", 0x15);
        end
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

    if (player:getNation() == 0) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(898) == false) and (player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.SAVE_THE_CHILDREN) == true) then  -- Sandy Nation and mission 2-3 completed
	    player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Kupipi : Ah a Red Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(898);
	    player:PrintToPlayer("You are now able to summon the trust Kupipi!", 0x15);
    elseif (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(898) == false) and (player:hasCompletedMission(BASTOK,dsp.mission.id.bastok.FETICHISM) == true) then  -- Bastok Nation and mission 2-3 completed
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


	-- ------------------------ --
    --   Kupipi Tribute Unlock  --
    -- ------------------------ --
	if (mLvL >= 75 and player:hasSpell(898) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Kupipi : "..start, 0xD);
        player:setVar("[TRUST]KUPIPI_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Kupipi : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = job.WHM.start[subRank]
        local token = subRank + 1
        player:PrintToPlayer("Kupipi : Bring me "..token.." of my Trust Tokens and 5,000 gil to "..quest,0x0D);
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