-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Curilla
-- Starts and Finishes Quest: The General's Secret, Enveloped in Darkness, Peace for the Spirit,
--                            Lure of the Wildcat (San d'Oria), Old Wounds
-- !pos 27 0.1 0.1 233
-----------------------------------
local ID = require("scripts/zones/Chateau_dOraguille/IDs")
require("scripts/globals/trust_points")
require("scripts/globals/keyitems")
require("scripts/globals/settings")
require("scripts/globals/wsquest")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

local wsQuest = dsp.wsquest.savage_blade

function onTrade(player,npc,trade)
    local wsQuestEvent = dsp.wsquest.getTradeEvent(wsQuest,player,trade)

    local currentTokens = player:getVar("CurrentTokens_Curilla");
    local trib = player:getVar("[TRUST]CURILLA_TRIB");
    local rank = player:getVar("[TRUST]CurillaRank")
    local subRank = player:getVar("[TRUST]CurillaSubRank")
    local total = player:getVar("[TRUST]CurillaTokensTotal")
    local quest = job.PLD.finish[subRank]
    local finish = dialog.finish
    local meritCount = getMeritCount()



    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    end

    if (trib == 1 and trade:hasItemQty(1432) and meritCount >= 5) then
        player:tradeComplete()
        player:setMerits(meritCount - 5)
        player:PrintToPlayer("Curilla : "..finish,0x0D);
        player:setVar("[TRUST]CURILLA_TRIB",2)
    elseif ((trib == 2) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= rank + 1)) then
        player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
        total = total + 1
        player:setVar("[TRUST]CurillaTokensTotal",total)
        player:PrintToPlayer("Curilla's "..quest.."  (Total Tokens: "..total.."/550)",0x0D);
	    currentTokens = currentTokens - rank + 1;
	    player:setVar("CurrentTokens_Curilla",currentTokens);
        subRank = subRank + 1
        if (subRank > 9) then
            player:setVar("[TRUST]CurillaSubRank",0)
            player:setVar("[TRUST]CurillaRank",rank + 1)
            rank = player:getVar("[TRUST]CurillaRank")
            player:PrintToPlayer("Curilla's Tribute Rank has risen to "..rank.."!", 0x15);
        else
            player:setVar("[TRUST]CurillaSubRank",subRank)
        end
        player:tradeComplete()
    else
        player:PrintToPlayer("Curilla : Please trade the correct amount of Tokens and Gil.",0x0D);
	end
end

