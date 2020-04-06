-----------------------------------
-- Area: Sealion den
-- NPC:  Ulmia
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)

    mob:addStatusEffect(dsp.effect.BIND, 1, 0, 1800);
	mob:setMobMod(dsp.mobMod.HP_STANDBACK,25)
    mob:addMod(dsp.mod.UDMGPHYS, -100)
    mob:addMod(dsp.mod.UDMGRANGE, -100)
    mob:addMod(dsp.mod.UDMGBREATH, -100)
    mob:addMod(dsp.mod.UDMGMAGIC, -100)
	-- mob:hideName(true);
    mob:setLocalVar("TwoHour", 1); -- initialize 2 hr
    local hp = math.random(30,35)
    mob:setLocalVar("TwoHourHP", hp);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:setLocalVar("Buff1",5); -- use the first buff after 10 seconds of battle
    mob:setLocalVar("Buff2",10); -- use the second buff after 20 seconds of battle
    mob:setLocalVar("Debuff",15);
end;

function onMobFight(mob,target)

    local battletime = mob:getBattleTime();
    local buffone = mob:getLocalVar("Buff1");
    local bufftwo = mob:getLocalVar("Buff2");
    local debuff = mob:getLocalVar("Debuff")
    local prishe = GetMobByID(16908475)
    local prishehp = GetMobByID(16908475):getHPP();
    local twohour = mob:getLocalVar("TwoHour");
    local hp = mob:getLocalVar("TwoHourHP");

-- print(buffone);
-- print(battletime);
    local ptarget = prishe:getTarget()


    local debuffCheck = math.random(1,100)
    if (battletime > debuff + 65) then
        if (prishehp > 30) then
            if (debuffCheck < 20 ) then
                mob:castSpell(376,ptarget) -- Horde Lullaby
            else
                mob:castSpell(373,ptarget) -- Foe Requiem
            end
            mob:setLocalVar("Debuff",battletime)
        else
            if (debuffCheck < 50 ) then
                if (ptarget:getObjType() == dsp.objType.TRUST) then
                    local master = ptarget:getMaster()
                    mob:CastSpell(376,master)
                else
                    mob:castSpell(376,ptarget) -- Horde Lullaby
                end
            elseif (debuffCheck < 60) then
                mob:castSpell(373,ptarget) -- Foe Requiem
            else
                mob:castSpell(423,ptarget) -- Masacre Elegy
            end
            mob:setLocalVar("Debuff",battletime)
        end
    end


    if (prishehp > 75) then
        if (battletime > buffone) then
            printf("Buff One")
            mob:castSpell(420, mob);  -- Victory March
            printf("Try to Cast Victory march");
            buffone = battletime + 130;
            mob:setLocalVar("Buff1",buffone);
        elseif (battletime > bufftwo) then
            mob:castSpell(419, mob);  -- Advancing March
            bufftwo = battletime + 130;
            mob:setLocalVar("Buff2",bufftwo);
        end
    elseif (prishehp > 50) then
        if (battletime > buffone) then
            printf("Try to Cast Victory march");
            mob:castSpell(420, mob);  -- Victory March
            buffone = battletime + 130;
            mob:setLocalVar("Buff1",buffone);
        elseif (battletime > bufftwo) then
            mob:castSpell(397, mob);  -- Valor Minuet IV
            bufftwo = battletime + 130;
            mob:setLocalVar("Buff2",bufftwo);
        end
    else
        if (battletime > buffone) then
            printf("Try to Cast Victory march");
            mob:castSpell(397, mob);  -- Valor Minuet IV
            buffone = battletime + 130;
            mob:setLocalVar("Buff1",buffone);
        elseif (battletime > bufftwo) then
            mob:castSpell(396, mob);  -- Valor Minuet III
            bufftwo = battletime + 130;
            mob:setLocalVar("Buff2",bufftwo);
        end
    end

    if (prishehp <= hp and twohour == 1) then
        mob:useMobAbility(696);
        mob:setLocalVar("TwoHour", 0);
    end



end;

function onSpellPrecast(mob, spell)
    if (spell:getID() == 423) then
        spell:setAoE(dsp.magic.aoe.RADIAL);
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
        spell:setRadius(60)
    elseif (spell:getID() == 420) then
        spell:setAoE(dsp.magic.aoe.RADIAL);
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
        spell:setRadius(60);
    elseif (spell:getID() == 419) then
        spell:setAoE(dsp.magic.aoe.RADIAL);
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
        spell:setRadius(60);
    elseif (spell:getID() == 397) then
        spell:setAoE(dsp.magic.aoe.RADIAL);
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
        spell:setRadius(60);
    elseif (spell:getID() == 396) then
        spell:setAoE(dsp.magic.aoe.RADIAL);
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
        spell:setRadius(60);
    elseif (spell:getID() == 376) then
        spell:setAoE(dsp.magic.aoe.RADIAL);
        spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
        spell:setRadius(60);
    end
end;

function onMonsterMagicPrepare(caster, target)


end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player,isKiller)
end;