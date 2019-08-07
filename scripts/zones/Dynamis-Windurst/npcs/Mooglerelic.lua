-------------------------
-- Area: Dynamis - Windurst
-- NPC: Relic Armor Moogle
-- Trade 8000 Scyld and Artifact armor of the same time to receive Relic
-------------------------

require("scripts/globals/keyitems");
local ID = require("scripts/zones/Dynamis-Windurst/IDs");
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)



player:PrintToPlayer("Moogle : Trade me a damaged Artifact and I can make it new again for 6000 Scyld.", 0xD);




end;





-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local balance = 0;
local af2 = 8000;
local uscyld = player:getCurrency("scyld");

------------------------------
--           MNK            --
------------------------------

if (trade:hasItemQty( 2033, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15072,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15072,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15072);
   end

end



------------------------------
--           WHM            --
------------------------------

if (trade:hasItemQty( 2047, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15134,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15134,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15134);
   end

end


------------------------------
--           BLM            --
------------------------------

if (trade:hasItemQty( 2050, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15105,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15105,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15105);
   end

end


------------------------------
--           THF            --
------------------------------

if (trade:hasItemQty( 2058, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15077,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15077,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15077);
   end

end


------------------------------
--           PLD            --
------------------------------

if (trade:hasItemQty( 2067, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15138,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15138,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15138);
   end

end


------------------------------
--           DRK            --
------------------------------

if (trade:hasItemQty( 2070, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15109,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15109,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15109);
   end

end


------------------------------
--           BST            --
------------------------------

if (trade:hasItemQty( 2073, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15080,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15080,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15080);
   end

end


------------------------------
--           RNG            --
------------------------------

if (trade:hasItemQty( 2085, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15082,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15082,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15082);
   end

end


------------------------------
--           SMN            --
------------------------------

if (trade:hasItemQty( 2106, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15131,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15131,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15131);
   end

end


------------------------------
--           NIN            --
------------------------------

if (trade:hasItemQty( 2093, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15084,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15084,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15084);
   end

end


------------------------------
--           SAM            --
------------------------------

if (trade:hasItemQty( 2091, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15128,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15128,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15128);
   end

end


------------------------------
--           BLU            --
------------------------------

if (trade:hasItemQty( 2666, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11382,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11382,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11382);
   end

end


------------------------------
--           PUP            --
------------------------------

if (trade:hasItemQty( 2674, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15031,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15031,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15031);
   end

end


------------------------------
--           DNC            --
------------------------------

if (trade:hasItemQty( 2720, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15038,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15038,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15038);
   end

end


------------------------------
--           SCH            --
------------------------------

if (trade:hasItemQty( 2727, 1 )) then
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11398,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11398,1);
   else
   balance = af2 - uscyld;
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11398);
   end

end









end;



-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;