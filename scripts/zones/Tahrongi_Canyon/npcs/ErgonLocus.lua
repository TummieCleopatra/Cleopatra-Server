-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: ErgonLocus
-- !pos 
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/quests")
require("scripts/globals/keyitems")
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("GeoQuest") == 1) then
        player:setVar("GeoQuest",2)
        player:addKeyItem(dsp.ki.FISTFUL_OF_HOMELAND_SOIL)
        player:messageSpecial(ID.text.KEY_ITEM_OBTAINED,FISTFUL_OF_HOMELAND_SOIL)
    end
end;
