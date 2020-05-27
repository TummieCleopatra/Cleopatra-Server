-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: Elegant Footprints
-- Type: Mission
-- !pos -510 7 289 82
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest_[S]/IDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
-----------------------------------



function onTrade(player,npc,trade)
    if ((trade:hasItemQty(2728,1)) and player:getVar("DaughterOfaKnight") == 2) then
        -- player:startEvent(937)
        player:setVar("DaughterOfaKnight",3)
        player:PrintToPlayer("You plant the Cernunnos Bulb into the Humus-Rich Earth", 0xD)
        player:tradeComplete()
    end
end

function onTrigger(player,npc)

end

function onEventUpdate(player,csid,option)

end

function onEventFinish(player,csid,option)

end
