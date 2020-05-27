---------------------------------------------------------------------------------------------------
-- func: trust
-- desc: displays trust options
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, toggle)
 	if (toggle == nil or tonumber(toggle) == nil or tonumber(toggle) > 3 or tonumber(toggle) < 0) then
	player:PrintToPlayer("Toggle the option to change how Trusts will auto attack" ,0x1C);
	player:PrintToPlayer("Type !tactics <#> 0: Default | 1: Melee Mode | 2: Mage Mode | 3: Najelith Pulls" ,0x1C);
	elseif (tonumber(toggle) == 0) then
	player:PrintToPlayer("Tactics Mode Set to 0.  Trusts will auto-attack any mob you draw your weapon on if you have enmity" ,0x1C);
    player:setVar("[TRUST]Bodyguard", 0);
    player:setVar("TrustPull", 0);
	elseif (tonumber(toggle) == 1) then
	player:PrintToPlayer("Tactics Mode Set to 1.  Trusts will auto-attack any mob you draw your weapon on" ,0x1C);
	player:setVar("[TRUST]Bodyguard", 1);
    player:setVar("TrustPull", 0);
	elseif (tonumber(toggle) == 2) then
	player:PrintToPlayer("Tactics Mode Set to 2.  Trusts will auto-attack mobs that agro you within 10 yalms" ,0x1C);
	player:setVar("[TRUST]Bodyguard", 2);
    player:setVar("TrustPull", 0);
    elseif (tonumber(toggle) == 3) then
    player:PrintToPlayer("Tactics Mode Set to 3.  Qualifying Trusts will now pull..." ,0x1C);
	player:setVar("TrustPull", 1);
    player:setVar("[TRUST]Bodyguard", 2);
	end


end