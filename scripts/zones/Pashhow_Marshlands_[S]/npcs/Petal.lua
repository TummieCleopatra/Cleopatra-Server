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
            [2] = {158,  24, 194}, -- I-7
            [3] = {160,  24, -227}, -- I-10
            [4] = {-404,  24, -336}
        }
        local newPosition = npcUtil.pickNewPosition(npc:getID(), positions)
        npc:hideNPC(20)
        npc:setPos(newPosition.x, newPosition.y, newPosition.z)
        if (newPosition.x == 524) then
            SetServerVariable("Rune_Petal_Clue",1)
        elseif (newPosition.x == 158) then
            SetServerVariable("Rune_Petal_Clue",2)
        elseif (newPosition.x == 160) then
            SetServerVariable("Rune_Petal_Clue",3)
        elseif (newPosition.x == -404) then
            SetServerVariable("Rune_Petal_Clue",4)
        end


    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)

    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

end
