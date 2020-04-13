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

    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100);

end;


function onMobFight(mob,target)




end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)


	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
        master:PrintToPlayer("The device emits a faint hum...",0x15);
		master:setVar("1st_Floor_NM",1);
    else
        player:PrintToPlayer("The device emits a faint hum...",0x15);
		player:setVar("1st_Floor_NM",1);
    end

end;