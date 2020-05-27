-----------------------------------
-- Area: Jugner Forest
--  NPC: Elegant Footprints
-- Type: Mission
-- !pos -510 7 289 104
-----------------------------------
local ID = require("scripts/zones/Jugner_Forest/IDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
-----------------------------------



function onTrade(player,npc,trade)

end

function onTrigger(player,npc)
    if (player:getVar("DaughterOfaKnight") == 3) then
        player:startEvent(33)
    elseif (player:getVar("DaughterOfaKnight") == 4) then
        SpawnMob(17203677):updateClaim(player)
    elseif (player:getVar("DaughterOfaKnight") == 5) then
        player:startEvent(34)
    end
end

function onEventUpdate(player,csid,option)

end

function onEventFinish(player,csid,option)
    if (csid == 33) then
        player:setVar("DaughterOfaKnight",4)
    elseif (csid == 34) then
        player:addKeyItem(dsp.ki.CERNUNNOS_RESIN)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.CERNUNNOS_RESIN)

        player:setVar("DaughterOfaKnight",6)
    end
end
