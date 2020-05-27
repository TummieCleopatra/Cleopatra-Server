-----------------------------------
-- Area: Southern SandOria [S]
--  NPC: Raustigne
-- !pos 4 -2 44 80
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/missions");


function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    printf("Trigger")
    if (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.CLAWS_OF_THE_GRIFFON) == QUEST_COMPLETED and player:getVar("BoyAndTheBeast") == 0) then
        if (player:getCurrentMission(WOTG) == dsp.mission.id.wotg.CAIT_SITH or player:hasCompletedMission(WOTG, dsp.mission.id.wotg.CAIT_SITH)) then
            player:startEvent(55);
        end
    elseif (player:getCurrentMission(WOTG) == dsp.mission.id.wotg.DANCERS_IN_DISTRESS) then
        if (player:getVar("DancersInDistress") == 1) then
            player:startEvent(86)
        else
            player:startEvent(606)
        end
    elseif (player:getCurrentMission(WOTG) == dsp.mission.id.wotg.A_SPOONFUL_OF_SUGAR) then
        player:startEvent(87)
    else
        player:startEvent(606);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 55) then
        player:setVar("BoyAndTheBeast",1);
    elseif (csid == 86) then
        player:setVar("DancersInDistress",2)
    elseif (csid == 87) then
        player:completeMission(WOTG, dsp.mission.id.wotg.A_SPOONFUL_OF_SUGAR)
        player:addMission(WOTG, dsp.mission.id.wotg.AFFAIRS_OF_STATE)
    end
end;