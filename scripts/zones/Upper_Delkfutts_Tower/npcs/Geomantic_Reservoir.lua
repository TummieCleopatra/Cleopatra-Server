-----------------------------------
-- Area: Upper Delkfut's Tower
-- NPC:  Geomantic Resevoir
-- Geo-Vex
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 74
    local spellID = 793

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
