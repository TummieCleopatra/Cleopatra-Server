-----------------------------------
-- Area: La Vaule [S]
-- NPC:  ???
-- !pos -100,-1,-215
-----------------------------------
require("scripts/globals/status");
local ID = require("scripts/zones/La_Vaule_[S]/IDs");
-----------------------------------

function onTrigger(player,npc)

    if (player:getVar("RUN_AF_FIGHT") == 1) then
        SpawnMob(17126198):updateEnmity(player) -- Spawns Chess Piece?

    end

end

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2808,1) and player:getVar("RUN_AF") == 4 and player:getVar("RUN_AF_ACCEPTED") == 1) then
        player:PrintToPlayer("You sense a strong feeling of animosity nearby...you should probably check the ??? again", 0x1F);
        player:setVar("RUN_AF_FIGHT",1)
        player:tradeComplete()
    end
end