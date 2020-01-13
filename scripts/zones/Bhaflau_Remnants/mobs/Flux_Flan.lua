-----------------------------------
-- Area:
-- NPC:  Demented Jalawaa
-- Role: Portal Unlock
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
require("scripts/zones/Bhaflau_Remnants/IDs");
local ID = require("scripts/zones/Bhaflau_Remnants/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

    salvageScaler(mob)

end;


function onMobFight(mob,target)




end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    salvageLoot(player,npc)
	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
        master:PrintToPlayer("The device emits a faint hum...",0x15);
		master:setVar("2nd_Floor_NM",1);
    else
        player:PrintToPlayer("The device emits a faint hum...",0x15);
		player:setVar("2nd_Floor_NM",1);
		player:setVar("Bhaflau_Card",1);
		player:PrintToPlayer("The Bhaflau Card price has now been reduced.",0x15);
    end

end;