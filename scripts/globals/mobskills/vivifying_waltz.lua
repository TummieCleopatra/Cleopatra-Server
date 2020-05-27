---------------------------------------------
-- Magic Fruit
--
-- Description: Restores HP for the target party member.
-- Type: Magical (Light)
--
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local potency = skill:getParam()
    local vit = target:getStat(dsp.mod.VIT)
    local chr = mob:getStat(dsp.mod.CHR)
    local lvl = mob:getMainLvl()


    local heal = math.floor((chr + vit) * 0.75) + (lvl * 3) + 60

    -- skill:setMsg(dsp.msg.basic.SELF_HEAL)
    skill:setMsg(dsp.msg.basic.AOE_HP_RECOVERY)

    printf("Heal is %u",heal)

    -- return MobHealMove(mob, heal)
    target:restoreHP(heal)
    target:wakeUp()
    mob:updateEnmityFromCure(target,heal/3)
    --return heal
    -- return MobHealMove(mob, mob:getMaxHP() * potency / 100)
    return MobHealMove(target, heal)
end
