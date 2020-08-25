-----------------------------------
-- Area: La Vaule [S]
--  NPC: Reinforced Gateway
-- !pos -100 0 -185 85
-----------------------------------
local ID = require("scripts/zones/La_Vaule_[S]/IDs")
require("scripts/globals/bcnm");
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if (player:getCurrentMission(WOTG) == dsp.mission.id.wotg.PURPLE_THE_NEW_BLACK and player:getVar("WoTGStatus") == 0) then
        player:startEvent(2)
    elseif (player:getCurrentMission(WOTG) == dsp.mission.id.wotg.PURPLE_THE_NEW_BLACK and player:getVar("WoTGStatus") == 1) then
        -- player:startEvent(0x7d00,0,0,0,2,0,0)
        if (EventTriggerBCNM(player,npc)) then
            return;
        end
    end
    --[[local instance = npc:getInstance()

    if (instance:completed()) then
        player:startEvent(100,4)
    end
    32001 warp win
-- 32002 warp lose
    return 1]]--
end

function onEventUpdate(player,csid,option,extras)
    extras = nil
    EventUpdateBCNM(player,csid,option,extras);
end;

function onEventFinish(player,csid,option)
    if (csid == 2) then
        player:setVar("WoTGStatus",1)
    end
    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
end