-----------------------------------
-- Area: Caedarva Mire
--  NPC: ??? (Spawn Verdelet(ZNM T2))
-- @pos 417 -19 -69 79
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17101202;
    if (trade:hasItemQty(2599,1) and trade:getItemCount() == 1) then -- Trade Mint Drop
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2635,1) and trade:getItemCount() == 1) then -- Trade Verdelet Wing
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.AMBER_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.AMBER_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.PINE_GREEN_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2599);
	    else
	        player:delKeyItem(dsp.ki.PINE_GREEN_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.PINE_GREEN_SEAL);
		    player:addItem(2599,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2599);
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