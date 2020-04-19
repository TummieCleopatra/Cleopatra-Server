-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Silver Seas Remnants
-- Door: Gilded Gateway (Silve Sea)
-- !pos 580 0 442 72
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/besieged")
local ID = require("scripts/zones/Alzadaal_Undersea_Ruins/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:hasKeyItem(dsp.ki.REMNANTS_PERMIT) then
        local mask = -2
        if player:getMainLvl() >= 96 then
            mask = -14

        elseif player:getMainLvl() >= 65 then
            mask = -6
        end

        player:startEvent(410, 0, mask, 0, 0, 10)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player,csid,option,target)
	if (csid == 410) and (option == 524288) then
	    -- Add checks for players to ensure they are on the same mission (see pashow [S] waypoint)
        player:stopEvent(); -- Kills the Cutscene without text
	end
end

function onEventFinish(player,csid,option,target)
    -- printf("RESULT: %u",option);
  	local party = player:getParty();
	if (csid == 410) then
		if (player:hasKeyItem(dsp.ki.REMNANTS_PERMIT)) then
			if (party ~= nil) then
				for i,v in ipairs(party) do
					if (v:hasKeyItem(dsp.ki.REMNANTS_PERMIT) == false) then
						player:messageSpecial(MEMBER_NO_REQS);
						return
					elseif v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50 then
						player:messageSpecial(ID.text.MEMBER_TOO_FAR);
						return
					end
				end
			end
		    for i,k in ipairs(party) do
	            k:delKeyItem(dsp.ki.REMNANTS_PERMIT);
				k:setVar("Salvage_Level",35);
				k:setVar("Salvage_Entry",os.time());
                k:startEvent(116,2)
		    end

		else
		    player:messageSpecial(ID.text.MEMBER_NO_REQS);
		end
	elseif (csid == 116) then
        player:setVar("Ambience_Points",0);
        player:setPos(339,16,-189,62,0x4C);
    end
end


