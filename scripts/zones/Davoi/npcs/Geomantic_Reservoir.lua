-----------------------------------
-- Area: Davoi
-- NPC:  Geomantic Resevoir
-- Geo-FEND
-- !pos 173,3,-386
-----------------------------------
require("scripts/globals/status");
local ID = require("scripts/zones/Davoi/IDs");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 44
    local spellID = 782

    local FreeSlots = player:getFreeSlotsCount()

    if (player:getVar("GEO_AF_FIGHT_HANDS") == 1) then
        SpawnMob(17388056):updateEnmity(player); -- Spawns Malevolent Baelfyr

    end

    if (FreeSlots > 0 and player:getVar("GEO_AF_HANDS") == 1) then
        player:addItem(12209,1,300,9,49,1,71,0,112,9)
        player:messageSpecial(ID.text.ITEM_OBTAINED,12209)
        player:setVar("GEO_AF_BOOTS",0)
        player:setVar("GEO_AF",2)
    end

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2810,1) and player:getVar("GEO_AF") == 1 and player:getVar("GEO_AF_ACCEPTED") == 1) then
        player:PrintToPlayer("You sense a strong feeling of malice nearby...you should probably check the Resevoir", 0x1F);
        player:setVar("GEO_AF_FIGHT_HANDS",1)
        player:tradeComplete()
    end
end

