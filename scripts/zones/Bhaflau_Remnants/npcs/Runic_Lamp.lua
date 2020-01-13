-----------------------------------
-- Area: Zhayolm Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
package.loaded["scripts/zones/Zhayolm_Remnants/IDs"] = nil;


require("scripts/zones/Zhayolm_Remnants/IDs");
require("scripts/globals/treasure");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/salvagescaler");

function onTrade(player,npc,trade)
    local salvfloor = player:getVar("Card_Level");
	local loca = math.random(201,204);
    if (trade:hasItemQty(2377,1)) then
	  player:PrintToPlayer("Floor 3 Confirmed.", 0x15);
	  player:startEvent(loca);
	end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);
    -- exit
	local duration = player:getStatusEffect(dsp.effect.LEVEL_RESTRICTION):getDuration();
	if (csid >= 201 and csid <= 204 and option == 1) then
	    player:setVar("Bhaflau_Floor",3);
		player:PrintToPlayer("Floor 3 - Max Cap: 65", 0x15);
		player:setVar("Salvage_Level",55);
        player:addStatusEffect(dsp.effect.LEVEL_RESTRICTION,55,3,duration);
        player:addMP(1500);
        player:addHP(1600);
	end
end;

