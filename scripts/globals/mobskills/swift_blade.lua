---------------------------------------------
-- Swift Blade
--
-- Description: Delivers a three-hit attack. Accuracy varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: Shadow per hit
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(dsp.msg.basic.READIES_WS, 0, 41)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    if (mob:getName() == "Curilla") then
        local basemod = 1
        local numhits = 4
        local attmod = 1
        local accmod = 1
        local str_wsc = 0.50
        local dex_wsc = 0
        local agi_wsc = 0
        local vit_wsc = 0
        local mnd_wsc = 0.50

    	local info = TrustPhysicalMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_VARIES,1.0,2,3.5);

        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);


        target:delHP(dmg);
        return dmg;
    else
        local numhits = 3
        local accmod = 1
        local dmgmod = 2

        local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3)
        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,info.hitslanded)

        -- Around 700 damage from AA HM
        target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.SLASHING)
        return dmg
    end
end
