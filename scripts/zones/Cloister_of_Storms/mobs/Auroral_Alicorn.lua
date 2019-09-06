-----------------------------------
-- Area: Cloister of Storms
-- NPC:  Auroral Alicorn
-- Summon Fight
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("astralflows",1);
    mob:setLocalVar("spellcast",os.time() + 15)
end;



function onMobFight(mob, target)
    local astralFlows = mob:getLocalVar("astralflows");
    local afTrigger = math.random(25,50);

    local spellRandom = math.random(20,45)
    local spellcast = mob:getLocalVar("spellcast")

    local battletime = os.time()

    if (battletime > spellcast + spellRandom) then
        local spelltype = math.random(1,5)
        if (spelltype == 1) then
            mob:castSpell(32) -- Banish V
        elseif (spelltype == 2) then
            mob:castSpell(22) -- Holy II
        elseif (spelltype == 3) then
            mob:castSpell(36) -- Diaga IV
        elseif (spelltype == 4) then
            mob:castSpell(26) -- Dia IV
        elseif (spelltype == 5) then
            mob:castSpell(42) -- Banishaga V
        end
        mob:setLocalVar("spellcast",os.time())
    end



    if (mob:getHPP() <= afTrigger) and (astralFlows == 1) then
        mob:useMobAbility(2575);
        mob:setLocalVar("astralflows",2);
    end
end;


-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local ixion = player:getVar("IxionWin");
    player:PrintToPlayer("Ixion: A mere mortal defeat me...???",0x0D);
    player:setVar("IxionKill",2);
    if (ixion ~= 1) then
        player:setVar("IxionWin",1);
        player:PrintToPlayer("You may now summon Ixion using Light Spirit pact under Astral Flow",0x15);
    end
end;