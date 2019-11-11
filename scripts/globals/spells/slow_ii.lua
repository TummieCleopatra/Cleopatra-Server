-----------------------------------------
-- Spell: Slow II
-----------------------------------------
require("scripts/globals/magic")
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/utils")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local dMND = caster:getStat(dsp.mod.MND) - target:getStat(dsp.mod.MND)
    -- local merits = caster:getMerit(dsp.merit.SLOW_II)

    -- Lowest ~12.5%
    -- Highest ~35.1%
    local power = utils.clamp(math.floor(dMND * 226 / 15) + 2380, 1250, 3510)
    power = calculatePotency(power, spell:getSkillType(), caster, target)


    power = power + 5 - 1


    --Duration, including resistance.
    local duration = calculateDuration(180, spell:getSkillType(), spell:getSpellGroup(), caster, target)

    local params = {}
    params.diff = dMND
    params.skillType = dsp.skill.ENFEEBLING_MAGIC
    params.bonus = 10
    params.effect = dsp.effect.SLOW
    local resist = applyResistanceEffect(caster, target, spell, params)

    if resist >= 0.5 then --Do it!
        if target:addStatusEffect(params.effect, power, 0, duration * resist) then
            spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS)
        else
            spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
        end

    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST)
    end

    return params.effect
end