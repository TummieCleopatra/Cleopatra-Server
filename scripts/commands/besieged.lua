---------------------------------------------------------------------------------------------------
-- func: bring <player>
-- desc: Brings the target to the player.
---------------------------------------------------------------------------------------------------

local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/zones/Al_Zahbi/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
cmdprops =
{
    permission = 1,
    parameters = "si"
};


function onTrigger(player, target)
    SpawnMob(16974025)
    GetMobByID(16974161):setSpawn(-35,0,48,180)
    SpawnMob(16974161)
end