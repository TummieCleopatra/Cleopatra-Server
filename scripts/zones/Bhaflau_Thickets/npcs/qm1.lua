-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: ??? (Spawn Lividroot Amooshah(ZNM T2))
-- @pos 334 -10 184 52
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16990473;
    if (trade:hasItemQty(2578,1) and trade:getItemCount() == 1) then -- Trade Oily Blood
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2614,1) and trade:getItemCount() == 1) then -- Trade Amooshash Tendril
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.APPLE_GREEN_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.APPLE_GREEN_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.MAROON_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2578);
	    else
	        player:delKeyItem(dsp.ki.MAROON_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.MAROON_SEAL);
		    player:addItem(2578,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2578);
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