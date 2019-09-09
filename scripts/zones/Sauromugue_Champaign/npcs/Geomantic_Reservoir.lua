-----------------------------------
-- Area: Sauromugue Champaign
-- NPC:  Geomantic Resevoir
-- Geo-Fury
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 38
    local spellID = 779

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
