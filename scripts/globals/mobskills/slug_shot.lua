---------------------------------------------------
-- Ranged Attack
-- Deals a ranged attack to a single target.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/trust_utils")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 20

    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,2,3,4)

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.RANGED,dsp.damageType.PIERCING,info.hitslanded)

    if (mob:getObjType() == dsp.objType.TRUST) then
        if (mob:getSubJob() == dsp.job.SAM) then
            if (dmg > 0) then
                target:addTP(20)
                mob:addTP(175)
            end
        else
            if (dmg > 0) then
                target:addTP(20)
                mob:addTP(150)
            end
        end
    else
        if (dmg > 0) then
            target:addTP(20)
            mob:addTP(150)
        end
    end


    target:takeDamage(dmg, mob, dsp.attackType.RANGED, dsp.damageType.PIERCING)
    return dmg
end
