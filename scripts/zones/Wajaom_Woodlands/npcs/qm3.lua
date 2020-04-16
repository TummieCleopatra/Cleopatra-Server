-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: ??? (Spawn Gotoh Zha the Redolent(ZNM T3))
-- @pos -337 -31 676 51
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Wajaom_Woodlands/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16986430;
    if (trade:hasItemQty(2575,1) and trade:getItemCount() == 1) then -- Trade Sheep Botfly
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2611,1) and trade:getItemCount() == 1) then -- Trade Gotoh's Necklace
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.DEEP_PURPLE_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DEEP_PURPLE_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.CHARCOAL_GREY_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2575);
	    else
	        player:delKeyItem(dsp.ki.CHARCOAL_GREY_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.CHARCOAL_GREY_SEAL);
		    player:addItem(2575,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2575);
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