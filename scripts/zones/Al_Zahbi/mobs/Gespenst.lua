-----------------------------------
-- Area: Al Zahbi
-- Mob: Gespent
-- Note: Besieged Mob
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/zones/Al_Zahbi/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
-- require("scripts/globals/campaign_utils");
-----------------------------------

function onMobSpawn(mob)
    undeadStrength(mob)
    mob:setLocalVar("Path",1);
    local randPath = math.random(1,8)
    mobStop(mob,randPath)
    mob:setLocalVar("RandPath",randPath)
    mob:setMobMod(dsp.mobMod.NO_DESPAWN, 1) -- SUPER IMPORTANT!!!!!!
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,999)
end

function onMobRoam(mob)
    mobAggroNpc(mob)
    enemyRoam(mob)
end

function onMobDisengage(mob)
    -- mob:setLocalVar("Path",1);
    mob:clearPath()
    resumePath(mob)
end

function onPath(mob)
    enemyPath(mob)
end;

function onMobDeath(mob, player, isKiller)
    undeadDeathCount(mob)
    mob:setSpawn(-91,2,57,180)
end
