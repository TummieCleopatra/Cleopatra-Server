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
    if (mob:getID() == 16974137) then
        local numhits = 1
        local accmod = 1
        local dmgmod = 2.5

        local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)

        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.RANGED,dsp.damageType.PIERCING,info.hitslanded)

        target:takeDamage(dmg, mob, dsp.attackType.RANGED, dsp.damageType.PIERCING)
        return dmg

	elseif (mob:getName() == "Najelith" or mob:getName() == "Najelith-W" or mob:getName() == "Najelith-N") then
        local basemod = 1
        local numhits = 1
        local attmod = 1
        local accmod = 3
        local str_wsc = 0
        local dex_wsc = 0
        local agi_wsc = 0
        local vit_wsc = 0
        local mnd_wsc = 0



        if (mob:hasStatusEffect(dsp.effect.BARRAGE)) then
            printf("Mob has Barrage do calculations now!!!")
            numhits = doBarrage(target, mob)
        end


    	local info = TrustPhysicalRangedMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_DMG_VARIES,1.0,1.0,1.0);

        if (mob:getID() == 17051905) then
            basemod = 0.8
            info = TrustPhysicalRangedMove(mob,target,skill,basemod,numhits,attmod,accmod,str_wsc,dex_wsc,agi_wsc,vit_wsc,mnd_wsc,TP_ACC_VARIES,5.0,5.0,5.0);
        end

        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)
        doRangedAttack(target, mob, numhits, dmg)

        target:delHP(dmg);
        if (mob:getLocalVar("MobFound") == 2) then
            local master = mob:getMaster()
            target:addEnmity(master, 0, 1)

        end
        mob:setLocalVar("Pull",0) -- Set for pulling
        return dmg;
    else

        local numhits = 1
        local accmod = 1
        local dmgmod = 0

        local info = MobRangedMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)

        local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.RANGED,dsp.damageType.PIERCING,info.hitslanded)

        target:takeDamage(dmg, mob, dsp.attackType.RANGED, dsp.damageType.PIERCING)
        return dmg
    end
end
