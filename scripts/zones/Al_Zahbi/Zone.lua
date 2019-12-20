-----------------------------------
--
-- Zone: Al_Zahbi (48)
--
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/chocobo")
require("scripts/globals/besieged_utils")
require("scripts/globals/status")
require("scripts/globals/settings")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
    SetServerVariable("[BESIEGED]Undead_Swarm_Status",11) -- Set All Forces to retreat on Zone Reboot
    SetServerVariable("[BESIEGED]Undead_Swarm_End",1)
    SetServerVariable("[BESIEGED]Fallen_Allies",0)
    SetServerVariable("[BESIEGED]Undead_Multiplier",UNDEAD_RATE)
    SetServerVariable("[BESIEGED]Undead_Swarm_March",0);	
    -- SetServerVariable("[BESIEGED]Troll_Mercenaries_Status",11) -- Set All Forces to retreat on Zone Reboot
    -- SetServerVariable("[BESIEGED]Mamool_Ja_Status",11) -- Set All Forces to retreat on Zone Reboot
end

function onZoneIn(player,prevZone)
    local cs = -1

	local undead = GetServerVariable("[BESIEGED]Undead_Swarm_Status");
    if (undead == 3) then
        -- apply besieged effect
		printf("-- Player is Zoning -- ADD BESEIGED EFFECT")
        player:addStatusEffect(dsp.effect.BESIEGED,0,3,3600);
    end

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        position = math.random(1,5) + 37
        player:setPos(position,0,-62,192)
    end
    return cs
end

function onCampaignUpdate(zone)
    besiegedCheck(zone)
end

function onRegionEnter(player,region)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
