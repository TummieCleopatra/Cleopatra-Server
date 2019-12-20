---------------------------------------------------------------------------------------------------
-- func: @addcurrency <currency type> <amount> <target player>
-- desc: Adds the specified currency to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "sis"
};

function onTrigger(player)
local boonpower = player:getVar("FerretoryMageBoonPower");
local meleeboonpower = player:getVar("FerretoryMeleeBoonPower");
	local mabboon = (math.floor(boonpower * 1.43));
	local fcboon = (math.floor((boonpower * 0.5) -1));
	local maccboon = boonpower;
	local curepotboon = (boonpower - 4);
	if (curepotboon < 0) then
		curepotboon = 0;
	end
	
	local attboon = (meleeboonpower * 2) + 1;
	local rattboon = (meleeboonpower * 2) + 1;
	local accboon = (math.floor(meleeboonpower * 1.5));
    local storetpboon = (math.floor((meleeboonpower * 0.5) - 1));
	if (storetpboon < 0) then
	    storetpboon = 0;
	end


player:PrintToPlayer("The following Bonuses are active:",0x15);
player:PrintToPlayer("Attack/Ranged Atack+"..attboon.." ", 0xD);
player:PrintToPlayer("Accuracy/Ranged Accuracy+"..accboon.." ", 0xD);
player:PrintToPlayer("Magic Attack Bonus+"..mabboon.."", 0xD);
player:PrintToPlayer("Magic Accuracy+"..maccboon.."" , 0xD);
player:PrintToPlayer("Cure Potency+"..curepotboon.."% ", 0xD);
player:PrintToPlayer("Store TP+"..storetpboon.."", 0xD);



end;