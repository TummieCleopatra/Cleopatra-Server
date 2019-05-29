-----------------------------------
-- Area: East Ronfaure
--  NPC: Geomantic Reservoir
-- !pos
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/quests")
require("scripts/globals/keyitems")
-----------------------------------

function onTrigger(player,npc)
    if (player:hasSpell(769) == true and player:hasSpell(799) == false and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(799)
    end
end;
