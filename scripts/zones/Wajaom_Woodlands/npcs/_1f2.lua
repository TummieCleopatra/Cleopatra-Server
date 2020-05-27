-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Engraved Tablet
-- !pos 233 -9 -634 51
-----------------------------------
require("scripts/globals/keyitems");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    printf("test")
    if (player:hasKeyItem(dsp.ki.SICKLEMOON_SALT)) then
        player:startEvent(514)
    else
        player:startEvent(515)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 514) then
       player:delKeyItem(dsp.ki.SICKLEMOON_SALT)
    end
end;