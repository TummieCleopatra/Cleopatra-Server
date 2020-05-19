-----------------------------------
--
-- Zone: Ghoyus_Reverie
--
-----------------------------------
local ID = require("scripts/zones/Ghoyus_Reverie/IDs")
-----------------------------------

function onInitialize(zone)

end;

function onZoneIn(player,prevZone)
    local cs = -1;

    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    print(csid)
    print(option)
end;

function onEventFinish(player,csid,option)
    -- TODO: Make a player var to determine which instance they came from since this instance is used for mulitple missions

    if (csid == 10000 and player:getVar("Instance") == 83) then
        player:setPos(358,16,-190,90,98);
        player:setVar("Instance",0)
    elseif (csid == 10000) then
        player:setPos(332,-4,-17,90,95);
    end
end;
