-----------------------------------
--
-- Zone: Bhaflau_Remnants
--
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
package.loaded["scripts/zones/Bhaflau_Remnants/IDs"] = nil;
require("scripts/zones/Bhaflau_Remnants/IDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)

    zone:registerRegion(1, 340, 5, -420, 0, 0, 0)  -- First Floor TEleporter  340 -1 -420 NM
	zone:registerRegion(2, 260, 5, 299, 0, 0, 0)  -- Second Floor TEleporter  260 3 299 NM	NW Room
	zone:registerRegion(3, 299, 5, 60, 0, 0, 0)  -- Second Floor TEleporter  380 -1 60 NM
	zone:registerRegion(4, 419, 5, 299, 0, 0, 0)  -- Second Floor TEleporter  419 3 299 NM	NW Room
	zone:registerRegion(5, 380, 5, 60, 0, 0, 0)  -- Second Floor TEleporter  380 -1 60 NM
	zone:registerRegion(6, -460, 5, -499, 0, 0, 0)  -- Third floor  -460,-5,-499 NM
	zone:registerRegion(7, -219, 5, -499, 0, 0, 0)  -- Third floor teleporter  -219,-5,-499 NM
	zone:registerRegion(8, -339, 5, 60, 0, 0, 0)  -- Third floor teleporter  -219,-5,-499 NM
	zone:registerRegion(9, -299, 5, 379, 0, 0, 0)  -- Third floor teleporter  -219,-5,-499 NM
	zone:registerRegion(10, -380, 5, 379, 0, 0, 0)  -- Third floor teleporter  -219,-5,-499 NM
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
	local bfloor = 1;
	local salvagelvl = player:getVar("Salvage_Level");
	if (salvagelvl == 0) then
	    salvagelvl = 35;
	elseif (salvagelvl >= 45 and salvagelvl <= 54) then
	    bfloor = 2;
	elseif (salvagelvl >= 55 and salvagelvl <= 64) then
	    bfloor = 3;
	elseif (salvagelvl >= 65 and salvagelvl <= 74) then
	    bfloor = 4;
	end
	player:setVar("Bhaflau_Floor",bfloor);

	local prevzone = player:getPreviousZone();
	if (prevzone == 72) then
	    salvagelvl = 35;
		player:getVar("Salvage_Level",35);
	end
	local entertime = player:getVar("Salvage_Entry");
	local currentTime = os.time()
	local fixduration = currentTime - entertime;
	local finaltime = 3600 - fixduration;
	if (fixduration < 3600) then
	    player:addStatusEffect(dsp.effect.LEVEL_RESTRICTION,salvagelvl,3,3600 - fixduration);
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
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    local regionId = region:GetRegionID();
	-- 100 fade out
    -- 101 fade out
	-- 4 warp possibly use this for remnants warp
	-- 200 2nd
	-- 201 3rd Floor NW
	-- 202 3rd Floor SW
	-- 203 3rd Floor NE
	-- 204 3rd Floor SE
	-- 205 4th Floor W
	-- 206 4th Floor E
	-- 207 Boss Floor
	-- 208
	-- 209
	-- 210


	-- FLOOR 1 TELEPORTS
	if (regionId == 1) then
	    player:startEvent(200);
	end

	-- FLOOR 2 TELEPORT
	if (regionId == 2) then
	   player:startEvent(201);
	elseif (regionId == 3) then
	   player:startEvent(202);
	elseif (regionId == 4) then
	   player:startEvent(203);
	elseif (regionId == 5) then
	   player:startEvent(204);
	end

    -- FLOOR 3 TELEPORTERS
	if (regionId == 6 and player:getVar("3rd_Floor_NM") == 1) then
	    player:startEvent(205);
	elseif (regionId == 7 and player:getVar("3rd_Floor_NM") == 1) then
	    player:startEvent(206);
    end

    -- FLOOR 4 TELEPORTER
	if (regionId == 8 and player:getVar("4th_Floor_NM") == 1) then
	    player:startEvent(207);
    end

	if (regionId == 9 or regionId == 10) then
	    player:startEvent(208);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 1 or csid == 8) then
	    player:setPos(619,0,-233,66,72);
	end

	if (csid == 200) then
	    player:setVar("Bhaflau_Floor",2);
		player:PrintToPlayer("Floor 2 - Max Cap: 55", 0x15);
	end

	if (csid >= 201 and csid <= 204) then
	    player:setVar("Bhaflau_Floor",3);
		player:PrintToPlayer("Floor 3 - Max Cap: 65", 0x15);
		if (player:getVar("Bhaflau_Card") ~= 1) then
		    player:setVar("Bhaflau_Card",1);
		    player:PrintToPlayer("Bhaflau Card Price has been reduced!", 0x15);
		end
	end

	if (csid >= 205 and csid <= 206) then
	    player:setVar("Bhaflau_Floor",4);
		player:PrintToPlayer("Floor 4 - Max Cap: 75", 0x15);
	end

	if (csid == 207) then
	    player:setVar("Bhaflau_Floor",5);
		player:PrintToPlayer("Floor 5 - Max Cap: Uncapped", 0x15);
	end

end;



