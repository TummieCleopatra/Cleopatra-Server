-----------------------------------
-- Area: Zhayolm Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
-- package.loaded["scripts/zones/Zhayolm_Remnants/TextIDs"] = nil;


require("scripts/zones/Zhayolm_Remnants/TextIDs");
require("scripts/globals/treasure");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/salvagescaler");

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    print("Triggered");
    local bossdoor = GetNPCByID(17084922);
	local anni = bossdoor:getAnimation();
    bossdoor:setStatus(dsp.status.DISAPPEAR)
end;


-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);

end;

