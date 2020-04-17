-----------------------------------
-- Area: Alzadaal Undersea Ruins
--  NPC: ??? (Spawn Ob(ZNM T1))
-- !pos 542 0 -129 72
-----------------------------------
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17072171;
    if (trade:hasItemQty(2592,1) and trade:getItemCount() == 1) then -- Trade Cog Lubricant
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    elseif (trade:hasItemQty(2628,1) and trade:getItemCount() == 1) then -- Trade Ob's Arm
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            player:addKeyItem(dsp.ki.CERISE_SEAL);
			player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CERISE_SEAL);
        end
    end

end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.SLIMY_TOUCH)
end
