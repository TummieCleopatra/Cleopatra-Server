-----------------------------------
-- Area: Mount Zhayolm
--  NPC: ??? (Spawn Khromasoul Bhurborlor(ZNM T3))
-- @pos 88 -22 70 61
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/IDs"] = nil;
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17027474;
    if (trade:hasItemQty(2585,1) and trade:getItemCount() == 1) then -- Trade Vinegar Pie
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2621,1) and trade:getItemCount() == 1) then -- Trade Bhurbolor's Vambrace
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.GOLD_COLORED_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.GOLD_COLORED_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.PURPLISH_GREY_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2585);
	    else
	        player:delKeyItem(dsp.ki.PURPLISH_GREY_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.PURPLISH_GREY_SEAL);
		    player:addItem(2585,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2585);
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