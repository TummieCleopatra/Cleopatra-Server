---------------------------------------------------------------------------------------------------
-- func: return <player>
-- desc: Warps GM or target player to their previous zone
---------------------------------------------------------------------------------------------------
require("scripts/globals/zone")
require("scripts/globals/status")
require("scripts/globals/hunts")
-----------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};


function onTrigger(player, target)
    getHunt(player)
end