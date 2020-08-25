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
require("scripts/globals/trust_points");
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
    local currentTokens = player:getVar("CurrentTokens_Naji");
    local trib = player:getVar("[TRUST]NAJI_TRIB");
    local rank = player:getVar("[TRUST]NajiRank")
    local subRank = player:getVar("[TRUST]NajiSubRank")
    local total = player:getVar("[TRUST]NajiTokensTotal")
    local quest = trustjob.WAR.finish[subRank]
    local finish = dialog.finish
    local meritCount = player:getMeritCount()



    if (trib == 1 and trade:hasItemQty(1426,1) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Naji : "..finish,0x0D);
        player:setVar("[TRUST]NAJI_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Naji : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]NajiTokensTotal",total)
        local perc = ""
        local tokamt = 0
        tokamt = rank + 1
        perc = ""
        player:PrintToPlayer("Naji's "..quest.." "..tokamt..""..perc.." (Total Tokens: "..total.."/550)",0x15);
	    currentTokens = currentTokens - (rank + 1);
	    player:setVar("CurrentTokens_Naji",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]NajiSubRank",0)
            player:setVar("[TRUST]NajiRank",rank + 1)
            rank = player:getVar("[TRUST]NajiRank")
            player:PrintToPlayer("Naji's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]NajiSubRank",subRank)
        end
        player:tradeComplete()

        -- Trust Point Bonus
        total = player:getVar("[TRUST]NajiTokensTotal")
        if (total >= 550) then
            player:setVar("[TRUST]NAJI_POINTS_PLUS",26)
            player:PrintToPlayer("Naji will now receive a 26% Trust Point Bonus!", 0x15);
        elseif (total >= 475) then
            player:setVar("[TRUST]NAJI_POINTS_PLUS",23)
            player:PrintToPlayer("Naji will now receive a 23% Trust Point Bonus!", 0x15);
        elseif (total >= 400) then
            player:setVar("[TRUST]NAJI_POINTS_PLUS",20)
            player:PrintToPlayer("Naji will now receive a 20% Trust Point Bonus!", 0x15);
        elseif (total >= 325) then
            player:setVar("[TRUST]NAJI_POINTS_PLUS",17)
            player:PrintToPlayer("Naji will now receive a 17% Trust Point Bonus!", 0x15);
        elseif (total >= 250) then
            player:setVar("[TRUST]NAJI_POINTS_PLUS",14)
            player:PrintToPlayer("Naji will now receive a 14% Trust Point Bonus!", 0x15);
        elseif (total >= 175) then
            player:setVar("[TRUST]NAJI_POINTS_PLUS",11)
            player:PrintToPlayer("Naji will now receive a 11% Trust Point Bonus!", 0x15);
        elseif (total >= 100) then
            player:setVar("[TRUST]NAJI_POINTS_PLUS",8)
            player:PrintToPlayer("Naji will now receive a 8% Trust Point Bonus!", 0x15);
        elseif (total >= 25) then
            player:setVar("[TRUST]NAJI_POINTS_PLUS",5)
            player:PrintToPlayer("Naji will now receive a 5% Trust Point Bonus!", 0x15);
        end
    else
        player:PrintToPlayer("Naji : Please trade the correct amount of Tokens and Gil.",0x0D);
	end

end;

function onTrigger(player,npc)
    local srank = player:getRank();
	local wrank = player:getRank();
	local brank = player:getRank();
    local pNation = player:getNation();
	local mainlvl = player:getMainLvl();
    local tribfight = player:getVar("NAJI_TRIB_FIGHT");
    local subRank = player:getVar("[TRUST]NajiSubRank")
    local mainRank = player:getVar("[TRUST]NajiRank")
    local trib = player:getVar("[TRUST]NAJI_TRIB");


	if ((pNation == 0 and player:hasCompletedMission(pNation,2) == true) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(897) == false)) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
        player:PrintToPlayer("Naji : Ah a Red Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(897);
	elseif (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(897) == false) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Red Institute Card flashes dimly!", 0x1C);
        player:PrintToPlayer("Naji : I cannot recognize your efforts.  Please try again at a higher rank", 0xD);
    end

	if ((pNation == 2 and player:hasCompletedMission(pNation,2) == true) and (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(897) == false)) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Green Institute Card flashes brilliantly...", 0x1C);
        player:PrintToPlayer("Naji : Ah a Green Institute Card.  From now on, you can summon me to help you with your battles", 0xD);
        player:addSpell(897);
	elseif (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(897) == false) then  -- Sandy Rnak 4 or higher
	    player:PrintToPlayer("Your Green Institute Card flashes dimly...", 0x1C);
        player:PrintToPlayer("Naji : I cannot recognize your efforts.  Please try again at a higher rank", 0xD);
    end

    if ((pNation == 1 and player:hasCompletedMission(pNation,0) == true) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(897) == false)) then  -- Sandy Rnak 4 or higher
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

	-- ------------------------ --
    --   Naji Tribute Unlock  --
    -- ------------------------ --
	if (mainlvl >= 75 and player:hasSpell(897) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Naji : "..start, 0xD);
        player:setVar("[TRUST]NAJI_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Naji : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = trustjob.WAR.start[subRank]
        local token = mainRank + 1
        player:PrintToPlayer("Naji : Bring me "..token.." of my Trust Tokens and 5,000 gil to "..quest,0x0D);
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