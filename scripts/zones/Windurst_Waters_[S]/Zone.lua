-----------------------------------
--
-- Zone: Windurst_Waters_[S] (94)
--
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/chocobo")
require("scripts/globals/quests")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
end

function onZoneIn(player,prevZone)
    local cs = -1

    -- MOG HOUSE EXIT
    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos(157 + math.random(1,5), -5, -62, 192)
        if player:getMainJob() ~= player:getVar("PlayerMainJob") then
            cs = 30004
        end
        player:setVar("PlayerMainJob", 0)
    end

    -- A MANIFEST PROBLEM
    if (player:getVar("ManifestProblem") == 4) then
        cs = 153
    end

    if (player:hasCompletedQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_MANIFEST_PROBLEM) and player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_FEAST_FOR_GNATS) == QUEST_AVAILABLE) then
        cs = 165
    end

    return cs
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if (csid == 153) then
        player:startEvent(231)
    end

    if (csid == 165) then
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_FEAST_FOR_GNATS);
        player:setVar("FeastForGnats",1)
    end

    if (csid == 231) then
        player:startEvent(232)
    end

    if (csid == 232) then
        player:startEvent(233)
    end

    if (csid == 233) then
        player:setVar("ManifestProblem",0)
        player:completeQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_MANIFEST_PROBLEM)
        player:addItem(5708,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED,5708);
    end
end