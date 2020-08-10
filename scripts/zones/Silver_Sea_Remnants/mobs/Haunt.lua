-----------------------------------
-- Area:
-- NPC:  Heraldic Imp
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

function onMobFight(mob,target)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	salvageAmbient(mob,player);
	salvageChestS(mob, isKiller)


end;