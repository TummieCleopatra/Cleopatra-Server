---------------------------------------------------------------------------------------------------
-- func: @addcurrency <currency type> <amount> <player player>
-- desc: Adds the specified currency to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "sis"
};

function onTrigger(player)
    local getCurePts = player:getVar("Besieged_Cure_Points")
    local getWsPts = player:getVar("Besieged_WS_Points")
    local getNukePts = player:getVar("Besieged_Nuke_Points")
    local besiegedCap = player:getVar("Besieged_Cap")
    local mercCap = player:getVar("Merc_Cap")
	
	print(getWsPts)
	print(getCurePts)
	print(getNukePts)	



    local finalPts = getCurePts + getWsPts + getNukePts;
    if (finalPts >= besiegedCap) then
        finalPts = besiegedCap;
    end




    local mercPoints = player:getVar("Mercenary_Points")

    player:PrintToPlayer("Your current evaluation is "..finalPts.." Mercenary Points.  Total: "..mercPoints..".",0x1C);


end;