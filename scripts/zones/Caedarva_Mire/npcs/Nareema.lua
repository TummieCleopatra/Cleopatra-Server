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
    local currentTokens = player:getVar("CurrentTokens_Darrcuiln");
    local trib = player:getVar("[TRUST]DARRCUILN_TRIB");
    local rank = player:getVar("[TRUST]DarrcuilnRank")
    local subRank = player:getVar("[TRUST]DarrcuilnSubRank")
    local total = player:getVar("[TRUST]DarrcuilnTokensTotal")
    local quest = job.BLU.finish[subRank]
    local finish = dialog.finish
    local meritCount = getMeritCount()



    if (trib == 1 and trade:hasItemQty(2331,1) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Nareema : "..finish,0x0D);
        player:setVar("[TRUST]DARRCUILN_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Nareema : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]DarrcuilnTokensTotal",total)
        player:PrintToPlayer("Darrcuiln's "..quest.."  (Total Tokens: "..total.."/550)",0x0D);
	    currentTokens = currentTokens - rank + 1;
	    player:setVar("CurrentTokens_Darrcuiln",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]DarrcuilnSubRank",0)
            player:setVar("[TRUST]DarrcuilnRank",rank + 1)
            rank = player:getVar("[TRUST]DarrcuilnRank")
            player:PrintToPlayer("Darrcuiln's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]DarrcuilnSubRank",subRank)
        end
        player:tradeComplete()

        -- Trust Point Bonus
        total = player:getVar("[TRUST]DarrcuilnTokensTotal")
        if (total >= 550) then
            player:setVar("[TRUST]DARRCUILN_POINTS_PLUS",26)
            player:PrintToPlayer("Darrcuiln will now receive a 26% Trust Point Bonus!", 0x15);
        elseif (total >= 475) then
            player:setVar("[TRUST]DARRCUILN_POINTS_PLUS",23)
            player:PrintToPlayer("Darrcuiln will now receive a 23% Trust Point Bonus!", 0x15);
        elseif (total >= 400) then
            player:setVar("[TRUST]DARRCUILN_POINTS_PLUS",20)
            player:PrintToPlayer("Darrcuiln will now receive a 20% Trust Point Bonus!", 0x15);
        elseif (total >= 325) then
            player:setVar("[TRUST]DARRCUILN_POINTS_PLUS",17)
            player:PrintToPlayer("Darrcuiln will now receive a 17% Trust Point Bonus!", 0x15);
        elseif (total >= 250) then
            player:setVar("[TRUST]DARRCUILN_POINTS_PLUS",14)
            player:PrintToPlayer("Darrcuiln will now receive a 14% Trust Point Bonus!", 0x15);
        elseif (total >= 175) then
            player:setVar("[TRUST]DARRCUILN_POINTS_PLUS",11)
            player:PrintToPlayer("Darrcuiln will now receive a 11% Trust Point Bonus!", 0x15);
        elseif (total >= 100) then
            player:setVar("[TRUST]DARRCUILN_POINTS_PLUS",8)
            player:PrintToPlayer("Darrcuiln will now receive a 8% Trust Point Bonus!", 0x15);
        elseif (total >= 25) then
            player:setVar("[TRUST]DARRCUILN_POINTS_PLUS",5)
            player:PrintToPlayer("Darrcuiln will now receive a 5% Trust Point Bonus!", 0x15);
        end
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

	-- ------------------------ --
    --   Darrcuiln Tribute Unlock  --
    -- ------------------------ --
	if (mLvL >= 75 and player:hasSpell(991) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Nareema : "..start, 0xD);
        player:setVar("[TRUST]DARRCUILN_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Nareema : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = job.BLU.start[subRank]
        local token = subRank + 1
        player:PrintToPlayer("Nareema : Bring me "..token.." of Darrcuiln's Trust Tokens and 5,000 gil to "..quest,0x0D);
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
