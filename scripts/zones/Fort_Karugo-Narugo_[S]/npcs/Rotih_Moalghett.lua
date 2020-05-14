----------------------------------
-- Area: Fort Karugo Narugo [S]
--  NPC: Rotih_Moalghett
-- Type: Quest
-- !pos -63 -75 3 96
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ManifestProblem = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_MANIFEST_PROBLEM)
    if (player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.THE_TIGRESS_STRIKES) == QUEST_ACCEPTED) then
        if (player:getVar("TigressStrikesProg") == 1) then
            player:startEvent(101);
        else
            player:startEvent(104);
        end
    elseif (player:hasCompletedQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.KNOT_QUITE_THERE) and ManifestProblem == QUEST_AVAILABLE) then
        player:startEvent(105)
    elseif (ManifestProblem == QUEST_ACCEPTED and player:getVar("ManifestProblem") == 2) then
        player:startEvent(106)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 104) then
        player:setVar("TigressStrikesProg", 1);
    elseif (csid == 105) then
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_MANIFEST_PROBLEM)
        player:setVar("ManifestProblem",1)
    elseif (csid == 106) then
        player:startEvent(111)
    elseif (csid == 111) then
        player:setVar("ManifestProblem",3)
        player:addKeyItem(dsp.ki.FORT_KEY)
    end
end;
