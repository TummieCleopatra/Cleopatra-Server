---------------------------------------------
--  Tachi: Enpi
--
--
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
    local basemod = 1
    local numhits = 1
	local attmod = 1
    local accmod = 1
	local str_wsc = 0.75
	local dex_wsc = 0
	local agi_wsc = 0
	local vit_wsc = 0
	local mnd_wsc = 0

	local info = TrustPhysicalMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_BONUS,0.5,1.5,2.5)

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,info.hitslanded)

    target:delHP(dmg)
    return dmg
end
