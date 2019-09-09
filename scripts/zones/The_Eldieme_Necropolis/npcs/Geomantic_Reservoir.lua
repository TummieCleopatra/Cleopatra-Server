-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Geomantic Resevoir
-- Geo-Slip
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 62
    local spellID = 791

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
