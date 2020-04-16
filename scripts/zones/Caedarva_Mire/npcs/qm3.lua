-----------------------------------
-- Area: Caedarva Mire
--  NPC: ??? (Spawn Mahjlaef the Paintorn(ZNM T3))
-- @pos 695 -7 527 79
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17101204;
    if (trade:hasItemQty(2594,1) and trade:getItemCount() == 1) then -- Trade Exorcism Treatise
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2630,1) and trade:getItemCount() == 1) then -- Trade Mahjlaef's Staff
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.FALLOW_COLORED_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.FALLOW_COLORED_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.AMBER_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2594);
	    else
	        player:delKeyItem(dsp.ki.AMBER_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.AMBER_GREEN);
		    player:addItem(2594,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2594);
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