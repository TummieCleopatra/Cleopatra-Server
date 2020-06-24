-----------------------------------
--
-- Zone: Silver_Sea_Remnants
--
-----------------------------------
local ID = require("scripts/zones/Silver_Sea_Remnants/IDs")
-----------------------------------

function onInitialize(zone)

    zone:registerRegion(1, 340, 5, -300, 0, 0, 0)  -- NW  340 -1 -300
	-- Second Floor Teleeporters
    zone:registerRegion(2, 260, 5, 379, 0, 0, 0)  -- SE  260 3 379	Teleport to Bottom left Floor 3
	zone:registerRegion(3, 300, -1, 619, 0, 0, 0) -- 300 -1 619 NE Top Left Teleporter to floor 3
	zone:registerRegion(4, 419, 5, 379, 0, 0, 0) --  Bottom Right Teleport 419 3 379
	zone:registerRegion(5, 380, 5, 260, 0, 0, 0) -- 380 -1 260 Top Right Teleport to Floor 3
	-- third Floor Teleporter
	zone:registerRegion(6, -459, 5, -299, 0, 0, 0) -- -459 -5 -299 Top Right Teleport to Floor 4
	zone:registerRegion(7, -219, 5, -299, 0, 0, 0) -- -219 -5 -299 Top Right Teleport to Floor 4
    -- fourth Floor Teleporter
	zone:registerRegion(8, -340, 5, 99, 0, 0, 0) ---340 -5 99 Telerter to final floor
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;
	local sa = 0;
	local sb = 0;
	local ss = 0;
	local sz = 0;

	local arrwin = player:getVar("Arrapago_Win");
	local bhafwin = player:getVar("Bhafflau_Win");
	local silverwin = player:getVar("Silver_Win");
	local zhayolmwin = player:getVar("Zhayolm_Win");
	local reduction = 0;

	if (arrwin == 1) then
	    sa = 1;
	end

	if (bhafwin == 1) then
	    sb = 1;
	end

	if (silverwin == 1) then
	    ss = 1;
	end

	if (zhayolmwin == 1) then
	    sz = 1;
	end

	reduction = sa + sb + ss + sz;
	local zfloor = 1;
	local salvagelvl = player:getVar("Salvage_Level");
    local entertime = player:getVar("Salvage_Entry");
	if (salvagelvl == 0) then
	    salvagelvl = 35;
	elseif (salvagelvl >= 45 and salvagelvl <= 54) then
	    sfloor = 2;
	elseif (salvagelvl >= 55 and salvagelvl <= 64) then
	    sfloor = 3;
	elseif (salvagelvl >= 65 and salvagelvl <= 74) then
	    sfloor = 4;
	end
	player:setVar("Silver_Floor",zfloor);

	local prevzone = player:getPreviousZone();
	if (prevzone == 72) then
	    salvagelvl = 35;
	end

	local currentTime = os.time()
	local fixduration = currentTime - entertime;
	local finaltime = 5400 - fixduration;
	if (fixduration < 5400) then
	    player:addStatusEffect(dsp.effect.LEVEL_RESTRICTION,salvagelvl,3,5400 - fixduration);
	    -- player:PrintToPlayer("You have 100 minutes to complete your objective.", 0x15);
    else
		player:setVar("1st_Floor_NM",0);
	    player:setVar("2nd_Floor_NM",0);
	    player:setVar("3rd_Floor_NM",0);
	    player:setVar("4th_Floor_NM",0);
	    player:setVar("5th_Floor_NM",0);
	    player:setVar("6th_Floor_NM",0);
		player:setVar("Salvage_Floor",0);
		cs = 1;
    end
return cs;
end

function onRegionEnter(player,region)
    -- 200 Floor 2 Middle
	-- 201 floor 3 Bottom Left
	-- 202 floor 3 Top Left
	-- 203 floor 3 Bottom Right
	-- 204 floor 3 Top Right
	-- 205 floor 4 left
	-- 206 floor 4 right
	-- 207 floor 5th


	-- 208 floor 5 upper right
	-- 209 floor 6
	-- Floor 1 Teleporter
	if (regionId == 1 and player:getVar("1st_Floor_NM") == 1) then
	    player:startEvent(200);
	end

	-- Floor 2 Teleporters
	if (regionId == 2 and player:getVar("2nd_Floor_NM") == 1) then
	    player:startEvent(201);
	elseif (regionId == 3 and player:getVar("2nd_Floor_NM") == 1) then
	    player:startEvent(202);
	elseif (regionId == 4 and player:getVar("2nd_Floor_NM") == 1) then
	    player:startEvent(203);
	elseif (regionId == 5 and player:getVar("2nd_Floor_NM") == 1) then
	    player:startEvent(204);
	end

	-- Floor 3 Teleporters
    if (regionId == 6 and player:getVar("3rd_Floor_NM") == 1) then
	    player:startEvent(205);
	elseif (regionId == 7 and player:getVar("3rd_Floor_NM") == 1) then
	    player:startEvent(206);
	end

	-- Floor 4 Teleporter
	if (regionId == 8 and player:getVar("4th_Floor_NM") == 1) then
	    player:startEvent(207);
	end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 1 or csid == 8) then
	    player:setPos(619,0,-233,66,72);
	end

	if (csid == 200) then
	    player:setVar("Silver_Floor",2);
		player:PrintToPlayer("Floor 2 - Max Cap: 55", 0x15);
	end

	if (csid >= 201 and csid <= 204) then
	    player:setVar("Silver_Floor",3);
		player:PrintToPlayer("Floor 3 - Max Cap: 65", 0x15);
		if (player:getVar("Silver_Card") ~= 1) then
		    player:setVar("Silver_Card",1);
		    player:PrintToPlayer("Sea Silver Card Price has been reduced!", 0x15);
		end
	end

	if (csid >= 205 and csid <= 206) then
	    player:setVar("Silver_Floor",4);
		player:PrintToPlayer("Floor 4 - Max Cap: 75", 0x15);
	end

	if (csid == 207) then
	    player:setVar("Silver_Floor",5);
		player:PrintToPlayer("Floor 5 - Max Cap: Uncapped", 0x15);
	end
end;
