---------------------------------------------
--  Tachi: Enpi
--
--  Description:  Silences target. Damage varies with TP.
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(dsp.msg.basic.READIES_WS, 0, 691+256)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    -- local tp = mob:getLocalVar("WS_TP")
    local tp = 1000;

    local damage = (mob:getMainLvl() / 9) - 1
    local damagemod = damage * ((50+(tp*0.5))/100)

    mob:addMP(damagemod)

    skill:setMsg(dsp.msg.basic.SKILL_RECOVERS_MP)
    return damagemod
end
