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
    msg = tonumber(msg)
    if (msg > 0) then
        player:PrintToServer("The Cleopatra Server will be conducting Maintenence in "..msg.." minutes", 0x06);
        player:PrintToServer("Please make sure to log off in a safe place", 0x06);
    else
        player:PrintToServer("Maintenence will be starting now.  Please logout", 0x06);
    end
end;
