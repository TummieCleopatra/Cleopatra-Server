-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Zareehkl the Jubilant(ZNM T2))
-- @pos 176 -4 182 54
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16998873;
    if (trade:hasItemQty(2598,1) and trade:getItemCount() == 1) then -- Trade Merow No 11 Molting
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2634,1) and trade:getItemCount() == 1) then -- Trade Zareehkls Necklace
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.AMBER_COLORED_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.AMBER_COLORED_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2598);
	    else
	        player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.PINE_GREEN_SEAL);
		    player:addItem(2598,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2598);
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