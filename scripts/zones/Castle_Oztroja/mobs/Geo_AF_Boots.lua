-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Malevolent Ungewader
-----------------------------------

local ID = require("scripts/zones/Castle_Oztroja/IDs");
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
    player:setVar("GEO_AF_BOOTS",1)
    player:setVar("GEO_AF_ACCEPTED",0)
    player:setVar("GEO_AF_FIGHT",0)
end;
