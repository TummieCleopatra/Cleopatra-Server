----------------------------------
-- Area: Bastok Markets [S]
--  NPC: GentleTiger
-- Type: Quest
-- !pos -203  -10  1
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local onSabbatical = player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.ON_SABBATICAL);
    local onSabbaticalProgress = player:getVar("OnSabbatical");
    if (onSabbatical == QUEST_ACCEPTED) then
        if (onSabbaticalProgress == 1) then
            player:startEvent(46);
        else
            player:startEvent(47);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.FIRES_OF_DISCONTENT) == QUEST_ACCEPTED) then
        if (player:getVar("FiresOfDiscProg") == 5) then
            player:startEvent(160);
        else
            player:startEvent(161);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.LIGHT_IN_THE_DARKNESS) == QUEST_AVAILABLE) then
        player:startEvent(16)
    elseif (player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.LIGHT_IN_THE_DARKNESS) == QUEST_ACCEPTED and player:getVar("LightInTheDarkness") == 6) then
        player:startEvent(27)
    elseif (player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.BURDEN_OF_SUSPICION) == QUEST_AVAILABLE) then
        player:startEvent(16)
    else
        player:startEvent(109);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 16) then
        player:setVar("LightInTheDarkness",1)
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.LIGHT_IN_THE_DARKNESS)
    if (csid == 27) then
        player:setVar("LightInTheDarkness",0)
        player:completeQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.LIGHT_IN_THE_DARKNESS)
    elseif (csid == 46) then
        player:setVar("OnSabbatical", 2);
    elseif (csid == 160) then
        player:setVar("FiresOfDiscProg",6);
    end
end;
