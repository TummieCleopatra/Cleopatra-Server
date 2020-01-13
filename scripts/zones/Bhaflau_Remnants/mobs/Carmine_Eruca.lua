-----------------------------------
-- Area: Bhaflau Remnants
-- MOB:  Carmine Eruca
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/salvagescaler");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    salvageScaler(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
	salvageAmbient(mob,player);
	salvageChestB(mob,player)


end;