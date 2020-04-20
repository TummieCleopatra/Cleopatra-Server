-----------------------------------
-- Area:
-- NPC:  Wamouracampa
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

 	salvageAmbient(mob,player);
    salvageChestB(mob,player)
    local mobid = mob:getID()
	if (player:getObjType() ~= dsp.objType.PC and (mobid == 17084925 or mobid == 17084926)) then
	    local master = player:getMaster();
        master:PrintToPlayer("The device emits a faint hum...",0x15);
		master:setVar("3rd_Floor_NM",1);
    else
        player:PrintToPlayer("The device emits a faint hum...",0x15);
		player:setVar("3rd_Floor_NM",1);
    end

end;