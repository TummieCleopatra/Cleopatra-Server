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

function onTrustWeaponSkill(target, mob, skill, taChar)

    local basemod = 1
    local numhits = 5
	local attmod = 1
    local accmod = 1
	local str_wsc = 0
	local dex_wsc = 0.4
	local agi_wsc = 0
	local vit_wsc = 0
	local mnd_wsc = 0.4


	local info = TrustPhysicalMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_ACC_VARIES,1.18,1.18,1.18)

    local dmg = TrustFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded,taChar)

    target:delHP(dmg)



    return dmg
end
