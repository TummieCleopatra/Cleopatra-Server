-----------------------------------
-- Area: Port Bastok
-- NPC: Clarion Star
-- Type: Trust NPC
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
local ID = require("scripts/zones/Port_Bastok/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if ((trade:hasItemQty(10183,1) and (player:hasSpell(991) == false) and (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BASTOK_TRUST_PERMIT) == true))) then
        player:addSpell(991);
        player:PrintToPlayer("You may now summon Darrcullin as a Trust!", 0x15);
    elseif ((trade:hasItemQty(10153,1) and (player:hasSpell(968) == false) and (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BASTOK_TRUST_PERMIT) == true))) then
        player:addSpell(968);
        player:PrintToPlayer("You may now summon Adelhied as a Trust!", 0x15);
    end
end;

function onTrigger(player,npc)
    if (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BASTOK_TRUST_PERMIT) == false) then
        player:addKeyItem(dsp.ki.BASTOK_TRUST_PERMIT);
	    player:addKeyItem(dsp.ki.BLUE_INSTITUTE_CARD);
	    player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BASTOK_TRUST_PERMIT);
	    player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BLUE_INSTITUTE_CARD);
    elseif (player:getNation() == 1) and (player:hasKeyItem(dsp.ki.BASTOK_TRUST_PERMIT)) then
	    player:PrintToPlayer("Clarion Star : Try talking to some people.  If you happen to to come accross a cipher, bring it to me", 0xD);
	else
	    player:PrintToPlayer("Clarion Star : You seem to be from another Nation.  I can't really help you", 0xD);
	end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
