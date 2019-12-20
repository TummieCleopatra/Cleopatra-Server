-- ------------------------------
--  Handle Besieged Points
-- ------------------------------

require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/settings")


function curePoints(caster,final)
    local mult = 0;
    local points = 0;
    local cap = 0;
    local finalpoints = 0;

    local curepts = caster:getVar("Besieged_Cure_Points")
	if (caster:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE) == true) then
        mult = 60;
        cap = 3000;
	elseif (caster:hasKeyItem(dsp.ki.FL_WILDCAT_BADGE) == true) then
		mult = 655;
        cap = 2500;
	elseif (caster:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == true) then
		mult = 70;
        cap = 2100;
	elseif (caster:hasKeyItem(dsp.ki.CS_WILDCAT_BADGE) == true) then
		mult = 75;
        cap = 1800;
	elseif (caster:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == true) then
		mult = 80;
        cap = 1600;
	elseif (caster:hasKeyItem(dsp.ki.S_WILDCAT_BADGE) == true) then
		mult = 80;
        cap = 1200;
	elseif (caster:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == true) then
		mult = 80;
        cap = 1000;
	elseif (caster:hasKeyItem(dsp.ki.LC_WILDCAT_BADGE) == true) then
		mult = 85;
        cap = 700;
	elseif (caster:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == true) then
		mult = 90;
        cap = 500;
	elseif (caster:hasKeyItem(dsp.ki.PFC_WILDCAT_BADGE) == true) then
		mult = 95;
        cap = 400;
	elseif (caster:hasKeyItem(dsp.ki.PSC_WILDCAT_BADGE) == true) then
		mult = 100;
        cap = 400;
    end

    points = math.floor(final / mult) + 1;
    finalpoints = curepts + points;
    if (finalpoints >= cap) then
        finalpoints = cap;
    end

    caster:setVar("Besieged_Cure_Points",finalpoints)
end

function nukePoints(caster,DMG)
    local mult = 0;
    local points = 0;
    local cap = 0;
    local finalpoints = 0;

    local nukepts = caster:getVar("Besieged_Nuke_Points")
	if (caster:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE) == true) then
        mult = 60;
        cap = 3000;
	elseif (caster:hasKeyItem(dsp.ki.FL_WILDCAT_BADGE) == true) then
		mult = 65;
        cap = 2500;
	elseif (caster:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == true) then
		mult = 70;
        cap = 2100;
	elseif (caster:hasKeyItem(dsp.ki.CS_WILDCAT_BADGE) == true) then
		mult = 75;
        cap = 1800;
	elseif (caster:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == true) then
		mult = 80;
        cap = 1600;
	elseif (caster:hasKeyItem(dsp.ki.S_WILDCAT_BADGE) == true) then
		mult = 85;
        cap = 1200;
	elseif (caster:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == true) then
		mult = 90;
        cap = 1000;
	elseif (caster:hasKeyItem(dsp.ki.LC_WILDCAT_BADGE) == true) then
		mult = 95;
        cap = 700;
	elseif (caster:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == true) then
		mult = 100;
        cap = 400;
	elseif (caster:hasKeyItem(dsp.ki.PFC_WILDCAT_BADGE) == true) then
		mult = 110;
        cap = 200;
	elseif (caster:hasKeyItem(dsp.ki.PSC_WILDCAT_BADGE) == true) then
		mult = 120;
        cap = 100;
    end

    points = math.floor(DMG / mult) + 1;
    finalpoints = nukepts + points;
    if (finalpoints >= cap) then
        finalpoints = cap;
    end

    caster:setVar("Besieged_Nuke_Points",finalpoints)
end

