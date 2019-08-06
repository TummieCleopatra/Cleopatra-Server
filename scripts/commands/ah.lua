---------------------------------------------------------------------------------------------------
-- func: @ah
-- desc: opens the Auction House menu anywhere in the world just to see if we can
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

function onTrigger(player,npc)
    local aura = player:getVar("FerretoryAura");
	if (aura >= 3) then
	player:sendMenu(3);
	else
	player:PrintToPlayer("You do not have enough Feretory Aura to access this feature.", 0xE);
	end
end;