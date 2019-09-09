-----------------------------------
-- Area: Lower Delkfutts Tower
-- NPC:  Geomantic Resevoir
-- Geo-CHR
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 34
    local spellID = 778

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
