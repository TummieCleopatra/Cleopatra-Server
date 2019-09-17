-------------------------
-- Area: Dynamis - Beaucedine
-- NPC: Relic Armor Moogle
-- Trade 30000 Scyld and Artifact armor of the same time to receive Relic
-------------------------


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)


 if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_INSIGNIA)) then
stock = {0x07F4,30000,  -- WAR
		 0x07F7,30000,  -- MNK
         0x07FC,30000,  -- WHM
		 0x0801,30000,  -- BLM
		 0x0806,30000,  -- RDM
		 0x080D,30000,  -- THF
		 0x0812,30000,  -- PLD
		 0x0815,30000,  -- DRK
		 0x081D,30000,  -- BST
		 0x081F,30000,  -- BRD
		 0x0827,30000,  -- RNG
		 0x0829,30000,  -- SAM
		 0x082E,30000,  -- NIN
		 0x0833,30000,  -- DRG
		 0x0838,30000,  -- SMN
		 0x0A67,30000,  -- BLU
		 0x0A6C,30000,  -- COR
		 0x0A71,30000,  -- PUP
		 0x0AA4,30000,  -- DNC
		 0x0AA1,30000,  -- SCH		 


}  
player:PrintToPlayer("Moogle : Trade me a damaged Artifact and an NQ piece and I will make it HQ for 30000 Scyld.", 0xD);
showShop(player, STATIC, stock);  
else
stock = {0x07F4,3000000,  -- WAR
		 0x07F7,3000000,  -- MNK
         0x07FC,3000000,  -- WHM
		 0x0801,3000000,  -- BLM
		 0x0806,3000000,  -- RDM
		 0x080D,3000000,  -- THF
		 0x0812,3000000,  -- PLD
		 0x0815,3000000,  -- DRK
		 0x081D,3000000,  -- BST
		 0x081F,3000000,  -- BRD
		 0x0827,3000000,  -- RNG
		 0x0829,3000000,  -- SAM
		 0x082E,3000000,  -- NIN
		 0x0833,3000000,  -- DRG
		 0x0838,3000000,  -- SMN
		 0x0A67,3000000,  -- BLU
		 0x0A6C,3000000,  -- COR
		 0x0A71,3000000,  -- PUP
		 0x0AA4,3000000,  -- DNC
		 0x0AA1,3000000,  -- SCH

}  
player:PrintToPlayer("Moogle : Trade me a damaged Artifact and an NQ piece and I will make it HQ for 30000 Scyld.", 0xD);
showShop(player, STATIC, stock);  
end

end;






-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local balance = 0;
local af2 = 30000; 
local uscyld = player:getCurrency("scyld");


------------------------------
--           WAR           --  
------------------------------

if (trade:hasItemQty( 2036, 1 ) and trade:hasItemQty( 15117, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15580,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15580,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15580);
   end

end

------------------------------
--           MNK            --  
------------------------------

if (trade:hasItemQty( 2039, 1 ) and trade:hasItemQty( 15088, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14501,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,14501,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14501);
   end

end



------------------------------
--           WHM            --  
------------------------------

if (trade:hasItemQty( 2044, 1 ) and trade:hasItemQty( 15089, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14502,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,14502,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14502);
   end

end


------------------------------
--           BLM            --  
------------------------------

if (trade:hasItemQty( 2049, 1 ) and trade:hasItemQty( 15090, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14503,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,14503,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14503);
   end

end


------------------------------
--           THF            --  
------------------------------

if (trade:hasItemQty( 2061, 1 ) and trade:hasItemQty( 15122, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15585,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15585,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15585);
   end

end


------------------------------
--           PLD            --  
------------------------------

if (trade:hasItemQty( 2066, 1 ) and trade:hasItemQty( 15123, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15123,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15123,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15123);
   end

end


------------------------------
--           DRK            --  
------------------------------

if (trade:hasItemQty( 2069, 1 ) and trade:hasItemQty( 15094, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15094,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15094,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15094);
   end

end


------------------------------
--           BST            --  
------------------------------

if (trade:hasItemQty( 2077, 1 ) and trade:hasItemQty( 15140, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15673,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15673,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15673);
   end

end


------------------------------
--           RNG            --  
------------------------------

if (trade:hasItemQty( 2087, 1 ) and trade:hasItemQty( 15142, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15142,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15142,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15142);
   end

end


------------------------------
--           DRG           --  
------------------------------

if (trade:hasItemQty( 2099, 1 ) and trade:hasItemQty( 15100, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(15513,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,15513,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,15513);
   end

end


------------------------------
--           SMN            --  
------------------------------

if (trade:hasItemQty( 2104, 1 )  and trade:hasItemQty( 15010, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14514,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,14514,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14514);
   end

end


------------------------------
--           NIN            --  
------------------------------

if (trade:hasItemQty( 2094, 1 ) and trade:hasItemQty( 15099, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14512,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,14512,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14512);
   end

end


------------------------------
--           SAM            --  
------------------------------

if (trade:hasItemQty( 2089, 1 ) and trade:hasItemQty( 15098, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(14511,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,14511,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,14511);
   end

end


------------------------------
--           BLU            --  
------------------------------

if (trade:hasItemQty( 2663, 1 ) and trade:hasItemQty( 11292, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11293,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11293,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11293);
   end

end


------------------------------
--           PUP            --  
------------------------------

if (trade:hasItemQty( 2673, 1 ) and trade:hasItemQty( 11298, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11299,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11299,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11299);
   end

end


------------------------------
--           COR            --  
------------------------------

if (trade:hasItemQty( 2668, 1 ) and trade:hasItemQty( 11295, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11296,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11296,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11296);
   end

end


------------------------------
--           DNC            --  
------------------------------

if (trade:hasItemQty( 2721, 1 ) and trade:hasItemQty( 16360, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(16361,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,16361,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16361);
   end

end


------------------------------
--           SCH            --  
------------------------------

if (trade:hasItemQty( 2724, 1 ) and trade:hasItemQty( 11307, 1 )) then     
   if (player:getFreeSlotsCount() >= 1) then
   if (uscyld >= af2) then   
   player:delCurrency("scyld", af2);
   player:tradeComplete();
   player:addItem(11308,1);
   player:messageSpecial(ID.text.ITEM_OBTAINED,11308,1);
   else
   balance = af2 - uscyld; 
   player:PrintToPlayer( "Moogle : I'm sorry, you need "..balance.." more scyld to purchase that armor.", 0xD);
   end
   else
   player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,11308);
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