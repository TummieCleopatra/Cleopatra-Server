-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Geomantic Resevoir
-- Geo-AGI
-- !pos -207,-16,89
-----------------------------------
require("scripts/globals/status");
local ID = require("scripts/zones/Castle_Oztroja/IDs");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 43
    local spellID = 775
    local FreeSlots = player:getFreeSlotsCount()

    if (player:getVar("GEO_AF_FIGHT") == 1) then
        SpawnMob(17396160):updateEnmity(player) -- Spawns Malevolent Ungeweder

    end

    if (FreeSlots > 0 and player:getVar("GEO_AF_BOOTS") == 1) then
        player:addItem(12281,1,516,1,49,1)
        player:messageSpecial(ID.text.ITEM_OBTAINED,12281)
        player:setVar("GEO_AF_BOOTS",0)
        player:setVar("GEO_AF",1)
    end

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2810,1) and player:getVar("GEO_AF") == 0 and player:getVar("GEO_AF_ACCEPTED") == 1) then
        player:PrintToPlayer("You sense a strong feeling of malice nearby...you should probably check the Resevoir", 0x1F);
        player:setVar("GEO_AF_FIGHT",1)
        player:tradeComplete()
    end
end
