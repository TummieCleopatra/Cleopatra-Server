-----------------------------------
-- Area: Upper Jeuno
--  NPC: Mount NPC
-----------------------------------

require("scripts/globals/chocobo");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");
local ID = require("scripts/zones/Upper_Jeuno/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(10049,1) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(dsp.ki.RAPTOR_COMPANION);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.RAPTOR_COMPANION);
        player:PrintToPlayer("Mapitoto : Enjoy your Raptor Mount!!", 0xD);
	elseif (trade:hasItemQty(10051,1) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(dsp.ki.CRAB_COMPANION);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CRAB_COMPANION);
        player:PrintToPlayer("Mapitoto : Enjoy your Cab Mount!!", 0xD);
	elseif (trade:hasItemQty(10050,1) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(dsp.ki.TIGER_COMPANION);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.TIGER_COMPANION);
        player:PrintToPlayer("Mapitoto : Enjoy your Tiger Mount!!", 0xD);
	elseif (trade:hasItemQty(10053,1) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(dsp.ki.BOMB_COMPANION);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BOMB_COMPANION);
        player:PrintToPlayer("Mapitoto : Enjoy your Bomb Mount!!", 0xD);
	elseif (trade:hasItemQty(10056,1) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(dsp.ki.CRAWLER_COMPANION);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CRAWLER_COMPANION);
        player:PrintToPlayer("Mapitoto : Enjoy your Crawler Mount!!", 0xD);
	elseif (trade:hasItemQty(10058,1) and player:hasKeyItem(dsp.ki.CHOCOBO_LICENSE) and player:getMainLvl() >= 20) then
	    player:addKeyItem(dsp.ki.BEETLE_COMPANION);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BEETLE_COMPANION);
        player:PrintToPlayer("Mapitoto : Enjoy your Beetle Mount!!", 0xD);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyitem(dsp.ki.CHOCOBO_LICENSE)) then
        player:PrintToPlayer("Mapitoto : If you have any of those companion slips, trade them to me and you will be able to get a mount!", 0xD);
    else
        player:PrintToPlayer("Mapitoto : Kweh!!!", 0xD);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);


end;