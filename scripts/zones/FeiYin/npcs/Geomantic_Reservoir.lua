-----------------------------------
-- Area: Fei'Yin
-- NPC:  Geomantic Resevoir
-- Geo-Paralysis
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 72
    local spellID = 796

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
