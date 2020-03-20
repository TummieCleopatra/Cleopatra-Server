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
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Vidounir? Bring me back a Cerise Seal", 0xD);
		player:addQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLACK_MAGE);
	elseif (quest == 1 and job == 5 and level >= 75 and rdmquest == QUEST_AVAILABLE) then
	    player:PrintToPlayer("Zalsuhm : So you want to learn the secrets of 'Death Blossom? Bring me back a Cerise Seal", 0xD);
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
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 2 and level >= 75 and mnkquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("mnkquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 3 and level >= 75 and whmquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("whmquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 4 and level >= 75 and blmquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("blmquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 5 and level >= 75 and rdmquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("rdmquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 6 and level >= 75 and thfquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("thfquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 7 and level >= 75 and pldquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("pldquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 8 and level >= 75 and drkquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("drkquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 8 and level >= 75 and bstquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("bstquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 10 and level >= 75 and brdquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("brdquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 11 and level >= 75 and rngquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("rngquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 12 and level >= 75 and samquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("samquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 13 and level >= 75 and ninquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("ninquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 14 and level >= 75 and drgquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("drgquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 15 and level >= 75 and smnquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.CERISE_SEAL))) then
	    player:setVar("smnquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 16 and level >= 75 and bluquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("bluquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 17 and level >= 75 and corquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("corquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 18 and level >= 75 and pupquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL))) then
	    player:setVar("pupquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 19 and level >= 75 and dncquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("dncquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 20 and level >= 75 and schquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("schquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 21 and level >= 75 and schquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("geoquestweapondone",1);
		player:startEvent(0x2768);
	elseif (quest == 1 and job == 22 and level >= 75 and schquest == QUEST_ACCEPTED and (player:hasKeyItem(dsp.ki.MAROON_SEAL))) then
	    player:setVar("runquestweapondone",1);
		player:startEvent(0x2768);
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
--printf("RESULT: %u",option);

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

	if (csid == 10088 and player:getVar("warquestweapondone",1)) then
	    player:setVar("warquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_WARRIOR);
		player:messageSpecial(ID.text.LEARN_WS,90);
		player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("mnkquestweapondone",1)) then
	    player:setVar("mnkquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_MONK);
		player:messageSpecial(ID.text.LEARN_WS,11);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("whmquestweapondone",1)) then
	    player:setVar("whmquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_WHITE_MAGE);
		player:messageSpecial(ID.text.LEARN_WS,171);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("blmquestweapondone",1)) then
	    player:setVar("blmquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLACK_MAGE);
		player:messageSpecial(ID.text.LEARN_WS,186);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("rdmquestweapondone",1)) then
	    player:setVar("rdmquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_RED_MAGE);
		player:messageSpecial(ID.text.LEARN_WS,44);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("thfquestweapondone",1)) then
	    player:setVar("thfquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_THIEF);
		player:messageSpecial(ID.text.LEARN_WS,27);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("pldquestweapondone",1)) then
	    player:setVar("pldquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_PALADIN);
		player:messageSpecial(ID.text.LEARN_WS,45);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("drkquestweapondone",1)) then
	    player:setVar("drkquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DARK_KNIGHT);
		player:messageSpecial(ID.text.LEARN_WS,106);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("bstquestweapondone",1)) then
	    player:setVar("bstquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BEASTMASTER);
		player:messageSpecial(ID.text.LEARN_WS,74);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("brdquestweapondone",1)) then
	    player:setVar("brdquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BARD);
		player:messageSpecial(ID.text.LEARN_WS,28);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("rngquestweapondone",1)) then
	    player:setVar("rngquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_RANGER);
		player:messageSpecial(ID.text.LEARN_WS,217);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("samquestweapondone",1)) then
	    player:setVar("samquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SAMURAI);
		player:messageSpecial(ID.text.LEARN_WS,154);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("ninquestweapondone",1)) then
	    player:setVar("ninquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_NINJA);
		player:messageSpecial(ID.text.LEARN_WS,138);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("drgquestweapondone",1)) then
	    player:setVar("drgquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DRAGOON);
		player:messageSpecial(ID.text.LEARN_WS,122);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("smnquestweapondone",1)) then
	    player:setVar("smnquestweapondone",0);
		player:delKeyItem(dsp.ki.CERISE_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_SUMMONER);
		player:messageSpecial(ID.text.LEARN_WS,187);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("bluquestweapondone",1)) then
	    player:setVar("bluquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_BLUE_MAGE);
		player:messageSpecial(ID.text.LEARN_WS,46);
        player:addLearnedWeaponskill(22);
	elseif (csid == 10088 and player:setVar("corquestweapondone",1)) then
	    player:setVar("corquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_CORSAIR);
		player:messageSpecial(ID.text.LEARN_WS,218);
		player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("pupquestweapondone",1)) then
	    player:setVar("pupquestweapondone",0);
		player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_PUPPETMASTER);
		player:messageSpecial(ID.text.LEARN_WS,12);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("dncquestweapondone",1)) then
	    player:setVar("dncquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.UNLOCKING_A_MYTH_DANCER);
		player:messageSpecial(ID.text.LEARN_WS,29);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("schquestweapondone",1)) then
	    player:setVar("schquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(JEUNO,dsp.quest.id.jeuno.	UNLOCKING_A_MYTH_SCHOLAR);
		player:messageSpecial(ID.text.LEARN_WS,188);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("geoquestweapondone",1)) then
	    player:setVar("geoquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(ADOULIN,dsp.quest.id.adoulin.GEOMANCERRIFIC);
		player:messageSpecial(ID.text.LEARN_WS,175);
        player:addLearnedWeaponskill(skill)
	elseif (csid == 10088 and player:setVar("runquestweapondone",1)) then
	    player:setVar("runquestweapondone",0);
		player:delKeyItem(dsp.ki.MAROON_SEAL);
		player:completeQuest(ADOULIN,dsp.quest.id.adoulin.RUNE_FENCING_THE_NIGHT_AWAY);
		player:messageSpecial(ID.text.LEARN_WS,61);
        player:addLearnedWeaponskill(skill)
	end
end;


