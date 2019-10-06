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
    local dmgmod = 0

    if (mob:getObjType() == dsp.objType.TRUST) then
        if (mob:hasStatusEffect(dsp.effect.BARRAGE)) then
            printf("Mob has Barrage do calculations now!!!")
            numhits = doBarrage(target, mob)
        end

        dmgmod = 1.0
    else
        dmgmod = 1.5
    end


    local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.RANGED,dsp.damageType.PIERCING,info.hitslanded)

    if (mob:getObjType() == dsp.objType.TRUST) then
        doRangedAttack(target, mob, numhits, dmg)
    else
        if (dmg > 0) then
           target:addTP(20)
           mob:addTP(80)
        end
    end

    target:takeDamage(dmg, mob, dsp.attackType.RANGED, dsp.damageType.PIERCING)
    return dmg
end
