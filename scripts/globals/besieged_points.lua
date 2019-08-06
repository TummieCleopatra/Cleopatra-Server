-- ------------------------------
--  Handle Besieged Points
-- ------------------------------

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
		mult = 90;
        cap = 2500;
	elseif (caster:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == true) then
		mult = 120;
        cap = 2100;
	elseif (caster:hasKeyItem(dsp.ki.CS_WILDCAT_BADGE) == true) then
		mult = 150;
        cap = 1800;
	elseif (caster:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == true) then
		mult = 180;
        cap = 1600;
	elseif (caster:hasKeyItem(dsp.ki.S_WILDCAT_BADGE) == true) then
		mult = 210;
        cap = 1200;
	elseif (caster:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == true) then
		mult = 250;
        cap = 1000;
	elseif (caster:hasKeyItem(dsp.ki.LC_WILDCAT_BADGE) == true) then
		mult = 500;
        cap = 700;
	elseif (caster:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == true) then
		mult = 650;
        cap = 500;
	elseif (caster:hasKeyItem(dsp.ki.PFC_WILDCAT_BADGE) == true) then
		mult = 800;
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
		mult = 90;
        cap = 2500;
	elseif (caster:hasKeyItem(dsp.ki.SL_WILDCAT_BADGE) == true) then
		mult = 120;
        cap = 2100;
	elseif (caster:hasKeyItem(dsp.ki.CS_WILDCAT_BADGE) == true) then
		mult = 150;
        cap = 1800;
	elseif (caster:hasKeyItem(dsp.ki.SM_WILDCAT_BADGE) == true) then
		mult = 180;
        cap = 1600;
	elseif (caster:hasKeyItem(dsp.ki.S_WILDCAT_BADGE) == true) then
		mult = 210;
        cap = 1200;
	elseif (caster:hasKeyItem(dsp.ki.C_WILDCAT_BADGE) == true) then
		mult = 250;
        cap = 1000;
	elseif (caster:hasKeyItem(dsp.ki.LC_WILDCAT_BADGE) == true) then
		mult = 500;
        cap = 700;
	elseif (caster:hasKeyItem(dsp.ki.SP_WILDCAT_BADGE) == true) then
		mult = 650;
        cap = 500;
	elseif (caster:hasKeyItem(dsp.ki.PFC_WILDCAT_BADGE) == true) then
		mult = 800;
        cap = 400;
    end

    points = math.floor(final / mult) + 1;
    finalpoints = nukepts + points;
    if (finalpoints >= cap) then
        finalpoints = cap;
    end

    caster:setVar("Besieged_Nuke_Points",finalpoints)
end


function calculatePoints(player)
    local getCurePts = player:getVar("Besieged_Cure_Points")
    local getWsPts = player:getVar("Besieged_WS_Points")
    local getNukePts = player:getVar("Besieged_Nuke_Points")
    local besiegedCap = player:getVar("Besieged_Cap")

    local finalPts = getCurePts + getWsPts + getNukePts;
    if (finalPts >= besiegedCap) then
        finalPts = besiegedCap;
    end

    player:setVar("Besieged_Points",finalPts)
    player:PrintToPlayer("For your valiant efforts, you have been awarded "..finalPts.." Mercenary Points",0x1C);
    player:addExp(finalPts / 5)
end