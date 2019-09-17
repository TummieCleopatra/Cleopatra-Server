-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Cheese Hoarder Gigiroon(ZNM T1))
-- @pos -184 -8 24 72
-----------------------------------
package.loaded["scripts/zones/Alzadaal_Undersea_Ruins/IDs"] = nil;
-----------------------------------
require("scripts/zones/Alzadaal_Undersea_Ruins/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17072172;
    if (trade:hasItemQty(2582,1) and trade:getItemCount() == 1) then -- Trade Rodent Cheese
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2618,1) and trade:getItemCount() == 1) then -- Gigaroon Cape
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