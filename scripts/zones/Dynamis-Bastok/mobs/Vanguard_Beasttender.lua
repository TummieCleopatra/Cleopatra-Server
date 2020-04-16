-----------------------------------
-- Area: Dynamis - Bastok
--  Mob:
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,8)
end

function onMobDeath(mob, player, isKiller)
end