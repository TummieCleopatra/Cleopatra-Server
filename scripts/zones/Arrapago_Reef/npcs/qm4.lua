-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Nuhn(ZNM T3))
-- @pos -451 -7 389 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/IDs"] = nil;
-----------------------------------
local ID = require("scripts/zones/Arrapago_Reef/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16998874;
    if (trade:hasItemQty(2596,1) and trade:getItemCount() == 1) then -- Trade Rose Scampi
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2632,1) and trade:getItemCount() == 1) then -- Trade Nuhns Esca
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SIENNA_COLORED_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SIENNA_COLORED_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.TAUPE_COLORED_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(TD.text.ITEM_CANNOT_BE_OBTAINED,2596);
	    else
	        player:delKeyItem(dsp.ki.TAUPE_COLORED_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.TAUPE_COLORED_SEAL);
		    player:addItem(2596,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2596);
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