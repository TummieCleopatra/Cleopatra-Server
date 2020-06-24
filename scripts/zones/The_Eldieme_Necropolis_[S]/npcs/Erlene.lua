-----------------------------------
-- Area: The Eldieme Necropolis (S)
--  NPC: Erlene
-- Involved in Quest: "A Little Knowledge"
-- !pos 376.936 -39.999 17.914 175
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis_[S]/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local ALittleKnowledge = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_LITTLE_KNOWLEDGE);
    local ALittleKnowledgeProgress = player:getVar("ALittleKnowledge");

    if (ALittleKnowledge == QUEST_ACCEPTED and ALittleKnowledgeProgress == 1) then
        if (trade:hasItemQty(2550, 12) and trade:getGil() == 0 and trade:getItemCount() == 12) then
            if( player:getMainJob() == dsp.job.BLM or
                player:getMainJob() == dsp.job.RDM or
                player:getMainJob() == dsp.job.SMN or
                player:getMainJob() == dsp.job.BLU) then
                player:startEvent(12, 1);
            else
                player:startEvent(12);
            end
        end
    end

    local currentTokens = player:getVar("CurrentTokens_Adelheid");
    local trib = player:getVar("[TRUST]ADELHEID_TRIB");
    local rank = player:getVar("[TRUST]AdelheidRank")
    local subRank = player:getVar("[TRUST]AdelheidSubRank")
    local total = player:getVar("[TRUST]AdelheidTokensTotal")
    local quest = job.SCH.finish[subRank]
    local finish = dialog.finish
    local meritCount = getMeritCount()



    if (trib == 1 and trade:hasItemQty(2557,1) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Adelheid : "..finish,0x0D);
        player:setVar("[TRUST]ADELHEID_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Adelheid : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]AdelheidTokensTotal",total)
        player:PrintToPlayer("Adelheid's "..quest.."  (Total Tokens: "..total.."/550)",0x0D);
	    currentTokens = currentTokens - rank + 1;
	    player:setVar("CurrentTokens_Adelheid",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]AdelheidSubRank",0)
            player:setVar("[TRUST]AdelheidRank",rank + 1)
            rank = player:getVar("[TRUST]AdelheidRank")
            player:PrintToPlayer("Adelheid's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]AdelheidSubRank",subRank)
        end
        player:tradeComplete()

        -- Trust Point Bonus
        total = player:getVar("[TRUST]AdelheidTokensTotal")
        if (total >= 550) then
            player:setVar("[TRUST]ADELHEID_POINTS_PLUS",26)
            player:PrintToPlayer("Adelheid will now receive a 26% Trust Point Bonus!", 0x15);
        elseif (total >= 475) then
            player:setVar("[TRUST]ADELHEID_POINTS_PLUS",23)
            player:PrintToPlayer("Adelheid will now receive a 23% Trust Point Bonus!", 0x15);
        elseif (total >= 400) then
            player:setVar("[TRUST]ADELHEID_POINTS_PLUS",20)
            player:PrintToPlayer("Adelheid will now receive a 20% Trust Point Bonus!", 0x15);
        elseif (total >= 325) then
            player:setVar("[TRUST]ADELHEID_POINTS_PLUS",17)
            player:PrintToPlayer("Adelheid will now receive a 17% Trust Point Bonus!", 0x15);
        elseif (total >= 250) then
            player:setVar("[TRUST]ADELHEID_POINTS_PLUS",14)
            player:PrintToPlayer("Adelheid will now receive a 14% Trust Point Bonus!", 0x15);
        elseif (total >= 175) then
            player:setVar("[TRUST]ADELHEID_POINTS_PLUS",11)
            player:PrintToPlayer("Adelheid will now receive a 11% Trust Point Bonus!", 0x15);
        elseif (total >= 100) then
            player:setVar("[TRUST]ADELHEID_POINTS_PLUS",8)
            player:PrintToPlayer("Adelheid will now receive a 8% Trust Point Bonus!", 0x15);
        elseif (total >= 25) then
            player:setVar("[TRUST]ADELHEID_POINTS_PLUS",5)
            player:PrintToPlayer("Adelheid will now receive a 5% Trust Point Bonus!", 0x15);
        end
    else
        player:PrintToPlayer("Adelheid : Please trade the correct amount of Tokens and Gil.",0x0D);
	end
end;

function onTrigger(player,npc)

    local ALittleKnowledge = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_LITTLE_KNOWLEDGE);
    local ALittleKnowledgeProgress = player:getVar("ALittleKnowledge");
    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();
    local onSabbatical = player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.ON_SABBATICAL);
    local onSabbaticalProgress = player:getVar("OnSabbatical");
    local downwardHelix = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.DOWNWARD_HELIX);
	local mainlvl = player:getMainLvl();
    local tribfight = player:getVar("ADEL_TRIB_FIGHT");

    if (ALittleKnowledge == QUEST_AVAILABLE) then
        if (mLvl >= ADVANCED_JOB_LEVEL) then
            player:startEvent(10,1);
        else
            player:startEvent(10);
        end
    elseif (ALittleKnowledgeProgress == 1 and ALittleKnowledge == QUEST_ACCEPTED) then
        player:startEvent(11);
    elseif (ALittleKnowledgeProgress == 2 and ALittleKnowledge == QUEST_ACCEPTED) then
        if (player:hasStatusEffect(dsp.effect.MANAFONT) or
            player:hasStatusEffect(dsp.effect.CHAINSPELL) or
            player:hasStatusEffect(dsp.effect.ASTRAL_FLOW) or
            player:hasStatusEffect(dsp.effect.AZURE_LORE)) then
            player:startEvent(14);
        else
            player:startEvent(13);
        end
    elseif (ALittleKnowledge == QUEST_COMPLETED and mJob == dsp.job.SCH and mLvl >= 5 and not (player:hasSpell(478) and player:hasSpell(502))) then
            player:startEvent(47);
    elseif (onSabbatical == QUEST_AVAILABLE and mJob == dsp.job.SCH and mLvl >= AF1_QUEST_LEVEL) then
            player:startEvent(18);
    elseif (onSabbatical == QUEST_ACCEPTED) then
        if (onSabbaticalProgress < 3) then
            player:startEvent(19);
        else
            player:startEvent(20);
        end
    elseif (onSabbatical == QUEST_COMPLETED and player:getVar("Erlene_Sabbatical_Timer")~=VanadielDayOfTheYear() and mJob == dsp.job.SCH and mLvl >= AF2_QUEST_LEVEL and downwardHelix == QUEST_AVAILABLE) then
        player:startEvent(23);
    elseif (downwardHelix == QUEST_ACCEPTED) then
        if (player:getVar("DownwardHelix") == 0) then
            player:startEvent(24);
        elseif (player:getVar("DownwardHelix") == 1) then
            player:startEvent(25);
        elseif (player:getVar("DownwardHelix") < 4) then
            player:startEvent(26);
        else
            player:startEvent(27);
        end
    else
        player:startEvent(15);
    end

    if (player:getMainJob() == 20) and (player:hasSpell(968) == false) and (player:getMainLvl() >= 15) then
	    player:addItem(10153);
        player:messageSpecial(ID.text.ITEM_OBTAINED,10153);
	    player:setVar("TrustMB",10);
	end

	-- ------------------------ --
    --   Adelheid Tribute Unlock  --
    -- ------------------------ --
	if (mLvL >= 75 and player:hasSpell(968) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Adelheid : "..start, 0xD);
        player:setVar("[TRUST]ADELHEID_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Adelheid : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = job.SCH.start[subRank]
        local token = subRank + 1
        player:PrintToPlayer("Adelheid : Bring me "..token.." of my Trust Tokens and 5,000 gil to "..quest,0x0D);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 10 and option == 0) then
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_LITTLE_KNOWLEDGE);
        player:setVar("ALittleKnowledge", 1);
    elseif (csid == 12) then
        player:tradeComplete();
        player:setVar("ALittleKnowledge", 2);
    elseif (csid == 14) then
        player:addKeyItem(dsp.ki.GRIMOIRE);
        player:unlockJob(dsp.job.SCH);
        player:addTitle(dsp.title.SCHULTZ_SCHOLAR);
        player:setVar("ALittleKnowledge", 0);
        player:setVar("SheetsofVellum", 0);
        player:messageSpecial(ID.text.YOU_CAN_NOW_BECOME_A_SCHOLAR);
        player:completeQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_LITTLE_KNOWLEDGE);
    elseif (csid == 47) then
        if (player:canLearnSpell(478) and player:canLearnSpell(502)) then
            player:addSpell(478, true);
            player:addSpell(502, true);
            player:messageSpecial(ID.text.YOU_LEARN_EMBRAVA_AND_KAUSTRA);
        end
    elseif (csid == 18) then
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.ON_SABBATICAL);
        player:addKeyItem(dsp.ki.ULBRECHTS_SEALED_LETTER);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.ULBRECHTS_SEALED_LETTER);
        player:setVar("OnSabbatical", 1);
    elseif (csid == 20) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
        else
            player:delKeyItem(dsp.ki.ULBRECHTS_SEALED_LETTER);
            player:delKeyItem(dsp.ki.SCHULTS_SEALED_LETTER);
            player:completeQuest(CRYSTAL_WAR,dsp.quest.id.crystalWar.ON_SABBATICAL);
            player:addItem(6058); --klimaform
            player:messageSpecial(ID.text.ITEM_OBTAINED, 6058);
            player:setVar("onSabbatical",0);
            player:setVar("Erlene_Sabbatical_Timer",VanadielDayOfTheYear());
        end
    elseif (csid == 23) then
        player:setVar("Erlene_Sabbatical_Timer",0);
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.DOWNWARD_HELIX);
    elseif (csid == 25) then
        player:setVar("DownwardHelix",2);
    elseif (csid == 27) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED);
        else
            player:completeQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.DOWNWARD_HELIX);
            player:addItem(15004); -- Schlar's Bracers
            player:messageSpecial(ID.text.ITEM_OBTAINED, 15004);
            player:setVar("DownwardHelix",0);
        end
    end
end;
