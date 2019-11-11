-----------------------------------
-- Area: Davoi (149)
--  MOB: Malevolent Befryst
-----------------------------------

local ID = require("scripts/zones/Davoi/IDs");
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
    player:setVar("GEO_AF_HANDS",1)
    player:setVar("GEO_AF_ACCEPTED",0)
    player:setVar("GEO_AF_FIGHT",0)
end;
