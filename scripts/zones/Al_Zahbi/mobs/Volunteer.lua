-----------------------------------
-- Area: Al Zahbi
-- NPC:  Volunteer
-- Fights in Besieged
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/zones/Al_Zahbi/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    helperStrength(mob)
end

function onMobRoam(mob)
    npcAggroMob(mob)
end

function onMobDeath(mob, player, isKiller)
    npcDeathCount(mob)
end
