-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Gateway (Arrapago)
-- !pos -580 0 -159 72
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
        -- salvage2 NYI
        --[[if player:getMainLvl() >= 96 then
            mask = -14
        else]]
        -- The Below Code enables the zone for entry
        -- if player:getMainLvl() >= 65 then
           --  mask = -6


        player:startEvent(408, 0, mask, 0, 0, 8)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player,csid,option,target)
	if (csid == 408) and (option == 524288) then
	    -- Add checks for players to ensure they are on the same mission (see pashow [S] waypoint)
        player:stopEvent(); -- Kills the Cutscene without text
	end
end

function onEventFinish(player,csid,option,target)
  	local party = player:getParty();
	if (csid == 408) then
		if (player:hasKeyItem(dsp.ki.REMNANTS_PERMIT)) then
		    printf("PLAYER HAS KEY ITEM!!!!");
			if (party ~= nil) then
				for i,v in ipairs(party) do
					if (v:hasKeyItem(dsp.ki.REMNANTS_PERMIT) == false) then
						player:messageSpecial(ID.text.MEMBER_NO_REQS);
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
				k:startEvent(0x19b, 8);
	            k:setPos(340,0,-270,194,0x4A);
		    end

		else
		    printf("No item");
		    player:messageSpecial(ID.text.MEMBER_NO_REQS);
		end
	end
end

