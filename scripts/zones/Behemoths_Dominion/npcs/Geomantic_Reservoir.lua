-----------------------------------
-- Area: Behemoth's Dominion
-- NPC:  Geomantic Resevoir
-- Geo-DEX
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onTrigger(player,npc)
    local lvl = 49
    local spellID = 773

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;
