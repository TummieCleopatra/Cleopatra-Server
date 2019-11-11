-----------------------------------
-- Area: Windurst Waters [S]
--  NPC: GeoNPC
-- !pos -78 -8 -22 80
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/quests");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs");

function onTrade(player,npc,trade)
    if (trade:hasItemQty(703,1) and player:getVar("GeoQuest") == 2 and player:hasKeyItem(dsp.ki.FISTFUL_OF_HOMELAND_SOIL)) then
        player:PrintToPlayer("Sevi Lugho : Wonderful, with this, you will have a Luopan and become a Geomancer!", 0x15);
        player:addItem(21460)
        player:addItem(6074)
        player:messageSpecial(ID.text.ITEM_OBTAINED,21460)
        player:messageSpecial(ID.text.ITEM_OBTAINED,6074)
        player:tradeComplete()
        player:unlockJob(dsp.job.GEO);
        player:setVar("GeoQuest",3)
        player:delKeyItem(dsp.ki.FISTFUL_OF_HOMELAND_SOIL)
        player:addKeyItem(dsp.ki.LUOPAN)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LUOPAN)
        player:PrintToPlayer("You are now able to become a Geomancer!", 0x1F);
        player:completeQuest(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS)
    end
end;

function onTrigger(player,npc)
   local mJob = player:getMainJob()
   local af = player:getVar("GEO_AF")
   local accepted = player:getVar("GEO_AF_ACCEPTED")

    if (player:getMainJob() == dsp.job.GEO and player:getMainLvl() >= 71) then
        if (af == 0 and accepted == 0) then
            player:PrintToPlayer("Sevi Lugho : I've been expecting you.  I've crafted some special boots for you, however I needed to bury them", 0x15);
            player:PrintToPlayer("Sevi Lugho : at the Geomantic Resevoir in Castle Oztroja to collect Geomantic Energy which takes about 1 year.", 0x15);
            player:PrintToPlayer("Sevi Lugho : When you are ready, trade this pigment to the Resevoir to collect your boots.", 0x15);
            player:setVar("GEO_AF_ACCEPTED",1)
            player:addItem(2810)
        elseif (af == 0 and accepted == 1) then
            player:PrintToPlayer("Sevi Lugho : Remember, it takes a year to collect energy at the Resevoir in Castle Oztroja", 0x15);
        elseif (af == 1 and accepted == 0) then
            player:PrintToPlayer("Sevi Lugho : Back for another?  I've crafted some special gloves for you, however I needed to bury them", 0x15);
            player:PrintToPlayer("Sevi Lugho : at the Geomantic Resevoir in Davoi to collect Geomantic Energy which takes about 1 year.", 0x15);
            player:PrintToPlayer("Sevi Lugho : When you are ready, trade this pigment to the Resevoir to collect your gloves.", 0x15);
            player:setVar("GEO_AF_ACCEPTED",1)
            player:addItem(2810)
        elseif (af == 1 and accepted == 1) then
            player:PrintToPlayer("Sevi Lugho : Remember, it takes a year to collect energy at the Resevoir in Davoi", 0x15);
        elseif (af == 2 and accepted == 0) then
            player:PrintToPlayer("Sevi Lugho : Back for another?  I've crafted some special pants for you, however I needed to bury them", 0x15);
            player:PrintToPlayer("Sevi Lugho : at the Geomantic Resevoir in Beadeaux to collect Geomantic Energy which takes about 1 year.", 0x15);
            player:PrintToPlayer("Sevi Lugho : When you are ready, trade this pigment to the Resevoir to collect your gloves.", 0x15);
            player:setVar("GEO_AF_ACCEPTED",1)
            player:addItem(2810)
        elseif (af == 2 and accepted == 1) then
            player:PrintToPlayer("Sevi Lugho : Remember, it takes a year to collect energy at the Resevoir in Beaudeaux", 0x15);

        elseif (af == 3 and accepted == 0) then
            player:PrintToPlayer("Sevi Lugho : Back for another?  I've crafted some special body armor for you, however I needed to bury them", 0x15);
            player:PrintToPlayer("Sevi Lugho : at the Geomantic Resevoir in Beaucedine Glacier to collect Geomantic Energy which takes about 1 year.", 0x15);
            player:PrintToPlayer("Sevi Lugho : When you are ready, trade this pigment to the Resevoir to collect your body armor.", 0x15);
            player:setVar("GEO_AF_ACCEPTED",1)
            player:addItem(2810)
        elseif (af == 3 and accepted == 1) then
            player:PrintToPlayer("Sevi Lugho : Remember, it takes a year to collect energy at the Resevoir in Beaucedine Glacier", 0x15);
        elseif (af == 4 and accepted == 0) then
            player:PrintToPlayer("Sevi Lugho : Back for another?  I've crafted a special hat for you, however I needed to bury them", 0x15);
            player:PrintToPlayer("Sevi Lugho : at the Geomantic Resevoir in Xarcabard to collect Geomantic Energy which takes about 1 year.", 0x15);
            player:PrintToPlayer("Sevi Lugho : When you are ready, trade this pigment to the Resevoir to collect your hat.", 0x15);
            player:setVar("GEO_AF_ACCEPTED",1)
            player:addItem(2810)
        elseif (af == 4 and accepted == 1) then
            player:PrintToPlayer("Sevi Lugho : Remember, it takes a year to collect energy at the Resevoir in Xarcabard", 0x15);
        end
    end





    if (player:getMainLvl() >= 30 and player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS) == QUEST_AVAILABLE) then
        player:PrintToPlayer("Sevi Lugho : You know there is a new type of Magic I learned from a far away land that attunes the user with the land", 0x15);
        player:PrintToPlayer("Sevi Lugho : I can teach it to you, but you will need a special item called a Luopan.  I can make one for you if you", 0x15);
        player:PrintToPlayer("Sevi Lugho : retrieve a petrified log and a Firstful of Homeland Soil.  I got my soil from those crag thingies nearest", 0x15);
        player:PrintToPlayer("Sevi Lugho : my home nation", 0x15);
        player:setVar("GeoQuest",1)
        player:addQuest(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS);
    elseif (player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS) == QUEST_ACCEPTED) then
        player:PrintToPlayer("Sevi Lugho : Remember, bring me the homeland soil and a petrified log.", 0x15);
    elseif (player:getMainJob() == dsp.job.GEO or player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS) == QUEST_COMPLETED) then
	    local stock =
        {
            6074, 100, -- poison
            6078, 372, -- voidance
            6087, 1400, -- precision
            6073, 2300, -- regen
            6090, 2400, -- attunement
            6089, 6000, -- focus
            6084, 11000, -- barrier
            6075, 20000, -- refresh
            6082, 21000, -- CHR
            6081, 23900, -- MND
            6083, 25000, -- Fury
            6080, 30000, -- INT
            6079, 32000, -- AGI
            6086, 34000, -- Fend
            6078, 43000, -- VIT
            6077, 47000, -- DEX
            6085, 52000, -- Acumen
            6076, 53000, -- STR
            6099, 53000, -- Slow
            6096, 60000, -- Torpor
            6095, 61000, -- Slip
            6098, 62000, -- Languor
            6100, 63000, -- Paralys
            6097, 64000, -- Vex

        };
        dsp.shop.general(player, stock);
        player:PrintToPlayer("Sevi Lugho : Hello fellow Geomancer! I have some spells for sale.", 0x15);
    else
        player:PrintToPlayer("Sevi Lugho : Luopans....mumble mumble...!", 0x15);
    end
end;


function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
