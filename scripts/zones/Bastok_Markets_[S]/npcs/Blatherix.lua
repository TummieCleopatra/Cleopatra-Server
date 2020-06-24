-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Pagdako
-- Quest NPC
-- pos -200 -6 -93
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(4496,30) or trade:getGil() == 5000 and player:getVar("LightInTheDarkness") == 2) then
        player:startEvent(23)
    end
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,dsp.quest.id.crystalWar.LIGHT_IN_THE_DARKNESS) == QUEST_ACCEPTED and  player:getVar("LightInTheDarkness") == 2)
	    player:startEvent(182)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (cisd == 23) then
	    player:setVar("LightInTheDarkness",3)
    end
end;
