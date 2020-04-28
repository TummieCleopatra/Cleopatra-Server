-----------------------------------
-- Area: Halvung
--  NPC: ??? (Spawn Dextrose(ZNM T2))
-- @pos -144 11 464 62
-----------------------------------
package.loaded["scripts/zones/Halvung/IDs"] = nil;
-----------------------------------
local ID = require("scripts/zones/Halvung/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17031598;
    if (trade:hasItemQty(2589,1) and trade:getItemCount() == 1) then -- Trade Granulated Sugar
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2625,1) and trade:getItemCount() == 1) then -- Trade Dextrose Blubber
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.SALMON_COLORED_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SALMON_COLORED_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.CERISE_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2589);
	    else
	        player:delKeyItem(dsp.ki.MAROON_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.CERISE_SEAL);
		    player:addItem(2589,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2589);
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