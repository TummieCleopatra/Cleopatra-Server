-----------------------------------
-- Area: Mamook
--  NPC: ??? (Spawn Chamrosh(ZNM T1))
-- @pos 206 14 -285 65
-----------------------------------
package.loaded["scripts/zones/Mamook/IDs"] = nil;
-----------------------------------
require("scripts/zones/Mamook/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17043887;
    if (trade:hasItemQty(2581,1) and trade:getItemCount() == 1) then -- Trade Floral Nectar
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2617,1) and trade:getItemCount() == 1) then -- Trade Chamrosh Beak
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.MAROON_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MAROON_SEAL);
        end			
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
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