function wsPoints(attacker,finaldmg)
    local mult = 0;
    local points = 0;
    local cap = 0;
    local finalpoints = 0;

    local wspts = attacker:getVar("Besieged_WS_Points")
	if (attacker:hasKeyItem(dsp.ki.CAPTAIN_WILDCAT_BADGE) == true) then
        mult = 8;
        cap = 3000;
	elseif (attacker:hasKeyItem(dsp.ki.FL_WILDCAT_BADGE) == true) then
		mult = 10;
        cap = 2500;
	elseif (attacker:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == true) then
		mult = 10;
        cap = 2100;
	elseif (attacker:hasKeyItem(dsp.ki.CS_WILDCAT_BADGE) == true) then
		mult = 10;
        cap = 1800;
	elseif (attacker:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == true) then
		mult = 11;
        cap = 1600;
	elseif (attacker:hasKeyItem(dsp.ki.S_WILDCAT_BADGE) == true) then
		mult = 12;
        cap = 1200;
	elseif (attacker:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == true) then
		mult = 13;
        cap = 1000;
	elseif (attacker:hasKeyItem(dsp.ki.LC_WILDCAT_BADGE) == true) then
		mult = 14;
        cap = 700;
	elseif (attacker:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == true) then
		mult = 15;
        cap = 400;
	elseif (attacker:hasKeyItem(dsp.ki.PFC_WILDCAT_BADGE) == true) then
		mult = 15;
        cap = 200;
	elseif (attacker:hasKeyItem(dsp.ki.PSC_WILDCAT_BADGE) == true) then
		mult = 15;
        cap = 100;
    end

    points = math.floor(finaldmg / mult) + 1;
    finalpoints = wspts + points;
    if (finalpoints >= cap) then
        finalpoints = cap;
    end
    printf("Final Points %u",finalpoints)
    attacker:setVar("Besieged_WS_Points",finalpoints)

end

function evaluatePoints(target)
    local getCurePts = target:getVar("Besieged_Cure_Points")
    local getWsPts = target:getVar("Besieged_WS_Points")
    local getNukePts = target:getVar("Besieged_Nuke_Points")
    local besiegedCap = target:getVar("Besieged_Cap")
    local mercCap = target:getVar("Merc_Cap")

    if (mercCap == 0) then
        mercCap = 1000
        target:setVar("Merc_Cap",1000)
    end

    local finalPts = getCurePts + getWsPts + getNukePts;
    if (finalPts >= besiegedCap) then
        finalPts = besiegedCap;
    end

    target:setVar("Besieged_Points",finalPts)


    local mercPoints = target:getVar("Mercenary_Points")
    mercPoints = mercPoints + finalPts
    if (mercPoints >= mercCap) then
        mercPoints = mercCap
    end

    target:setVar("Mercenary_Points",mercPoints)
    if (mercPoints == mercCap) then
        target:PrintToPlayer("You cannot obtain any more Mercenary Points.  Please visit Abquhbah in Whitegate for a promotion.",0x1C);
    else
        target:PrintToPlayer("For your valiant efforts, you have been awarded "..finalPts.." Mercenary Points.  Total: "..mercPoints..".",0x1C);
        target:addExp(finalPts / 5)
    end
    -- Reset points
	target:setVar("Besieged_Cure_Points",0);
	target:setVar("Besieged_WS_Points",0);
    target:setVar("Besieged_Mag_Points",0);
    target:setVar("Besieged_Nuke_Points",0);	
end


function calculatePoints(player)
    local getCurePts = player:getVar("Besieged_Cure_Points")
    local getWsPts = player:getVar("Besieged_WS_Points")
    local getNukePts = player:getVar("Besieged_Nuke_Points")
    local besiegedCap = player:getVar("Besieged_Cap")
    local mercCap = player:getVar("Merc_Cap")

    if (mercCap == 0) then
        mercCap = 1000
        target:setVar("Merc_Cap",1000)
    end

    local finalPts = getCurePts + getWsPts + getNukePts;
    if (finalPts >= besiegedCap) then
        finalPts = besiegedCap;
    end

    local mercPoints = player:getVar("Mercenary_Points")
    mercPoints = mercPoints + finalPts
    if (mercPoints >= mercCap) then
        mercPoints = mercCap
    end

    player:setVar("Mercenary_Points",mercPoints)
    if (mercPoints == mercCap) then
        player:PrintToPlayer("You cannot obtain any more Mercenary Points.  Please visit Abquhbah in Whitegate for a promotion.",0x1C);
    else
        player:PrintToPlayer("For your valiant efforts, you have been awarded "..finalPts.." Mercenary Points.  Total: "..mercPoints..".",0x1C);
        player:addExp(finalPts / 5)
    end
	
    -- Reset points
	player:setVar("Besieged_Cure_Points",0);
	player:setVar("Besieged_WS_Points",0);
    player:setVar("Besieged_Mag_Points",0);	
    player:setVar("Besieged_Nuke_Points",0);	
end