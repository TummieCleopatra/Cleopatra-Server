-----------------------------------
-- Area: Aydeewa Subterrane
--  NPC: ??? (Spawn Chigre(ZNM T1))
-- @pos -217 35 12 68
-----------------------------------

-----------------------------------
local ID = require("scripts/zones/Aydeewa_Subterrane/IDs");
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17056186;
    if (trade:hasItemQty(2602,1) and trade:getItemCount() == 1) then -- Trade Spoilt Blood
        player:tradeComplete();
        SpawnMob(mobID):updateClaim(player);
    elseif (trade:hasItemQty(2638,1) and trade:getItemCount() == 1) then -- Trade Chigre
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.PINE_GREEN_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PINE_GREEN_SEAL);
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