-----------------------------------
-- Area: Metalworks
--  NPC: Ayame
-- Involved in Missions
-- Starts and Finishes Quest: True Strength
-- !pos 133 -19 34 237
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
local ID = require("scripts/zones/Metalworks/IDs");
require("scripts/globals/trust_points");
-----------------------------------

function onTrade(player,npc,trade)
    local currentTokens = player:getVar("CurrentTokens_Ayame");
    local trib = player:getVar("[TRUST]AYAME_TRIB");
    local rank = player:getVar("[TRUST]AyameRank")
    local subRank = player:getVar("[TRUST]AyameSubRank")
    local total = player:getVar("[TRUST]AyameTokensTotal")
    local quest = trustjob.SAM.finish[subRank]
    local finish = dialog.finish
    local meritCount = player:getMeritCount()


    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.TRUE_STRENGTH) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(1100,1) and trade:getItemCount() == 1) then -- Trade Xalmo Feather
            player:startEvent(749); -- Finish Quest "True Strength"
        end
    end

    local sjQuest = player:getVar("TRUST_SJ_QUEST")
    local war = 11988;
    local rdm = 11992;
    local sam = 11999;
    local nin = 12000;
    if (trade:hasItemQty(war, 1) and sjQuest >= 1) then
        player:setVar("AYAME_TYPE", 1)
        player:PrintToPlayer("Ayame's Subjob is now Warrior!", 0x15);
    end

    if (trib == 1 and trade:hasItemQty(1437,1) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Ayame : "..finish,0x0D);
        player:setVar("[TRUST]AYAME_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Ayame : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]AyameTokensTotal",total)
        local perc = ""
        local tokamt = 0
        if (subRank == 4 or subRank == 9) then
           tokamt = (rank + 1) * 2
           perc = ""
        else
           tokamt = rank + 1
           perc = ""
        end
        player:PrintToPlayer("Ayame's "..quest.." "..tokamt..""..perc.." (Total Tokens: "..total.."/550)",0x15);
	    currentTokens = currentTokens - (rank + 1);
	    player:setVar("CurrentTokens_Ayame",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]AyameSubRank",0)
            player:setVar("[TRUST]AyameRank",rank + 1)
            rank = player:getVar("[TRUST]AyameRank")
            player:PrintToPlayer("Ayame's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]AyameSubRank",subRank)
        end
        player:tradeComplete()

        -- Trust Point Bonus
        total = player:getVar("[TRUST]AyameTokensTotal")
        if (total >= 550) then
            player:setVar("[TRUST]AYAME_POINTS_PLUS",26)
            player:PrintToPlayer("Ayame's will now receive a 26% Trust Point Bonus!", 0x15);
        elseif (total >= 475) then
            player:setVar("[TRUST]AYAME_POINTS_PLUS",23)
            player:PrintToPlayer("Ayame's will now receive a 23% Trust Point Bonus!", 0x15);
        elseif (total >= 400) then
            player:setVar("[TRUST]AYAME_POINTS_PLUS",20)
            player:PrintToPlayer("Ayame's will now receive a 20% Trust Point Bonus!", 0x15);
        elseif (total >= 325) then
            player:setVar("[TRUST]AYAME_POINTS_PLUS",17)
            player:PrintToPlayer("Ayame's will now receive a 17% Trust Point Bonus!", 0x15);
        elseif (total >= 250) then
            player:setVar("[TRUST]AYAME_POINTS_PLUS",14)
            player:PrintToPlayer("Ayame's will now receive a 14% Trust Point Bonus!", 0x15);
        elseif (total >= 175) then
            player:setVar("[TRUST]AYAME_POINTS_PLUS",11)
            player:PrintToPlayer("Ayame's will now receive a 11% Trust Point Bonus!", 0x15);
        elseif (total >= 100) then
            player:setVar("[TRUST]AYAME_POINTS_PLUS",8)
            player:PrintToPlayer("Ayame's will now receive a 8% Trust Point Bonus!", 0x15);
        elseif (total >= 25) then
            player:setVar("[TRUST]AYAME_POINTS_PLUS",5)
            player:PrintToPlayer("Ayame's will now receive a 5% Trust Point Bonus!", 0x15);
        end
    else
        player:PrintToPlayer("Ayame : Please trade the correct amount of Tokens and Gil.",0x0D);
	end


end;

function onTrigger(player,npc)

    local trueStrength = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.TRUE_STRENGTH);
    local WildcatBastok = player:getVar("WildcatBastok");

	local pNation = player:getNation();
	local currentMission = player:getCurrentMission(pNation);
	local srank = getNationRank(dsp.nation.SANDORIA);
	local tribfight = player:getVar("AYAME_TRIB_FIGHT");
	local mainlvl = player:getMainLvl();
    local subRank = player:getVar("[TRUST]AyameSubRank")
    local mainRank = player:getVar("[TRUST]AyameRank")
    local trib = player:getVar("[TRUST]AYAME_TRIB");

    if (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BLUE_INSTITUTE_CARD)) and (player:hasSpell(900) == false) then  -- Bastok Nation and mission 2-3
	player:PrintToPlayer("Your Blue Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Ayame : Ah a Red Institute Card.  My blade is ready to assist you", 0xD);
    player:addSpell(900);
	player:PrintToPlayer("You are now able to summon the trust Ayame!", 0x15);
    elseif ((pNation == 2 and player:hasCompletedMission(pNation,2) == true) and (player:hasKeyItem(dsp.ki.GREEN_INSTITUTE_CARD)) and (player:hasSpell(900) == false)) then -- Windy Nation can obtain when rank is higher than 1
	player:PrintToPlayer("Your Green Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Ayame : Ah a Green Institute Card.  My blade is ready to assist you", 0xD);
    player:addSpell(900);
	player:PrintToPlayer("You are now able to summon the trust Ayame!", 0x15);
	elseif ((pNation == 0 and player:hasCompletedMission(pNation,2) == true) and (player:hasKeyItem(dsp.ki.RED_INSTITUTE_CARD)) and (player:hasSpell(900) == false)) then  -- Sandy Nation can obtain when rank is higher than 2
	player:PrintToPlayer("Your Red Institute Card flashes brilliantly!", 0x1C);
    player:PrintToPlayer("Ayame : Ah a Red Institute Card.  My blade is ready to assist you", 0xD);
    player:addSpell(900);
	player:PrintToPlayer("You are now able to summon the trust Ayame!", 0x15);
    end

	-- ------------------------ --
    --   Ayame Tribute Unlock   --
    -- ------------------------ --
	if (mainlvl >= 75 and player:hasSpell(900) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Ayame : "..start, 0xD);
        player:setVar("[TRUST]AYAME_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Ayame : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = trustjob.SAM.start[subRank]
        local token = mainRank + 1
        player:PrintToPlayer("Ayame : Bring me "..token.." of my Trust Tokens and 5,000 gil to "..quest,0x0D);
    end


    if (player:getQuestStatus(BASTOK,dsp.quest.id.bastok.LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,9) == false) then
        player:startEvent(935);
    elseif (player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_CRYSTAL_LINE and player:hasKeyItem(dsp.ki.C_L_REPORTS)) then
        player:startEvent(712);
    elseif (trueStrength == QUEST_AVAILABLE and player:getMainJob() == dsp.job.MNK and player:getMainLvl() >= 50) then
        player:startEvent(748); -- Start Quest "True Strength"
    else
        player:startEvent(701); -- Standard dialog
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 712) then
        finishMissionTimeline(player,1,csid,option);
    elseif (csid == 748) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.TRUE_STRENGTH);
    elseif (csid == 749) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14215); -- Temple Hose
        else
            player:tradeComplete();
            player:addTitle(dsp.title.PARAGON_OF_MONK_EXCELLENCE);
            player:addItem(14215);
            player:messageSpecial(ID.text.ITEM_OBTAINED,14215); -- Temple Hose
            player:addFame(BASTOK,AF3_FAME);
            player:completeQuest(BASTOK,dsp.quest.id.bastok.TRUE_STRENGTH);
        end
    elseif (csid == 935) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",9,true);
    end

end;