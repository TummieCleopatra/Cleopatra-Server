-----------------------------------
--
-- Zone: Al_Zahbi (48)
--
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/globals/chocobo")
require("scripts/globals/besieged_utils")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
    SetServerVariable("[BESIEGED]Undead_Swarm_Status",11) -- Set All Forces to retreat on Zone Reboot
    SetServerVariable("[BESIEGED]Undead_Swarm_End",1)
    -- SetServerVariable("[BESIEGED]Troll_Mercenaries_Status",11) -- Set All Forces to retreat on Zone Reboot
    -- SetServerVariable("[BESIEGED]Mamool_Ja_Status",11) -- Set All Forces to retreat on Zone Reboot
end

function onZoneIn(player,prevZone)
    local cs = -1

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
