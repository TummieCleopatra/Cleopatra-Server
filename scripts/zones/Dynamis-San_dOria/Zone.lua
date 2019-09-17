-----------------------------------
--
-- Zone: Dynamis-San_dOria
--
-----------------------------------
local ID = require("scripts/zones/Dynamis-San_dOria/IDs")
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Dynamis-San_dOria/IDs");
require("scripts/globals/keyitems");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

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

	local entry = player:getVar("Dynamis_Sandy_Enter");	
	local entertime = player:getVar("Dynamis_Entry");
	local currentTime = os.time()
	local fixduration = currentTime - entertime;
	print(fixduration);
	if (fixduration < 5400) then
	    player:addStatusEffectEx(dsp.effect.DYNA_RESTRICTION,dsp.effect.LEVEL_RESTRICTION,75,3,5400 - fixduration);
        player:PrintToPlayer("You have 90 minutes remaining in Dynamis", 0xD);
	    player:setVar("Dynamis_Sandy_Enter",0);
		player:setVar("Dynamis_Time_Remaining",5400000);
		player:setVar("ScyldMultiplier",0);
		player:setVar("Dynamis_Reenter",os.time() + reentertime);
	else
		player:setVar("ScyldMultiplier",0);
		player:delKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);
		player:delKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);
		player:delKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);
		player:delKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);	
        player:setPos(161.000,-2.000,161.000,94,0xE6);
	end
	return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
	player:setVar("ScyldMultiplier",0);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0) then
        player:setPos(161.000,-2.000,161.000,94,0xE6);
    end
end;