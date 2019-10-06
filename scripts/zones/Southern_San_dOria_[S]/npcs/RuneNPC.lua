-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: RuneNPC
-- !pos -78 -8 -22 80
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/quests");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Southern_San_dOria_[S]/IDs");

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    local mJob = player:getMainJob()
    if (player:getVar("RuneQuest") == 2 and player:hasKeyItem(dsp.ki.YAHSE_WILDFLOWER_PETAL)) then
        player:PrintToPlayer("Fivinne : !!!What?! You found it!! Perfect.  Now I shall teach you the mystic arts of Rune Fencing!", 0x15);
        player:addItem(20781)
        player:messageSpecial(ID.text.ITEM_OBTAINED,20781)
        player:unlockJob(dsp.job.RUN);
        player:setVar("RuneQuest",3)
        player:delKeyItem(dsp.ki.YAHSE_WILDFLOWER_PETAL)
        player:PrintToPlayer("You are now able to become a Rune Fencer!", 0x1F);
        player:completeQuest(ADOULIN,dsp.quest.id.adoulin.CHILDREN_OF_THE_RUNE)
    elseif (player:getMainLvl() >= 30 and player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.CHILDREN_OF_THE_RUNE) == QUEST_AVAILABLE) then
        player:PrintToPlayer("Fivinne : I am perfecting a new type of magic that requires a special ink from a flower far away from here.", 0x15);
        player:PrintToPlayer("Fivinne : The only problem is I dropped it somewhere in Pashhow Marshlands.  Find it for me and I'll teach", 0x15);
        player:PrintToPlayer("Fivinne : you the secret arts from this far away land.", 0x15);
        player:setVar("RuneQuest",1)
        player:addQuest(ADOULIN,dsp.quest.id.adoulin.CHILDREN_OF_THE_RUNE);
    elseif (player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.CHILDREN_OF_THE_RUNE) == QUEST_ACCEPTED) then
        local clue = GetServerVariable("Rune_Petal_Clue")
        if (clue == 1) then
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Aughtmarsh in Pashhow Marshlands.", 0x15);
        elseif (clue == 2) then
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Luremarsh in Pashhow Marshlands.", 0x15);
        elseif (clue == 3) then
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Hexmarsh in Pashhow Marshlands.", 0x15);
        elseif (clue == 4) then
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Rotmarsh in Pashhow Marshlands.", 0x15);
        else
            player:PrintToPlayer("Fivinne : I think I dropped it somewhere near the Aughtmarsh in Pashhow Marshlands.", 0x15);
        end
    else
        player:PrintToPlayer("Fivinne : I have no business with you.  Off you go!", 0x15);
    end
end;


function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
