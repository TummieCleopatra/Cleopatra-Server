---------------------------------------------
-- Viper Bite
--
--
-- Type: Physical
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onMobSkillCheck(target,mob,skill)
    mob:messageBasic(dsp.msg.basic.READIES_WS, 0, 2894)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local basemod = 1
    local numhits = 1
	local attmod = 1.5
    local accmod = 1
	local str_wsc = 0
	local dex_wsc = 0.80
	local agi_wsc = 0
	local vit_wsc = 0
	local mnd_wsc = 0


	local info = TrustPhysicalMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_VARIES,4.0,5.0,6.0)

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)

    target:delHP(dmg)



    return dmg
end
