-----------------------------------
-- Area: Xarcabard
-- NPC:  Geomantic Resevoir
-- Geo-Torpor
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 56
    local spellID = 792
    local FreeSlots = player:getFreeSlotsCount();
    if (player:getVar("GEO_AF_FIGHT_HEAD") == 1) then
        SpawnMob(17236370):updateEnmity(player) -- Spawns Malevolent Byrgen

    end

    if (FreeSlots > 0 and player:getVar("GEO_AF_HEAD") == 1) then
        player:addItem(12137,1,140,2,292,14,49,3)  -- Fast Cast + 3, Elemental +15, Haste + 4
        player:messageSpecial(ID.text.ITEM_OBTAINED,12137)
        player:setVar("GEO_AF_HEAD",0)
        player:setVar("GEO_AF",5)
    end

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
