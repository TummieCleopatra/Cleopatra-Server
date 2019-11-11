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

    if (player:getVar("GEO_AF_FIGHT_BODY") == 1) then
        SpawnMob(17232319):updateEnmity(player) -- Spawns Malevolent Gefryst

    end

    if (FreeSlots > 0 and player:getVar("GEO_AF_BODY") == 1) then
        player:addItem(12173,1,293,9,49,0,138,0)  -- Dark Magic Skill + 10, Haste + 1, Refresh + 1
        player:messageSpecial(ID.text.ITEM_OBTAINED,12173)
        player:setVar("GEO_AF_BODY",0)
        player:setVar("GEO_AF",4)
    end

    if (player:getMainLvl() >= lvl and player:hasSpell(spellID) and not player:hasSpell(spellID + 30) and player:getMainJob() == dsp.job.GEO) then
        player:addSpell(spellID + 30)
    end
end;

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2810,1) and player:getVar("GEO_AF") == 3 and player:getVar("GEO_AF_ACCEPTED") == 1) then
        player:PrintToPlayer("You sense a strong feeling of malice nearby...you should probably check the Resevoir", 0x1F);
        player:setVar("GEO_AF_FIGHT_BODY",1)
        player:tradeComplete()
    end
end

