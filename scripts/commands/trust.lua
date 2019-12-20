---------------------------------------------------------------------------------------------------
-- func: trust
-- desc: displays trust options
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player)
 	player:PrintToPlayer("The following Trust commands are available" ,0x1C);
 	player:PrintToPlayer("!trustpoints - Shows total Trust Points collected per Trust" ,0x1C);
 	-- player:PrintToPlayer("@db - Disbands a specific trust in the party" ,0x1C);	
 	-- player:PrintToPlayer("@disband - Disbands most recent trust" ,0x1C);	
 	-- player:PrintToPlayer("@tptrust - Sets the wait timer for trust WS at the start of a fight" ,0x1C);
end