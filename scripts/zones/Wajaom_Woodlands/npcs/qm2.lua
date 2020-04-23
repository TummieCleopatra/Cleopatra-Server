-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Iriz Ima(ZNM T2))
-- @pos 253 -23 116 51
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16986429;
    if (trade:hasItemQty(2577,1) and trade:getItemCount() == 1) then -- Trade Senorita Pamamas
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2613,1) and trade:getItemCount() == 1) then -- Trade Iriz Ima's Hide
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
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2577);
	    else
	        player:delKeyItem(dsp.ki.MAROON_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.MAROON_SEAL);
		    player:addItem(2577,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2577);
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