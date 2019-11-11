--------------------------
-- Area: Dynamis - B
-- NPC: ??? (qm0)
-- Type: Spawns Angra Mainyu
-- Notes: 4 Puks spawn depeding on Key Items
-- @pos 280,20,468
--------------------------
local ID = require("scripts/zones/Dynamis-Beaucedine/IDs")
--------------------------

require("scripts/zones/Dynamis-Beaucedine/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/weather");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
local key1 = 0;
local key2 = 0;
local key3 = 0;
local key4 = 0;
local totalkeys = 0;
local qm0 = GetNPCByID(17326800);
if (player:hasKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME)) then
    player:delKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);
	player:messageSpecial(ID.text.KEYITEM_LOST,ALABASTER_GRANULES_OF_TIME);
	key1 = 1;
end

if (player:hasKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME)) then
    player:delKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);
	player:messageSpecial(ID.text.KEYITEM_LOST,AMBER_GRANULES_OF_TIME);
	key2 = 1;
end

if (player:hasKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME)) then
    player:delKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);
	player:messageSpecial(ID.text.KEYITEM_LOST,AZURE_GRANULES_OF_TIME);
	key3 = 1;
end

if (player:hasKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME)) then
    player:delKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);
	player:messageSpecial(ID.text.KEYITEM_LOST,CRIMSON_GRANULES_OF_TIME);
	key4 = 1;
end

totalkeys = key1 + key2 + key3 + key4;



if (totalkeys == 0) then -- Spawn with 4 puks
    qm0:setStatus(dsp.status.DISAPPEAR);
	SpawnMob(17326081):updateClaim(player);
	SpawnMob(17326082):updateClaim(player);
	SpawnMob(17326083):updateClaim(player);
	SpawnMob(17326084):updateClaim(player);
	SpawnMob(17326085):updateClaim(player);
    player:PrintToPlayer("All of the minions have spawned!", 0xD);
elseif (totalkeys == 1) then -- Spawn with 3 puks
    qm0:setStatus(dsp.status.DISAPPEAR);
	SpawnMob(17326081):updateClaim(player);
	SpawnMob(17326082):updateClaim(player);
	SpawnMob(17326083):updateClaim(player);
	SpawnMob(17326084):updateClaim(player);
    player:PrintToPlayer("Your Key Item has prevented 1 of the minions from spawning!", 0xD);
elseif (totalkeys == 2) then -- Spawn with 2 puks
    qm0:setStatus(dsp.status.DISAPPEAR);
	SpawnMob(17326081):updateClaim(player);
	SpawnMob(17326082):updateClaim(player);
	SpawnMob(17326083):updateClaim(player);
    player:PrintToPlayer("Your Key Items have prevented 2 of the minions from spawning!", 0xD);
elseif (totalkeys == 3) then -- Spawn with 1 puks
    qm0:setStatus(dsp.status.DISAPPEAR);
	SpawnMob(17326081):updateClaim(player);
	SpawnMob(17326082):updateClaim(player);
    player:PrintToPlayer("Your Key Items have prevented 3 of the minions from spawning!", 0xD);
elseif (totalkeys == 4) then -- Spawn with 0 puks
    qm0:setStatus(dsp.status.DISAPPEAR);
	SpawnMob(17326081):updateClaim(player);
    player:PrintToPlayer("Your Key Items have prevented 4 of the minions from spawning!", 0xD);
end



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
end;