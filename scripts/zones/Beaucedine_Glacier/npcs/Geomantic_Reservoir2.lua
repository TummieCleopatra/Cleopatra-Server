-----------------------------------
-- Area: Beaucedine Glacier
-- NPC:  Geomantic Resevoir
-- Geo-Acumen
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 50
    local spellID = 781

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
