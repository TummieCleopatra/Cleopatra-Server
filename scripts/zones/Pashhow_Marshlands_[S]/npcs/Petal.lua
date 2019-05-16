-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Indescript Markings
-- NOTE: There are 3 Indescript Markings
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    if (player:getVar("RuneQuest") == 1) then
        npcUtil.giveKeyItem(player, dsp.ki.YAHSE_WILDFLOWER_PETAL)
        player:setVar("RuneQuest",2)

        local positions =
        {
            [1] = {524,  25, 511}, -- K-5 N
            [2] = {361,  25, 436}, -- K-5 SE
            [3] = {94,  24, 341}, -- K-5
            [4] = {-1,  25, 319}
        }
        local newPosition = npcUtil.pickNewPosition(npc:getID(), positions)
        npc:hideNPC(20)
        npc:setPos(newPosition.x, newPosition.y, newPosition.z)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)

    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
