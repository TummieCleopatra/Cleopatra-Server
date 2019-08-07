-----------------------------------
--
-- Zone: Dynamis-Windurst
--
-----------------------------------
local ID = require("scripts/zones/Dynamis-Windurst/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
	local d1 = 0;
	local d2 = 0;
	local d3 = 0;
	local d4 = 0;
	local d5 = 0;
	local d6 = 0;
	local reduction = 0;
	local reentertime = 43200;


	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER)) then
	d1 = 1;
	end
	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS)) then
	d2 = 1;
	end
	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_LANTERN)) then
	d3 = 1;
	end
	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_TACTICAL_MAP)) then
	d4 = 1;
	end
	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_INSIGNIA)) then
	d5 = 1;
	end
	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_BATTLE_STANDARD)) then
	d6 = 1;
	end

	reduction = d1 + d2 + d3 + d4 + d5 + d6;

	if (reduction == 1) then
	reentertime = 28800;
	elseif (reduction == 2) then
	reentertime = 21600;
	elseif (reduction == 3) then
	reentertime = 14400;
	elseif (reduction == 4) then
	reentertime = 10800;
	elseif (reduction == 5) then
	reentertime = 7200;
	elseif (reduction == 6) then
	reentertime = 0;
	end

	local entry = player:getVar("Dynamis_Windurst_Enter");
	local entertime = player:getVar("Dynamis_Entry");
	local currentTime = os.time()
	local fixduration = currentTime - entertime;
	print(fixduration);
	if (fixduration < 5400) then
	    player:addStatusEffectEx(dsp.effect.DYNAMIS,dsp.effect.LEVEL_RESTRICTION,75,3,5400 - fixduration);
        player:PrintToPlayer("You have 90 minutes remaining in Dynamis", 0xD);
	    player:setVar("Dynamis_Windurst_Enter",0);
		player:setVar("Dynamis_Time_Remaining",5400000);
		player:setVar("ScyldMultiplier",0);
		player:setVar("Dynamis_Reenter",os.time() + reentertime);
	else
		player:setVar("ScyldMultiplier",0);
		player:delKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);
		player:delKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);
		player:delKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);
		player:delKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);
		player:setPos(-217.000,1.000,-119.000,94,0xEF);  -- Windurst
	end
	return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 0) then
        player:setPos(-217.000,1.000,-119.000,94,239);
    end
end;
