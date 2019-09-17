-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Wulgaru(ZNM T2))
-- @pos -22 -4 204 72
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/IDs"] = nil;
-----------------------------------
require("scripts/zones/Alzadaal_Undersea_Ruins/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17072179;
    if (trade:hasItemQty(2597,1) and trade:getItemCount() == 1) then -- Trade Opalus Gem
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2633,1) and trade:getItemCount() == 1) then -- Trade Wulgaru's Head
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.AMBER_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.AMBER_SEAL);			
        end		
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(PINE_GREEN_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2597);
	    else
	        player:delKeyItem(PINE_GREEN_SEAL);
			player:messageSpecial(KEYITEM_LOST,PINE_GREEN);
		    player:addItem(2597,1);
			player:messageSpecial(ITEM_OBTAINED,2597);
		end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
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