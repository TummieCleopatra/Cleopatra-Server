-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: ??? (Spawn Dea(ZNM T3))
-- @pos -34 -32 481 52
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Bhaflau_Thickets/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16990474;
    if (trade:hasItemQty(2576,1) and trade:getItemCount() == 1) then -- Trade Olzhiryan Cactus
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2612,1) and trade:getItemCount() == 1) then -- Trade Dea's Horn
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.CHESTNUT_COLORED_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CHESTNUT_COLORED_SEAL);
        end
    end
end;
-- 2612
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.DEEP_PURPLE_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2576);
	    else
	        player:delKeyItem(dsp.ki.DEEP_PURPLE_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.DEEP_PURPLE_SEAL);
		    player:addItem(2576,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2576);
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