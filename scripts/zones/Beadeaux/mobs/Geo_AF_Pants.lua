-----------------------------------
-- Area: Beadeaux (147)
--  MOB: Malevolent Befryst
-----------------------------------

local ID = require("scripts/zones/Beadeaux/IDs");
require("scripts/globals/status")

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
    player:setVar("GEO_AF_LEGS",1)
    player:setVar("GEO_AF_ACCEPTED",0)
    player:setVar("GEO_AF_FIGHT",0)
end;
