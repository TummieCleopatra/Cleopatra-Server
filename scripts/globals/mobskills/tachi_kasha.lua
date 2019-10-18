---------------------------------------------
--  Tachi: Kasha
--
--  Description:  Paralyzes target. Damage varies with TP.
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(dsp.msg.basic.READIES_WS, 0, 692+256)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
     if (mob:getName() == "Ayame" or mob:getName() == "Ayame-W") then
        local basemod = 1
        local numhits = 1
	    local attmod = 1.65
        local accmod = 1
	    local str_wsc = 0.75
	    local dex_wsc = 0
	    local agi_wsc = 0
	    local vit_wsc = 0
	    local mnd_wsc = 0

        local info = TrustPhysicalMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_VARIES,1.54,2.6,4.1)

        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,info.hitslanded)
        target:delHP(dmg);
        return dmg;
    else
        local numhits = 1
        local accmod = 1
        local dmgmod = 3.5
        local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1.56,1.88,2.50)
        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,info.hitslanded)

        MobStatusEffectMove(mob, target, dsp.effect.PARALYSIS, 25, 0, 60)

        -- About 400-500
        target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.SLASHING)
        return dmg
    end
end
