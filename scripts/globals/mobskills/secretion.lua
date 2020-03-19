---------------------------------------------
-- Secretion
--
-- Description: Enhances evasion.
-- Type: Enhancing
-- Utsusemi/Blink absorb: N/A
-- Range: Self
-- Notes: evasion increase.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.EVASION_BOOST

    skill:setMsg(MobBuffMove(mob, typeEffect, 25, 0, 60))
    if (mob:getMaster() ~= nil) then
        local master = mob:getMaster()
        master:addStatusEffect(typeEffect, 25, 0, 60)
    end
    return typeEffect
end
