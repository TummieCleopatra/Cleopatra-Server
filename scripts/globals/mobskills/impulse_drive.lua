---------------------------------------------
--  Penta Thrust
--
--
--  Type: Physical
--  Range: Melee
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local basemod = 1
    local numhits = 2
	local attmod = 1
    local accmod = 1
	local str_wsc = 0.50
	local dex_wsc = 0
	local agi_wsc = 0
	local vit_wsc = 0
	local mnd_wsc = 0


	local info = TrustPhysicalMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_VARIES,2.0,3.5,4.0)

    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)

    target:delHP(dmg)

    return dmg

end