function onTrigger(player,npc)
    local wsQuestEvent = dsp.wsquest.getTriggerEvent(wsQuest,player)
    local mLvL = player:getMainLvl()
    local mJob = player:getMainJob()
    local theGeneralSecret = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_GENERAL_S_SECRET)
    local envelopedInDarkness = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.ENVELOPED_IN_DARKNESS)
    local peaceForTheSpirit = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.PEACE_FOR_THE_SPIRIT)
    local WildcatSandy = player:getVar("WildcatSandy")
	local pNation = player:getNation();
	local trib = player:getVar("[TRUST]CURILLA_TRIB");
    local rank = player:getVar("[TRUST]CurillaRank")
    local subRank = player:getVar("[TRUST]CurillaSubRank")

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    elseif (player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.LURE_OF_THE_WILDCAT_SAN_D_ORIA) == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy,15) == false) then
        player:startEvent(562)
	elseif (player:getNation() == 0) and (player:hasKeyItem(dsp.ki.SAN_DORIA_TRUST_PERMIT)) and (player:hasSpell(902) == false) then  -- Sandy Nation
	    player:PrintToPlayer("Your Red Institute Card flashes brilliantly ", 0x1C);
        player:PrintToPlayer("Curilla : I humbly accept your request.  I will fight by your side", 0xD);
        player:addSpell(902);
	    player:PrintToPlayer("You are now able to summon the trust Curilla!", 0x15);
	elseif (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BASTOK_TRUST_PERMIT)) and (player:hasSpell(902) == false) then  -- Bastok Nation
	    player:PrintToPlayer("Your Blue Institute Card flashes brilliantly ", 0x1C);
        player:PrintToPlayer("Curilla : I humbly accept your request.  I will fight by your side", 0xD);
        player:addSpell(902);
	    player:PrintToPlayer("You are now able to summon the trust Curilla!", 0x15);
	elseif (player:getNation() == 2) and (player:hasKeyItem(dsp.ki.WINDURST_TRUST_PERMIT)) and (player:hasSpell(902) == false) then  -- Windurst Nation
	    player:PrintToPlayer("Your Green Institute Card flashes brilliantly ", 0x1C);
        player:PrintToPlayer("Curilla : I humbly accept your request.  I will fight by your side", 0xD);
        player:addSpell(902);
	    player:PrintToPlayer("You are now able to summon the trust Curilla!", 0x15);
    elseif (theGeneralSecret == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 2) then
        player:startEvent(55) -- Start Quest "The General's Secret"
    elseif (mJob == dsp.job.RDM and mLvL >= AF2_QUEST_LEVEL and player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.THE_CRIMSON_TRIAL) == QUEST_COMPLETED and envelopedInDarkness == QUEST_AVAILABLE) then
        player:startEvent(94) -- Start Quest "Enveloped in Darkness"
    elseif (player:hasKeyItem(dsp.ki.OLD_POCKET_WATCH) and player:hasKeyItem(dsp.ki.OLD_BOOTS) == false) then
        player:startEvent(93)
    elseif (player:hasKeyItem(dsp.ki.OLD_BOOTS) and player:getVar("needs_crawler_blood") == 0) then
        player:startEvent(101)
    elseif (player:getVar("needs_crawler_blood") == 1) then
        player:startEvent(117)
    elseif (mJob == dsp.job.RDM and mLvL >= AF2_QUEST_LEVEL and envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(109) -- Start Quest "Peace for the Spirit"
    elseif (peaceForTheSpirit == QUEST_ACCEPTED) then
        player:startEvent(108) -- Standard dialog during Peace of the spirit
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and (player:getVar("peaceForTheSpiritCS") >= 2 and player:getVar("peaceForTheSpiritCS") <= 4)) then
        player:startEvent(113)
    elseif (peaceForTheSpirit == QUEST_ACCEPTED and player:getVar("peaceForTheSpiritCS") == 5) then
        player:startEvent(51)
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY)) then
        player:startEvent(53)
    elseif (theGeneralSecret == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)) then
        player:startEvent(54)
    elseif (envelopedInDarkness == QUEST_COMPLETED and peaceForTheSpirit == QUEST_AVAILABLE) then
        player:startEvent(114) -- Standard dialog after Enveloped in darkness
    elseif (peaceForTheSpirit == QUEST_COMPLETED) then
        player:startEvent(52) -- Standard dialog after Peace of the spirit
    else
        player:startEvent(530) -- Standard dialog
    end


	-- ------------------------ --
    --      Tribute Unlock      --
    -- ------------------------ --
	if (mLvL >= 75 and player:hasSpell(902) and player:getVar("FerretoryAura") >= 7 and player:hasKeyItem(dsp.ki.LIMIT_BREAKER) and trib == 0) then
        local start = dialog.start
        local done = dialog.finish
	    player:PrintToPlayer("Curilla : "..start, 0xD);
        player:setVar("[TRUST]CURILLA_TRIB",1)
    elseif (trib == 1) then
        local remind = dialog.remind
        player:PrintToPlayer("Curilla : "..remind, 0xD);
	end

	-- -------------------- --
    --  Handle Token Quest  --
    --------------------------
    if (trib == 2) then
        local quest = job.PLD.start[subRank]
        local token = subRank + 1
        player:PrintToPlayer("Curilla : Bring me "..token.." of my Trust Tokens and 5,000 gil to "..quest,0x0D);
    end
end

function onEventFinish(player,csid,option)
    if (csid == 55 and option == 1) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.THE_GENERAL_S_SECRET)
        player:addKeyItem(dsp.ki.CURILLAS_BOTTLE_EMPTY)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CURILLAS_BOTTLE_EMPTY)
    elseif (csid == 54) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16409) -- Lynx Baghnakhs
        else
            player:delKeyItem(dsp.ki.CURILLAS_BOTTLE_FULL)
            player:addItem(16409)
            player:messageSpecial(ID.text.ITEM_OBTAINED,16409) -- Lynx Baghnakhs
            player:addFame(SANDORIA,30)
            player:completeQuest(SANDORIA,dsp.quest.id.sandoria.THE_GENERAL_S_SECRET)
        end
    elseif (csid == 94 and option == 1) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.ENVELOPED_IN_DARKNESS)
        player:addKeyItem(dsp.ki.OLD_POCKET_WATCH)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.OLD_POCKET_WATCH)
    elseif (csid == 109 and option == 1) then
        player:addQuest(SANDORIA,dsp.quest.id.sandoria.PEACE_FOR_THE_SPIRIT)
        player:setVar("needs_crawler_blood",0)
    elseif (csid == 101) then
        player:setVar("needs_crawler_blood",1)
    elseif (csid == 562) then
        player:setMaskBit(player:getVar("WildcatSandy"),"WildcatSandy",15,true)
    else
        dsp.wsquest.handleEventFinish(wsQuest,player,csid,option,ID.text.SAVAGE_BLADE_LEARNED)
    end
end
