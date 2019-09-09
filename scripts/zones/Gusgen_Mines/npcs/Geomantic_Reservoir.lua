-----------------------------------
-- Area: Gusgen Mines
-- NPC:  Geomantic Resevoir
-- Geo-Focus
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 26
    local spellID = 785

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
