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
 	player:PrintToPlayer("The following commands are available" ,0x1C);
 	player:PrintToPlayer("!ah - Loads auction house menu (requires Feretory Aura 3 or higher)" ,0x1C);
 	player:PrintToPlayer("!boons - Shows current Feretory Boons and Achievements" ,0x1C);
 	player:PrintToPlayer("!feretory - Shows current Feretory Quests" ,0x1C);	
 	player:PrintToPlayer("!mogshop<#> - Access a given mogshop" ,0x1C);
 	player:PrintToPlayer("!resting - Displays current Resting EXP Bonus" ,0x1C);	
 	player:PrintToPlayer("!stuck - If your char gets stuck use this command (once per hour limit)" ,0x1C);	
 	player:PrintToPlayer("!trustpoints - Shows total Trust Points collected per Trust" ,0x1C);
 	-- player:PrintToPlayer("@db - Disbands a specific trust in the party" ,0x1C);	
 	-- player:PrintToPlayer("@disband - Disbands most recent trust" ,0x1C);	
 	-- player:PrintToPlayer("@tptrust - Sets the wait timer for trust WS at the start of a fight" ,0x1C);
end