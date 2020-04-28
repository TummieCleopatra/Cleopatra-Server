---------------------------------------------------------------------------------------------------
-- func: addkeyitem <ID> <player>
-- desc: Adds a key item to the player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/keyitems");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};


function onTrigger(player, msg)
    msg = tostring(msg)
    player:PrintToServer(msg, 0x06);

end;
