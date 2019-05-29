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
        player:PrintToPlayer("??? : Wonderful, with this, you will have a Luopan and become a Geomancer!", 0x15);
        player:addItem(21460)
        player:messageSpecial(ID.text.ITEM_OBTAINED,21460)
        player:unlockJob(dsp.job.GEO);
        player:setVar("GeoQuest",3)
        player:delKeyItem(dsp.ki.FISTFUL_OF_HOMELAND_SOIL)
        player:addKeyItem(dsp.ki.LUOPAN)
        player:messageSpecial(ID.text.KEY_ITEM_OBTAINED,LUOPAN)
        player:PrintToPlayer("You are now able to become a Geomancer!", 0x1F);
        player:completeQuest(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS)
    end
end;

function onTrigger(player,npc)
   local mJob = player:getMainJob()

   if (player:getMainLvl() >= 30 and player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS) == QUEST_AVAILABLE) then
        player:PrintToPlayer("??? : You know there is a new type of Magic I learned from a far away land that attunes the user with the land", 0x15);
        player:PrintToPlayer("??? : I can teach it to you, but you will need a special item called a Luopan.  I can make one for you if you", 0x15);
        player:PrintToPlayer("??? : retrieve a petrified log and a Firstful of Homeland Soil.  I got my soil from those crag thingies nearest", 0x15);
        player:PrintToPlayer("??? : my home nation", 0x15);
        player:setVar("GeoQuest",1)
        player:addQuest(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS);
    elseif (player:getQuestStatus(ADOULIN,dsp.quest.id.adoulin.DANCES_WITH_LUOPANS) == QUEST_ACCEPTED) then
        player:PrintToPlayer("??? : Remember, bring me the homeland soil and a petrified log.", 0x15);
    else
        player:PrintToPlayer("??? : Luopans....mumble mumble...!", 0x15);
    end
end;


function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
