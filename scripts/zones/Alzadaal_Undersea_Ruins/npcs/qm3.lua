-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Armed Gears(ZNM T3))
-- @pos -42 -4 -169 72
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17072178;
    if (trade:hasItemQty(2574,1) and trade:getItemCount() == 1) then -- Trade Ferrite
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2610,1) and trade:getItemCount() == 1) then -- Trade Gotoh's Necklace
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.CHARCOAL_GREY_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CHARCOAL_GREY_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.APPLE_GREEN_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2575);
	    else
	        player:delKeyItem(dsp.ki.APPLE_GREEN_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.APPLE_GREEN_SEAL);
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