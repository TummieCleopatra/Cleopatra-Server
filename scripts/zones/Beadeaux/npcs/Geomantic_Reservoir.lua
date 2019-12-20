-----------------------------------
-- Area: Beadeaux
-- NPC:  Geomantic Resevoir
-- Geo-Slow
-- !pos 162,-3,38
-----------------------------------
require("scripts/globals/status");
local ID = require("scripts/zones/Beadeaux/IDs");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 52
    local spellID = 795
	
	local FreeSlots = player:getFreeSlotsCount()
    if (player:getVar("GEO_AF_FIGHT_LEGS") == 1) then
        SpawnMob(17379873):updateEnmity(player) -- Spawns Malevolent Gefryst

    end

    if (FreeSlots > 0 and player:getVar("GEO_AF_LEGS") == 1) then
        player:addItem(12245,1,133,4,1250,11,134,2,49,0)
        player:messageSpecial(ID.text.ITEM_OBTAINED,12245)
        player:setVar("GEO_AF_LEGS",0)
        player:setVar("GEO_AF",3)
    end

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2810,1) and player:getVar("GEO_AF") == 2 and player:getVar("GEO_AF_ACCEPTED") == 1) then
        player:PrintToPlayer("You sense a strong feeling of malice nearby...you should probably check the Resevoir", 0x1F);
        player:setVar("GEO_AF_FIGHT_LEGS",1)
        player:tradeComplete()
    end
end
