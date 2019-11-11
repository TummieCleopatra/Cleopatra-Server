-----------------------------------
-- Area: Vunkerl Inlet [S]
-- NPC:  ???
-- !pos -199,-40,-286
-----------------------------------
require("scripts/globals/status");
local ID = require("scripts/zones/Vunkerl_Inlet_[S]/IDs");
-----------------------------------

function onTrigger(player,npc)
    local FreeSlots = player:getFreeSlotsCount()

    if (player:getVar("RUN_AF_FIGHT") == 1) then
        SpawnMob(17118050):updateEnmity(player) -- Spawns Chess Piece?

    end

end

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2808,1) and player:getVar("RUN_AF") == 0 and player:getVar("RUN_AF_ACCEPTED") == 1) then
        player:PrintToPlayer("You sense a strong feeling of animosity nearby...you should probably check the ??? again", 0x1F);
        player:setVar("RUN_AF_FIGHT",1)
        player:tradeComplete()
    end
end