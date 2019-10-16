-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Denali Dealer
-- Trades ??? items for Denali Gear
-- @pos 65 0 20 50
-----------------------------------

-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/IDs");
require("scripts/globals/keyitems");
local Besieged = require("scripts/zones/Aht_Urhgan_Whitegate/IDs");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local currency = player:getVar("Mercenary_Points");
	-- Feet
	if (trade:hasItemQty(2196,1) and currency >= 5000) then
	    player:tradeComplete();
		currency = currency - 5000;
		player:setVar("Mercenary_Points",currency);
		player:addItem(Besieged.rewards[2].FEET, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED,Besieged.rewards[2].FEET);
		player:PrintToPlayer("Denali Dealer : Here you go!",0xD);
	elseif (trade:hasItemQty(2196,1)) then
	    player:PrintToPlayer("Denali Dealer : I require 5000 Mercenary Points for this transaction.  You currently have "..currency.." Mercenary Points",0xD);
	end

	-- Legs
	if (trade:hasItemQty(2285,1) and currency >= 10000) then
	    player:tradeComplete();
		currency = currency - 10000;
		player:setVar("Mercenary_Points",currency);
		player:addItem(Besieged.rewards[2].LEGS, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED,Besieged.rewards[2].LEGS);
		player:PrintToPlayer("Denali Dealer : Here you go!",0xD);
	elseif (trade:hasItemQty(2285,1)) then
	    player:PrintToPlayer("Denali Dealer : I require 10000 Mercenary Points for this transaction.  You currently have "..currency.." Mercenary Points",0xD);
	end

	-- Hands
	if (trade:hasItemQty(2195,1) and currency >= 15000) then
	    player:tradeComplete();
		currency = currency - 15000;
		player:setVar("Mercenary_Points",currency);
		player:addItem(Besieged.rewards[2].HANDS, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED,Besieged.rewards[2].HANDS);
		player:PrintToPlayer("Denali Dealer : Here you go!",0xD);
	elseif (trade:hasItemQty(2195,1)) then
	    player:PrintToPlayer("Denali Dealer : I require 15000 Mercenary Points for this transaction.  You currently have "..currency.." Mercenary Points",0xD);
	end

	-- Body
	if (trade:hasItemQty(2286,1) and currency >= 20000) then
	    player:tradeComplete();
		currency = currency - 20000;
		player:setVar("Mercenary_Points",currency);
		player:addItem(Besieged.rewards[2].BODY, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED,Besieged.rewards[2].BODY);
		player:PrintToPlayer("Denali Dealer : Here you go!",0xD);
	elseif (trade:hasItemQty(2286,1)) then
	    player:PrintToPlayer("Denali Dealer : I require 20000 Mercenary Points for this transaction.  You currently have "..currency.." Mercenary Points",0xD);
	end

	-- Head
	if (trade:hasItemQty(2276,1) and currency >= 25000) then
	    player:tradeComplete();
		currency = currency - 25000;
		player:setVar("Mercenary_Points",currency);
		player:addItem(Besieged.rewards[2].HEAD, 1)
		player:messageSpecial(ID.text.ITEM_OBTAINED,Besieged.rewards[2].HEAD);
		player:PrintToPlayer("Denali Dealer : Here you go!",0xD);
	elseif (trade:hasItemQty(2276,1)) then
	    player:PrintToPlayer("Denali Dealer : I require 25000 Mercenary Points for this transaction.  You currently have "..currency.." Mercenary Points",0xD);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:PrintToPlayer("Denali Dealer : I can make Denali gear for you if you trade me specific ??? items along with Mercenary Points. ",0xD);
	player:PrintToPlayer("Denali Dealer : I accept a ??? Box, ??? Headband, ??? Cloth, ??? Footwear, and ??? Hands. ",0xD);
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