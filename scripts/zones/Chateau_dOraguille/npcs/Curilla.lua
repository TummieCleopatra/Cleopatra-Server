-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Curilla
-- Starts and Finishes Quest: The General's Secret, Enveloped in Darkness, Peace for the Spirit,
--                            Lure of the Wildcat (San d'Oria), Old Wounds
-- !pos 27 0.1 0.1 233
-----------------------------------
local ID = require("scripts/zones/Chateau_dOraguille/IDs")
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
    local tribfight = player:getVar("CURILLA_TRIB_FIGHT");

    if wsQuestEvent ~= nil then
        player:startEvent(wsQuestEvent)
    end

       if ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 0) and (trade:hasItemQty(65535, 1000)) and (currentTokens >= 1)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Attack is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAtt_Cur",5);
	  player:setVar("TributeRank_Curilla",1);
	  currentTokens = currentTokens - 1;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 1) and (trade:hasItemQty(65535, 2000)) and (currentTokens >= 2)) then
	  player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Accuracy is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustAcc_Cur",5);
	  player:setVar("TributeRank_Curilla",2);
	  currentTokens = currentTokens - 2;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 2) and (trade:hasItemQty(65535, 3000)) and (currentTokens >= 3)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Defense is raised by 10 points! (Total: 10)", 0x15);
	  player:setVar("TrustDEF_Cur",10);
	  player:setVar("TributeRank_Curilla",3);
	  currentTokens = currentTokens - 3;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 3) and (trade:hasItemQty(65535, 4000)) and (currentTokens >= 4)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Attack is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAtt_Cur",10);
	  player:setVar("TributeRank_Curilla",4);
	  currentTokens = currentTokens - 4;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 4) and (trade:hasItemQty(65535, 5000)) and (currentTokens >= 5)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Accuracy is raised by 5 points! (Total: 10)", 0x15);
	  player:setVar("TrustAcc_Cur",10);
	  player:setVar("TributeRank_Curilla",5);
	  currentTokens = currentTokens - 5;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 5) and (trade:hasItemQty(65535, 10000)) and (currentTokens >= 10)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Defense is raised by 10 points! (Total: 20)", 0x15);
	  player:setVar("TrustDEF_Cur",20);
	  player:setVar("TributeRank_Curilla",6);
	  currentTokens = currentTokens - 10;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 6) and (trade:hasItemQty(65535, 15000)) and (currentTokens >= 15)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Attack is raised by 5 points! (Total: 15)", 0x15);
	  player:setVar("TrustAtt_Cur",15);
	  player:setVar("TributeRank_Curilla",7);
	  currentTokens = currentTokens - 15;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 7) and (trade:hasItemQty(65535, 30000)) and (currentTokens >= 20)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Accuracy is raised by 5 points! (Total: 15)", 0x15);
	  player:setVar("TrustAcc_Cur",15);
	  player:setVar("TributeRank_Curilla",8);
	  currentTokens = currentTokens - 20;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 8) and (trade:hasItemQty(65535, 75000)) and (currentTokens >= 30)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla's Enmity is raised by 5 points! (Total: 5)", 0x15);
	  player:setVar("TrustEnm_Cur",5);
	  player:setVar("TributeRank_Curilla",9);
	  currentTokens = currentTokens - 30;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 9) and (trade:hasItemQty(65535, 150000)) and (currentTokens >= 35)) then
      player:PrintToPlayer("Curilla : Thank you for your Tribute.",0x0D);
      player:PrintToPlayer("Curilla learns the ability 'Chivalry'!", 0x15);
	  player:setVar("TrustTrait1_Cur",5);
	  player:setVar("TributeRank_Curilla",10);
	  currentTokens = currentTokens - 35;
	  player:setVar("CurrentTokens_Curilla",currentTokens);
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
	local tribfight = player:getVar("CURILLA_TRIB_FIGHT");

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

	    ---------------------------- Curilla Tribute Unlock ----------------------------------
	if ((mainlvl >= 75 and tribfight == 0 and (player:hasSpell(902)) and (player:getVar("FerretoryAura") >= 7)) and (player:getVar("TRIB_FIGHT") ~= 1)) then
	player:PrintToPlayer("Curilla : There is someone running around claming to be me at Horlais Peak.  Please head there and I'll join you.", 0xD);
    player:PrintToPlayer("Curilla : When you are ready, examine the Burning Circle in Yughott Grotto and call me to your side.", 0xD);
	player:setVar("CURILLA_TRIB_FIGHT",1);
    player:setVar("TRIB_FIGHT",1);
	elseif (mainlvl >= 75 and tribfight == 2 and (player:hasSpell(902))) then
	player:PrintToPlayer("Curilla : You have done well to help with the imposter investigation.  I am in your debt.", 0xD);
	player:PrintToPlayer("You are now able to collect Trust Tokens for Curilla!", 0x15);
	player:setVar("CURILLA_TRIB_FIGHT",3);
	player:setVar("TRIB_FIGHT",0);
	end

	-- Handle Token Quest
    if ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 0)) then
      player:PrintToPlayer("Curilla : Bring me 1 of my Trust Tokens and 1,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 1)) then
      player:PrintToPlayer("Curilla : Bring me 2 of my Trust Tokens and 2,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 2)) then
      player:PrintToPlayer("Curilla : Bring me 3 of my Trust Tokens and 3,000 gil to raise my Defense by 10",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 3)) then
      player:PrintToPlayer("Curilla : Bring me 4 of my Trust Tokens and 4,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 4)) then
      player:PrintToPlayer("Curilla : Bring me 5 of my Trust Tokens and 5,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 5)) then
      player:PrintToPlayer("Curilla : Bring me 10 of my Trust Tokens and 10,000 gil to raise my Defense by 10",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 6)) then
      player:PrintToPlayer("Curilla : Bring me 15 of my Trust Tokens and 15,000 gil to raise my Attack by 5",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 7)) then
      player:PrintToPlayer("Curilla : Bring me 20 of my Trust Tokens and 30,000 gil to raise my Accuracy by 5",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 8)) then
      player:PrintToPlayer("Curilla : Bring me 30 of my Trust Tokens and 75,000 gil to raise my Enmity by 5",0x0D);
    elseif ((player:getVar("CURILLA_TRIB_FIGHT") == 3) and (player:getVar("TributeRank_Curilla") == 9)) then
      player:PrintToPlayer("Curilla : Bring me 35 of my Trust Tokens and 150,000 gil so I can learn Chivalry",0x0D);
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
