-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: ErgonLocus
-- !pos
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/quests")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Konschtat_Highlands/IDs");
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("GeoQuest") == 1) then
        player:setVar("GeoQuest",2)
        player:addKeyItem(dsp.ki.FISTFUL_OF_HOMELAND_SOIL)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.FISTFUL_OF_HOMELAND_SOIL)
    end
end;
