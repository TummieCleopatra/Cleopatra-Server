-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: Mham Lahrih
--
-- !pos 358 16 -190 98
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign_[S]/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local FeastForGnats = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.A_FEAST_FOR_GNATS)
    if (FeastForGnats == QUEST_ACCEPTED and player:getVar("FeastForGnats") == 1) then
        player:startEvent(113);
    end
end;



function onEventFinish(player,csid,option)
    if (csid == 113 ) then
        player:setVar("FeastForGnats",2)
    end
end;