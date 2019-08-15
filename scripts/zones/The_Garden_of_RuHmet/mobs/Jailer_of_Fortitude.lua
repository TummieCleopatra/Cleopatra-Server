-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer_of_Fortitude
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/mobscaler");
local ID = require("scripts/zones/The_Garden_of_RuHmet/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",8); 
    -- Give it two hour
    mob:setMobMod(dsp.modMod.MAIN_2HOUR, 1);
    mob:setMobMod(dsp.modMod.2HOUR_MULTI, 1);
    -- Change animation to humanoid w/ prismatic core
    mob:AnimationSub(1);
    mob:setModelId(1169);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob)
    local size = target:getPartySize();
	mobScaler(mob,target);
    local delay = mob:getLocalVar("delay");
    local LastCast = mob:getLocalVar("LAST_CAST");
    local spell = mob:getLocalVar("COPY_SPELL");

    if (mob:getBattleTime() - LastCast > 30) then
        mob:setLocalVar("COPY_SPELL", 0);
        mob:setLocalVar("delay", 0);
    end;

    if (IsMobDead(16921016)==false or IsMobDead(16921017)==false) then -- check for kf'ghrah
        if (spell > 0 and mob:hasStatusEffect(dsp.effect.SILENCE) == false) then
            if (delay >= 3) then
                mob:castSpell(spell);
                mob:setLocalVar("COPY_SPELL", 0);
                mob:setLocalVar("delay", 0);
            else
                mob:setLocalVar("delay", delay+1);
            end;
        end;
    end;
end;

-----------------------------------
-- onMagicHit Action
-----------------------------------

function onMagicHit(caster,target,spell)
    if (spell:tookEffect() and (caster:isPC() or caster:isPet()) and spell:getSpellGroup() ~= dsp.magic.spellGroup.BLUE ) then
        -- Handle mimicked spells
        target:setLocalVar("COPY_SPELL", spell:getID());
        target:setLocalVar("LAST_CAST", target:getBattleTime());
        target:setLocalVar("reflectTime", target:getBattleTime());
        target:AnimationSub(1);
    end;

    return 1;
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
        player:setVar("Fort_Win",1);
	    player:addCurrency('zeni_point',250);
	    player:PrintToPlayer("You obtain 250 Zeni Points.", 0x15);		

    -- Despawn the pets if alive
    DespawnMob(ID.mob.Kf_Ghrah_WHM);
    DespawnMob(ID.mob.Kf_Ghrah_BLM);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local pos = math.random(1, 5)
    GetNPCByID(ID.npc.JAILER_OF_FORTITUDE_QM):setPos(ID.npc.JAILER_OF_FORTITUDE_QM_POS[pos][1], ID.npc.JAILER_OF_FORTITUDE_QM_POS[pos][2], ID.npc.JAILER_OF_FORTITUDE_QM_POS[pos][3])
end;
