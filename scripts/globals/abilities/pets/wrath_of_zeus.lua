---------------------------------------------
-- Zantetsuken
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill, master)

    local dINT = math.floor(pet:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT))

    local level = pet:getMainLvl()
    local damage = 96 + (level * 16)
    damage = damage + (dINT * 3)
    damage = MobMagicalMove(pet,target,skill,damage,dsp.magic.ele.LIGHTNING,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, dsp.magic.ele.LIGHTNING)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,dsp.attackType.MAGICAL,dsp.damageType.LIGHTNING,1)

    master:setMP(0)

    target:takeDamage(damage, pet, dsp.attackType.MAGICAL, dsp.damageType.LIGHTNING)
    target:updateEnmityFromDamage(pet,damage)
    pet:setHP(0)
    -- local aflow = getAbility(14)
    -- local newRecast = 6000
    -- aflow:setRecast(newRecast)

    return damage
end
