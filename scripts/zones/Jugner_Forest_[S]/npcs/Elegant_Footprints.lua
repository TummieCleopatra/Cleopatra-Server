-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: Elegant Footprints
-- Type: Mission
-- !pos 45 0 321 82
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest_[S]/IDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
-----------------------------------



function onTrade(player,npc,trade)
    local bait = player:getVar("CaitSithBait")
    local quest = player:getVar("DancersInDistress")
    if ((trade:hasItemQty(bait,1)) and quest == 3) then
        player:tradeComplete()
        player:startEvent(3,bait)
    end
end

function onTrigger(player,npc)
    if (player:getCurrentMission(WOTG) == dsp.mission.id.wotg.DANCERS_IN_DISTRESS) then
        if (player:getVar("DancersInDistress") == 2) then
            player:startEvent(2)
        else
            player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY);
    end
end

function onEventUpdate(player,csid,option)
    if (csid == 2 and option == 19) then
        -- Pick Item for Bait
        local bait = math.random(1,3)

        if (bait == 1) then
            bait = 5667 -- Lynx Meat
        elseif (bait == 2) then
            bait = 748 -- Gold Beastcoin
        elseif (bait == 3) then
            bait = 1706 -- Nyomomo Doll
        end
        print(bait)
        player:setVar("CaitSithBait",bait)
        player:updateEvent(bait)
    -- elseif (csid == 2 and option == 19) then
        -- bait = player:getVar("CaitSithBait")
        -- player:updateEvent(bait)
    end
end

function onEventFinish(player,csid,option)
    if (csid == 2) then
        player:setVar("DancersInDistress",3)
    elseif (csid == 3) then
        player:completeMission(WOTG,dsp.mission.id.wotg.DANCERS_IN_DISTRESS)
        player:addMission(WOTG,dsp.mission.id.wotg.DAUGHTER_OF_A_KNIGHT)
        player:setVar("DancersInDistress",0)
        player:setVar("CaitSithBait",0)
    end
end
