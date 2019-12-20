-----------------------------------
-- Area: Al Zahbi
-- NPC:  Immortal Guard
-- Fights in Besieged
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/zones/Al_Zahbi/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
require("scripts/globals/besieged_utils");
-----------------------------------

function onMobSpawn(mob)
    helperStrength(mob)
end

function onMobRoam(mob)
    npcAggroMob(mob)
end


function onMobDeath(mob, player, isKiller)
    npcDeathCount(mob)
	local count = GetServerVariable("[BESIEGED]Guard_Dead")
	count = count + 1
	SetServerVariable("[BESIEGED]Guard_Dead",count)	
end
