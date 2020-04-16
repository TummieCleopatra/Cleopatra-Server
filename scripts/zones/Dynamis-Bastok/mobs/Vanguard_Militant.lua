-----------------------------------
-- Area: Dynamis - Bastok
--  Mob:
-----------------------------------
require("scripts/globals/status")
-----------------------------------
function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.ROAM_TURNS,3)
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,10)
    mob:setMobMod(dsp.mobMod.ROAM_COOL,35)
    mob:setMobMod(dsp.mobMod.ROAM_RATE,30)
end


function onMobDeath(mob, player, isKiller)
end