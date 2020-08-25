-----------------------------------
-- Area: Lower Jeuno
--  NPC: Zalsuhm
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/equipment")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/weaponskillids")
require("scripts/globals/keyitems")
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getGil() == 10000) then
        player:setVar("Myth_Unlock",1);
        player:tradeComplete();
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-- player:startEvent(0x2765);
    local warquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_WARRIOR);
	local mnkquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_MONK);
	local whmquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_WHITE_MAGE);
	local blmquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLACK_MAGE);
	local rdmquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_RED_MAGE);
	local thfquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_THIEF);
	local pldquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_PALADIN);
	local drkquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DARK_KNIGHT);
	local bstquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BEASTMASTER);
	local brdquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BARD);
	local rngquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_RANGER);
	local samquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SAMURAI);
	local ninquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_NINJA);
	local drgquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DRAGOON);
	local smnquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SUMMONER);
	local bluquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLUE_MAGE);
	local corquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_CORSAIR);
	local pupquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_PUPPETMASTER);
	local dncquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DANCER);
	local schquest = player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SCHOLAR);
    local geoquest = player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.GEOMANCERRIFIC);
    local runquest = player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.RUNE_FENCING_THE_NIGHT_AWAY);
	local quest = player:getVar("Myth_Unlock");
	local job = player:getMainJob();
	local level = player:getMainLvl();


    if (quest == 0 and level >= 75) then
        player:PrintToPlayer("Zalsuhm : So you want to learn a new skill eh?  I can tell you the secrets for 10,000g", 0xD);
	elseif (quest == 1 and job == 1 and level >= 75 and warquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Kings Justice'? Bring me back a Maroon Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_WARRIOR);
	elseif (quest == 1 and job == 2 and level >= 75 and mnkquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Ascetic's Fury'? Bring me back a Maroon Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_MONK);
	elseif (quest == 1 and job == 3 and level >= 75 and whmquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Mystic Boon'? Bring me back a Maroon Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_WHITE_MAGE);
	elseif (quest == 1 and job == 4 and level >= 75 and blmquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Vidounir'? Bring me back a Cerise Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLACK_MAGE);
	elseif (quest == 1 and job == 5 and level >= 75 and rdmquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Death Blossom'? Bring me back a Cerise Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_RED_MAGE);
	elseif (quest == 1 and job == 6 and level >= 75 and thfquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Mandalic Stab'? Bring me back a Cerise Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_THIEF);
	elseif (quest == 1 and job == 7 and level >= 75 and pldquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Atonement'? Bring me back a Pine Green Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_PALADIN);
	elseif (quest == 1 and job == 8 and level >= 75 and drkquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Insurgency'? Bring me back a Pine Green Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DARK_KNIGHT);
	elseif (quest == 1 and job == 8 and level >= 75 and bstquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Primal Rend'? Bring me back a Pine Green Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BEASTMASTER);
	elseif (quest == 1 and job == 10 and level >= 75 and brdquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Mordant Rime'? Bring me back a Maroon Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BARD);
	elseif (quest == 1 and job == 11 and level >= 75 and rngquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Trueflight'? Bring me back a Maroon Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_RANGER);
	elseif (quest == 1 and job == 12 and level >= 75 and samquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Tachi: Rana'? Bring me back a Maroon Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SAMURAI);
	elseif (quest == 1 and job == 13 and level >= 75 and ninquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Blade: Kamu'? Bring me back a Cerise Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_NINJA);
	elseif (quest == 1 and job == 14 and level >= 75 and drgquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Drakesbane'? Bring me back a Cerise Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DRAGOON);
	elseif (quest == 1 and job == 15 and level >= 75 and smnquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Garland of Bliss'? Bring me back a Cerise Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SUMMONER);
	elseif (quest == 1 and job == 16 and level >= 75 and bluquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Expiacion'? Bring me back a Pine Green Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLUE_MAGE);
	elseif (quest == 1 and job == 17 and level >= 75 and corquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Leaden Salute'? Bring me back a Pine Green Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_CORSAIR);
	elseif (quest == 1 and job == 18 and level >= 75 and pupquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Stringing Pummel'? Bring me back a Pine Green Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_PUPPETMASTER);
	elseif (quest == 1 and job == 19 and level >= 75 and dncquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Pyrrhic Kleos'? Bring me back a Maroon Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DANCER);
	elseif (quest == 1 and job == 20 and level >= 75 and schquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Omniscience'? Bring me back a Marron Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SCHOLAR);
	elseif (quest == 1 and job == 21 and level >= 75 and geoquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Exudation'? Bring me back a Marron Seal", 0xD);
		player:addQuest(ADOULIN,dsp.quest.id.adoulin.GEOMANCERRIFIC);
 	elseif (quest == 1 and job == 22 and level >= 75 and runquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Dimidation'? Bring me back a Marron Seal", 0xD);
        player:addQuest(ADOULIN,dsp.quest.id.adoulin.RUNE_FENCING_THE_NIGHT_AWAY);
    -- --------------------------------------- --
	--   Player has quest accepted but no KI   --
	-- --------------------------------------- --
	elseif (quest == 1 and job == 1 and level >= 75 and warquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Maroon Seal", 0xD);
	elseif (quest == 1 and job == 2 and level >= 75 and mnkquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Maroon Seal", 0xD);
	elseif (quest == 1 and job == 3 and level >= 75 and whmquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Maroon Seal", 0xD);
	elseif (quest == 1 and job == 4 and level >= 75 and blmquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Cerise Seal", 0xD);
	elseif (quest == 1 and job == 5 and level >= 75 and rdmquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Cerise Seal", 0xD);
	elseif (quest == 1 and job == 6 and level >= 75 and thfquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Cerise Seal", 0xD);
	elseif (quest == 1 and job == 7 and level >= 75 and pldquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Pine Green Seal", 0xD);
	elseif (quest == 1 and job == 8 and level >= 75 and drkquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Pine Green Seal", 0xD);
	elseif (quest == 1 and job == 8 and level >= 75 and bstquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Pine Green Seal", 0xD);
	elseif (quest == 1 and job == 10 and level >= 75 and brdquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Maroon Seal", 0xD);
	elseif (quest == 1 and job == 11 and level >= 75 and rngquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Maroon Seal", 0xD);
	elseif (quest == 1 and job == 12 and level >= 75 and samquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Maroon Seal", 0xD);
	elseif (quest == 1 and job == 13 and level >= 75 and ninquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Cerise Seal", 0xD);
	elseif (quest == 1 and job == 14 and level >= 75 and drgquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Cerise Seal", 0xD);
	elseif (quest == 1 and job == 15 and level >= 75 and smnquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Cerise Seal", 0xD);
	elseif (quest == 1 and job == 16 and level >= 75 and bluquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Pine Green Seal", 0xD);
	elseif (quest == 1 and job == 17 and level >= 75 and corquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
    	player:PrintToPlayer("Zalsuhm : Remember...bring me back a Pine Green Seal", 0xD);
	elseif (quest == 1 and job == 18 and level >= 75 and pupquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Pine Green Seal", 0xD);
	elseif (quest == 1 and job == 19 and level >= 75 and dncquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Maroon Seal", 0xD);
	elseif (quest == 1 and job == 20 and level >= 75 and schquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Marron Seal", 0xD);
	elseif (quest == 1 and job == 21 and level >= 75 and geoquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Marron Seal", 0xD);
	elseif (quest == 1 and job == 22 and level >= 75 and runquest == QUEST_ACCEPTED and not(player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:PrintToPlayer("Zalsuhm : Remember...bring me back a Marron Seal", 0xD);
    -- ------------------------------------ --
	--   Player has quest accepted and KI   --
	-- ------------------------------------ --
	elseif (quest == 1 and job == 1 and level >= 75 and warquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("warquestweapondone",1);
		player:startEvent(0x2768,1);
	elseif (quest == 1 and job == 2 and level >= 75 and mnkquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("mnkquestweapondone",1);
		player:startEvent(0x2768,2);
	elseif (quest == 1 and job == 3 and level >= 75 and whmquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("whmquestweapondone",1);
		player:startEvent(0x2768,3);
	elseif (quest == 1 and job == 4 and level >= 75 and blmquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("blmquestweapondone",1);
		player:startEvent(0x2768,4);
	elseif (quest == 1 and job == 5 and level >= 75 and rdmquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("rdmquestweapondone",1);
		player:startEvent(0x2768,5);
	elseif (quest == 1 and job == 6 and level >= 75 and thfquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("thfquestweapondone",1);
		player:startEvent(0x2768,6);
	elseif (quest == 1 and job == 7 and level >= 75 and pldquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("pldquestweapondone",1);
		player:startEvent(0x2768,7);
	elseif (quest == 1 and job == 8 and level >= 75 and drkquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("drkquestweapondone",1);
		player:startEvent(0x2768,8);
	elseif (quest == 1 and job == 8 and level >= 75 and bstquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("bstquestweapondone",1);
		player:startEvent(0x2768,9);
	elseif (quest == 1 and job == 10 and level >= 75 and brdquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("brdquestweapondone",1);
		player:startEvent(0x2768,10);
	elseif (quest == 1 and job == 11 and level >= 75 and rngquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("rngquestweapondone",1);
		player:startEvent(0x2768,11);
	elseif (quest == 1 and job == 12 and level >= 75 and samquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("samquestweapondone",1);
		player:startEvent(0x2768,12);
	elseif (quest == 1 and job == 13 and level >= 75 and ninquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("ninquestweapondone",1);
		player:startEvent(0x2768,13);
	elseif (quest == 1 and job == 14 and level >= 75 and drgquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("drgquestweapondone",1);
		player:startEvent(0x2768,14);
	elseif (quest == 1 and job == 15 and level >= 75 and smnquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("smnquestweapondone",1);
		player:startEvent(0x2768,15);
	elseif (quest == 1 and job == 16 and level >= 75 and bluquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("bluquestweapondone",1);
		player:startEvent(0x2768,16);
	elseif (quest == 1 and job == 17 and level >= 75 and corquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("corquestweapondone",1);
		player:startEvent(0x2768,17);
	elseif (quest == 1 and job == 18 and level >= 75 and pupquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("pupquestweapondone",1);
		player:startEvent(0x2768,18);
	elseif (quest == 1 and job == 19 and level >= 75 and dncquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("dncquestweapondone",1);
		player:startEvent(0x2768,19);
	elseif (quest == 1 and job == 20 and level >= 75 and schquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("schquestweapondone",1);
		player:startEvent(0x2768,20);
	elseif (quest == 1 and job == 21 and level >= 75 and geoquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("geoquestweapondone",1);
		player:startEvent(0x2768,21);
	elseif (quest == 1 and job == 22 and level >= 75 and runquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("runquestweapondone",1);
		player:startEvent(0x2768,22);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
printf("RESULT: %u",option);

        local jobs =
        {
            [dsp.job.WAR] = dsp.ws_unlock.KINGS_JUSTICE,
            [dsp.job.MNK] = dsp.ws_unlock.ASCETICS_FURY,
            [dsp.job.WHM] = dsp.ws_unlock.MYSTIC_BOON,
            [dsp.job.BLM] = dsp.ws_unlock.VIDOHUNIR,
            [dsp.job.RDM] = dsp.ws_unlock.DEATH_BLOSSOM,
            [dsp.job.THF] = dsp.ws_unlock.MANDALIC_STAB,
            [dsp.job.PLD] = dsp.ws_unlock.ATONEMENT,
            [dsp.job.DRK] = dsp.ws_unlock.INSURGENCY,
            [dsp.job.BST] = dsp.ws_unlock.PRIMAL_REND,
            [dsp.job.BRD] = dsp.ws_unlock.MORDANT_RIME,
            [dsp.job.RNG] = dsp.ws_unlock.TRUEFLIGHT,
            [dsp.job.SAM] = dsp.ws_unlock.TACHI_RANA,
            [dsp.job.NIN] = dsp.ws_unlock.BLADE_KAMU,
            [dsp.job.DRG] = dsp.ws_unlock.DRAKESBANE,
            [dsp.job.SMN] = dsp.ws_unlock.GARLAND_OF_BLISS,
            [dsp.job.BLU] = dsp.ws_unlock.EXPIACION,
            [dsp.job.COR] = dsp.ws_unlock.LEADEN_SALUTE,
            [dsp.job.PUP] = dsp.ws_unlock.STRINGING_PUMMEL,
            [dsp.job.DNC] = dsp.ws_unlock.PYRRHIC_KLEOS,
            [dsp.job.SCH] = dsp.ws_unlock.OMNISCIENCE,
            [dsp.job.GEO] = dsp.ws_unlock.EXUDATION,
            [dsp.job.RUN] = dsp.ws_unlock.DIMIDATION,
        }

    local skill = jobs[option]

    print(skill)

	if (csid == 10088 and player:getVar("warquestweapondone") == 1 and option == 1) then
	    player:setVar("warquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_WARRIOR);
		player:PrintToPlayer("You have learned the weapon skill King's Justice!",0x15);
		player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("mnkquestweapondone") == 1 and option == 2) then
	    player:setVar("mnkquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_MONK);
		player:PrintToPlayer("You have learned the weapon skill Ascetic's Fury!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("whmquestweapondone") == 1 and option == 3) then
	    player:setVar("whmquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_WHITE_MAGE);
		player:PrintToPlayer("You have learned the weapon skill Mystic Boon!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("blmquestweapondone") == 1 and option == 4) then
	    player:setVar("blmquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLACK_MAGE);
		player:PrintToPlayer("You have learned the weapon skill Vidohunir!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("rdmquestweapondone") == 1 and option == 5) then
	    player:setVar("rdmquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_RED_MAGE);
		player:PrintToPlayer("You have learned the weapon skill Death Blossom!",0x15);
        printf("ADD WEAPONSKILL %u",skill)
        player:addLearnedWeaponskill(20)
	elseif (csid == 10088 and player:getVar("thfquestweapondone") == 1 and option == 6) then
	    player:setVar("thfquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_THIEF);
		player:PrintToPlayer("You have learned the weapon skill Mandalic Stab!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("pldquestweapondone") == 1 and option == 7) then
	    player:setVar("pldquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_PALADIN);
		player:PrintToPlayer("You have learned the weapon skill Atonement!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("drkquestweapondone") == 1 and option == 8) then
	    player:setVar("drkquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DARK_KNIGHT);
		player:PrintToPlayer("You have learned the weapon skill Insurgency!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("bstquestweapondone") == 1 and option == 9) then
	    player:setVar("bstquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BEASTMASTER);
		player:PrintToPlayer("You have learned the weapon skill Primal Rend!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("brdquestweapondone") == 1 and option == 10) then
	    player:setVar("brdquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BARD);
		player:PrintToPlayer("You have learned the weapon skill Mordant Rime!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("rngquestweapondone") == 1 and option == 11) then
	    player:setVar("rngquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_RANGER);
		player:PrintToPlayer("You have learned the weapon skill Trueflight!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("samquestweapondone") == 1 and option == 12) then
	    player:setVar("samquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SAMURAI);
		player:PrintToPlayer("You have learned the weapon skill Tachi: Rana!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("ninquestweapondone") == 1 and option == 13) then
	    player:setVar("ninquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_NINJA);
		player:PrintToPlayer("You have learned the weapon skill Blade: Kamu!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("drgquestweapondone") == 1 and option == 14) then
	    player:setVar("drgquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DRAGOON);
		player:PrintToPlayer("You have learned the weapon skill Drakesbane!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("smnquestweapondone") == 1 and option == 15) then
	    player:setVar("smnquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SUMMONER);
		player:PrintToPlayer("You have learned the weapon skill Garland of Bliss!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("bluquestweapondone") == 1 and option == 16) then
	    player:setVar("bluquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLUE_MAGE);
		player:PrintToPlayer("You have learned the weapon skill Expaciation!",0x15);
        player:addLearnedWeaponskill(22);
	elseif (csid == 10088 and player:getVar("corquestweapondone") == 1 and option == 17) then
	    player:setVar("corquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_CORSAIR);
		player:PrintToPlayer("You have learned the weapon skill Leaden Salute!",0x15);
		player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("pupquestweapondone") == 1 and option == 18) then
	    player:setVar("pupquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_PUPPETMASTER);
		player:PrintToPlayer("You have learned the weapon skill Stringing Pummel!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("dncquestweapondone") == 1 and option == 19) then
	    player:setVar("dncquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DANCER);
		player:PrintToPlayer("You have learned the weapon skill Pyrrhic Kleos!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("schquestweapondone") == 1 and option == 20) then
	    player:setVar("schquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SCHOLAR);
		player:PrintToPlayer("You have learned the weapon skill Omniscience!",0x15);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:getVar("geoquestweapondone") == 1 and option == 0) then
	    player:setVar("geoquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(ADOULIN,dsp.quest.id.adoulin.GEOMANCERRIFIC);
		player:PrintToPlayer("You have learned the weapon skill Exudiation!",0x15);
        player:addLearnedWeaponskill(49)
	elseif (csid == 10088 and player:getVar("runquestweapondone") == 1 and option == 0) then
	    player:setVar("runquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(ADOULIN,dsp.quest.id.adoulin.RUNE_FENCING_THE_NIGHT_AWAY);
		player:PrintToPlayer("You have learned the weapon skill Dimidiation!",0x15);
        player:addLearnedWeaponskill(50)
	end
end;


