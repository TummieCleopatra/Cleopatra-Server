-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Merc Dealer
-- Allows players to buy ??? items if they are at the correct Merc Level
-- @pos 5.195 -1 98.966 50
-----------------------------------

-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/IDs");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(65535,500000) and player:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE) == true) then
		if (player:getFreeSlotsCount() > 0) then
		    player:addItem(2489);
            player:messageSpecial(ID.text.ITEM_OBTAINED,2489);
        else
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2489)
		end
    elseif (trade:hasItemQty(65535,10000000) and player:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == true) then
		if (player:getFreeSlotsCount() > 0) then
		    player:addItem(2489);
            player:messageSpecial(ID.text.ITEM_OBTAINED,2489);
        else
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2489)
		end
    elseif (trade:hasItemQty(65535,15000000) and player:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == true) then
		if (player:getFreeSlotsCount() > 0) then
		    player:addItem(2489);
            player:messageSpecial(ID.text.ITEM_OBTAINED,2489);
        else
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2489)
		end
    elseif (trade:hasItemQty(65535,30000000) and player:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == true) then
		if (player:getFreeSlotsCount() > 0) then
		    player:addItem(2489);
            player:messageSpecial(ID.text.ITEM_OBTAINED,2489);
        else
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2489)
		end
    elseif (trade:hasItemQty(65535,99999999) and player:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == true) then
		if (player:getFreeSlotsCount() > 0) then
		    player:addItem(2489);
            player:messageSpecial(ID.text.ITEM_OBTAINED,2489);
        else
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2489)
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:PrintToPlayer("Mercenary Dealer : I've got questionable items, if you are at the correct rank.  Let me check your status...",0xD);
	if (player:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000,	-- ??? Feet
	             0x08EB,20000,	-- ??? ingot
	             0x08ED,20000,	-- ??? cloth
	             0x0893,50000,	-- ??? Hands
	             0x08EE,75000,	-- ??? Box
			     0x08E4,100000}   -- ??? headwear
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Captain %s.  I have a book for sale..trade me 500,000 gil.", player:getName()),0xD);
        dsp.shop.general(player, stock)
    elseif (player:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000,	-- ??? Feet
	             0x08EB,20000,	-- ??? ingot
	             0x08ED,20000,	-- ??? cloth
	             0x0893,50000,	-- ??? Hands
	             0x08EE,75000}	-- ??? Box
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Second Lieutenant %s.  I have a book for sale..trade me 10,000,000 gil.", player:getName()),0xD);
        dsp.shop.general(player, stock)
    elseif (player:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000,	-- ??? Feet
	             0x08EB,20000,	-- ??? ingot
	             0x08ED,20000,	-- ??? cloth
	             0x0893,50000}	-- ??? Hands
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Sergeant Major %s.  I have a book for sale..trade me 15,000,000 gil.", player:getName()),0xD);
        dsp.shop.general(player, stock)
    elseif (player:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000,	-- ??? Feet
	             0x08EB,20000,	-- ??? ingot
	             0x08ED,20000}	-- ??? cloth
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Corporal %s.  I have a book for sale..trade me 30,000,000 gil.", player:getName()),0xD);
        dsp.shop.general(player, stock)
    elseif (player:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == true) then
        stock = {0x0894,10000}
        player:PrintToPlayer(string.format("Mercenary Dealer : Welcome Superior Private %s.  I have a book for sale..trade me 99,999,999 gil.", player:getName()),0xD);
        dsp.shop.general(player, stock)
	else
	    player:PrintToPlayer(string.format("Mercenary Dealer : Sorry %s, but you will need a Superior Private rank or higher to access my armor wares.", player:getName()),0xD);
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);



end;