-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Nosferatu(ZNM T3))
-- @pos -199 8 -62 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/IDs"] = nil;
-----------------------------------
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17056157;
    if (trade:hasItemQty(2584,1) and trade:getItemCount() == 1) then -- Trade Pure Blood
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2620,1) and trade:getItemCount() == 1) then -- Trade Nosferatu's Claw
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.PURPLISH_GREY_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PURPLISH_GREY_SEAL);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:hasKeyItem(dsp.ki.SALMON_SEAL)) then
	    if (player:getFreeSlotsCount() == 0) then
		    player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,2584);
	    else
	        player:delKeyItem(dsp.ki.SALMON_SEAL);
			player:messageSpecial(ID.text.KEYITEM_LOST,dsp.ki.CERISE_SEAL);
		    player:addItem(2584,1);
			player:messageSpecial(ID.text.ITEM_OBTAINED,2584);
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