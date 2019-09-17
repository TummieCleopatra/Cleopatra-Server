-------------------------
-- Area: Dynamis - Bastok
-- NPC: Relic Armor Moogle
-- Trade 8000 Scyld and Artifact armor of the same time to receive Relic
-------------------------
require("scripts/zones/Dynamis-Bastok/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local balance = 0;
local af2 = 8000; 
local uscyld = player:getCurrency("scyld");


------------------------------
--           WAR            --  
------------------------------

if (trade:hasItemQty( 2035, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15102,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15102,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15102);
   end
end


------------------------------
--          MNK            --  
------------------------------

if (trade:hasItemQty( 2040, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15103,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15103,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15103);
   end
end

------------------------------
--           WHM           --  
------------------------------

if (trade:hasItemQty( 2046, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15119,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15119,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15119);
   end
end

------------------------------
--           THF            --  
------------------------------

if (trade:hasItemQty( 2062, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15137,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15137,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15137);
   end
end

------------------------------
--           RDM            --  
------------------------------

if (trade:hasItemQty( 2056, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15121,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15121,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15121);
   end
end

------------------------------
--           DRK            --  
------------------------------

if (trade:hasItemQty( 2071, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15124,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15124,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15124);
   end
end

------------------------------
--           BRD            --  
------------------------------

if (trade:hasItemQty( 2082, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15141,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15141,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15141);
   end
end

------------------------------
--           COR            --  
------------------------------

if (trade:hasItemQty( 2669, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15028,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15028,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15028);
   end
end

------------------------------
--           DNC            --  
------------------------------

if (trade:hasItemQty( 2722, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11396,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11396,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11396);
   end
end

------------------------------
--           SAM            --  
------------------------------

if (trade:hasItemQty( 2092, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15143,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15143,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15143);
   end
end

------------------------------
--           BLM            --  
------------------------------

if (trade:hasItemQty( 2052, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15135,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15135,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15135);
   end
end

------------------------------
--           DRG            --  
------------------------------

if (trade:hasItemQty( 2100, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15115,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15115,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15115);
   end
end

------------------------------
--           NIN            --  
------------------------------

if (trade:hasItemQty( 2097, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15144,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15144,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15144);
   end
end

------------------------------
--           PUP            --  
------------------------------

if (trade:hasItemQty( 2675, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(16352,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,16352,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16352);
   end
end

------------------------------
--           RNG           --  
------------------------------

if (trade:hasItemQty( 2083, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15082,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,16362,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15082);
   end
end



end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)


player:PrintToPlayer("Moogle : For a cheaper price, trade me a damaged relic piece and 8000 Scyld and I will make a normal quality relic!", 0xD);
 
 


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