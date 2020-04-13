-----------------------------------
-- Area: Zhayolm Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
-- package.loaded["scripts/zones/Zhayolm_Remnants/TextIDs"] = nil;



require("scripts/globals/treasure");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/salvagescaler");

local ID = require("scripts/zones/Bhaflau_Remnants/IDs")

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    print("Triggered");
    local door = GetNPCByID(17084919);
	local bossdoor = GetNPCByID(17084922);
	bossdoor:setStatus(dsp.status.NORMAL)
	door:setAnimation(dsp.anim.OPEN_DOOR)
    
end;


-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);

end;

