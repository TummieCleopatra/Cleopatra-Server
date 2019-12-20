-----------------------------------
-- Area: Al Zahbi
-- NPC:  General Mihli
-- Fights in Besieged
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/zones/Al_Zahbi/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,100)
    generalStrength(mob)
end

function onMobRoam(mob)
    npcAggroMob(mob)
end

function onMobDeath(mob, player, isKiller)
    npcDeathCount(mob)
	local count = GetServerVariable("[BESIEGED]General_Dead")
	count = count + 1
	SetServerVariable("[BESIEGED]General_Dead",count)	
end
