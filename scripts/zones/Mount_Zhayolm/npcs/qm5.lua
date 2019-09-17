-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Spawn Sarameya(ZNM T4))
-- @pos 322 -14 -581 61
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/IDs"] = nil;
-----------------------------------
require("scripts/zones/Mount_Zhayolm/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17027485;
    if (trade:hasItemQty(2583,1) and trade:getItemCount() == 1) then -- Trade Buffalo Corpse
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2619,1) and trade:getItemCount() == 1) then -- Trade Sarameya's Hide
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.BRIGHT_BLUE_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BRIGHT_BLUE_SEAL);			
        end		
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(COPPER_COLOR_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2583);
	    else
	        player:delKeyItem(COPPER_COLOR_SEAL);
		    player:additem(2583,1);
			player:messageSpecial(ITEM_OBTAINED,2583);
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