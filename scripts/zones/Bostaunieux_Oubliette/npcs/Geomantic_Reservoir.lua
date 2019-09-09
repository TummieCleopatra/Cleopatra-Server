-----------------------------------
-- Area: Bostaunieux Oubliette
-- NPC:  Geomantic Resevoir
-- Geo-Languor
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 68
    local spellID = 794

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
