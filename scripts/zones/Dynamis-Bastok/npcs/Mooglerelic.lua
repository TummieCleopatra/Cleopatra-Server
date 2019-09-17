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
--           MNK            --  
------------------------------

if (trade:hasItemQty( 2042, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15133,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15133,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15133);
   end
end


------------------------------
--           BLM            --  
------------------------------

if (trade:hasItemQty( 2051, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15120,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15120,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15120);
   end
end

------------------------------
--           RDM            --  
------------------------------

if (trade:hasItemQty( 2055, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15106,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15106,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15106);
   end
end

------------------------------
--           THF            --  
------------------------------

if (trade:hasItemQty( 2059, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15092,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15092,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15092);
   end
end

------------------------------
--           PLD            --  
------------------------------

if (trade:hasItemQty( 2063, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15078,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15078,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15078);
   end
end

------------------------------
--           DRK            --  
------------------------------

if (trade:hasItemQty( 2072, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15139,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15139,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15139);
   end
end

------------------------------
--           BST            --  
------------------------------

if (trade:hasItemQty( 2074, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15095,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15095,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15095);
   end
end

------------------------------
--           BRD            --  
------------------------------

if (trade:hasItemQty( 2080, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15111,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15111,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15111);
   end
end

------------------------------
--           SMN            --  
------------------------------

if (trade:hasItemQty( 2105, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15116,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15116,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15116);
   end
end

------------------------------
--           DRG            --  
------------------------------

if (trade:hasItemQty( 2101, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15130,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15130,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15130);
   end
end

------------------------------
--           SAM            --  
------------------------------

if (trade:hasItemQty( 2090, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15113,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15113,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15113);
   end
end

------------------------------
--           BLU            --  
------------------------------

if (trade:hasItemQty( 2665, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(16346,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,16346,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16346);
   end
end

------------------------------
--           COR            --  
------------------------------

if (trade:hasItemQty( 2671, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11385,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11385,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11385);
   end
end

------------------------------
--           DNC            --  
------------------------------

if (trade:hasItemQty( 2718, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11478,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11478,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11478);
   end
end

------------------------------
--           SCH           --  
------------------------------

if (trade:hasItemQty( 2726, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(16362,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,16362,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16362);
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