-----------------------------------
-- Area: Konschtat Highlands
-- NPC:  Geomantic Resevoir
-- Geo-Precision
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 14
    local spellID = 783

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
