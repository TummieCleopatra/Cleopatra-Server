-----------------------------------
--  Area: Windurst Woods
--  NPC: Wetata
--  Type: Trust NPC
--  !zone: 241
--  !pos 7.800 -3.5 -10.064
--
-----------------------------------
local ID = require("scripts/zones/Windurst_Woods/IDs")
require("scripts/globals/shop")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
    if ((trade:hasItemQty(10183,1) and (player:hasSpell(991) == false) and (player:getNation() == 2) and (player:hasKeyItem(dsp.ki.WINDURST_TRUST_PERMIT) == true))) then
        player:addSpell(991);
        player:PrintToPlayer("You may now summon Darrcullin as a Trust!", 0x15);
    elseif ((trade:hasItemQty(10153,1) and (player:hasSpell(968) == false) and (player:getNation() == 2) and (player:hasKeyItem(dsp.ki.WINDURST_TRUST_PERMIT) == true))) then
        player:addSpell(968);
        player:PrintToPlayer("You may now summon Adelhied as a Trust!", 0x15);
    end
end

function onTrigger(player,npc)
    if (player:getNation() == 2) and (player:hasKeyItem(dsp.ki.WINDURST_TRUST_PERMIT) == false) then
        player:addKeyItem(dsp.ki.WINDURST_TRUST_PERMIT);
	    player:addKeyItem(dsp.ki.GREEN_INSTITUTE_CARD);
	    player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.WINDURST_TRUST_PERMIT);
	    player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.GREEN_INSTITUTE_CARD);
    elseif (player:getNation() == 2) and (player:hasKeyItem(dsp.ki.WINDURST_TRUST_PERMIT)) then
	    player:PrintToPlayer("Wetata : Try talking to some people.  If you happen to to come accross a cipher, bring it to me", 0xD);
	else
	    player:PrintToPlayer("Wetata : You seem to be from another Nation.  Sadly I cantaru help you", 0xD);
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
