-----------------------------------------
-- Spell: Katon: San
-- Deals fire damage to an enemy and lowers its resistance against water.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    --doNinjutsuNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
    local duration = 15 + caster:getMerit(dsp.merit.KATON_EFFECT) -- T1 bonus debuff duration
    local bonusAcc = 5
    local bonusMab = 5 -- T1 mag atk

    local params = {}

    params.dmg = 134

    params.multiplier = 1.5

    params.hasMultipleTargetReduction = false

    params.resistBonus = bonusAcc

    params.mabBonus = bonusMab

    dmg = doNinjutsuNuke(caster, target, spell, params)
    handleNinjutsuDebuff(caster,target,spell,30,duration,dsp.mod.WATERRES)

    return dmg
end