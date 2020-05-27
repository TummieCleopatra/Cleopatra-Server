---------------------------------------------------
-- Dark Shot
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 2, dsp.magic.ele.DARK, dmgmod,TP_NO_EFFECT, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.MAGICAL, dsp.damageType.DARK, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.DARK)

    local duration = math.random(50,60)

    local effects = {}
    local bio = target:getStatusEffect(dsp.effect.BIO)
    if bio ~= nil then
        table.insert(effects, bio)
    end
    local blind = target:getStatusEffect(dsp.effect.BLINDNESS)
    if blind ~= nil then
        table.insert(effects, blind)
    end
    local threnody = target:getStatusEffect(dsp.effect.THRENODY)
    if threnody ~= nil and threnody:getSubPower() == dsp.mod.LIGHTRES then
        table.insert(effects, threnody)
    end

    if #effects > 0 then
        local effect = effects[math.random(#effects)]
        local duration = effect:getDuration()
        local startTime = effect:getStartTime()
        local tick = effect:getTick()
        local power = effect:getPower()
        local subpower = effect:getSubPower()
        local tier = effect:getTier()
        local effectId = effect:getType()
        local subId = effect:getSubType()
        power = power * 1.5
        subpower = subpower * 1.5
        target:delStatusEffectSilent(effectId)
        target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier)
        local newEffect = target:getStatusEffect(effectId)
        newEffect:setStartTime(startTime)
    end

    return dmg
end
