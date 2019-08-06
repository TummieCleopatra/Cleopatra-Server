-----------------------------------
-- Area: Dragons Aery
--  NPC: qm0 (???)
-- Spawns Fafnir or Nidhogg
-- !pos -81 32 2 178
-----------------------------------
local ID = require("scripts/zones/Dragons_Aery/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onSpawn(npc)
    if LandKingSystem_NQ < 1 and LandKingSystem_HQ < 1 then
        npc:setStatus(dsp.status.DISAPPEAR)
    end
end

function onTrade(player,npc,trade)
    local paragon = player:getVar("Kupo_Paragon");
    if not GetMobByID(ID.mob.FAFNIR):isSpawned() and not GetMobByID(ID.mob.NIDHOGG):isSpawned() then
        if LandKingSystem_NQ ~= 0 and npcUtil.tradeHas(trade, 3339) and npcUtil.popFromQM(player, npc, ID.mob.FAFNIR) and paragon == 1 then
            player:confirmTrade()
        elseif LandKingSystem_HQ ~= 0 and npcUtil.tradeHas(trade, 3340) and npcUtil.popFromQM(player, npc, ID.mob.NIDHOGG) and paragon == 1 then
            player:confirmTrade()
        end
    end
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end