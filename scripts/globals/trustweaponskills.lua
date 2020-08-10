-- Contains all common weaponskill calculations including but not limited to:
-- fSTR
-- Alpha
-- Ratio -> cRatio
-- min/max cRatio
-- applications of fTP
-- applications of critical hits ('Critical hit rate varies with TP.')
-- applications of accuracy mods ('Accuracy varies with TP.')
-- applications of damage mods ('Damage varies with TP.')
-- performance of the actual WS (rand numbers, etc)

require("scripts/globals/magicburst")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/msg")



function doTrustPhysicalWeaponskill(mob, target, skill, tp, action, taChar, params)


    local criticalHit = false
    local bonusTP = 0
    if (params.bonusTP ~= nil) then
        bonusTP = params.bonusTP
    end

    printf("Bonus TP Param: %u",bonusTP)


    local multiHitfTP = false
    if (params.multiHitfTP ~= nil) then
        multiHitfTP = params.multiHitfTP
    end
    local bonusfTP = 0
    -- local bonusfTP, bonusacc = handleWSGorgetBelt(attacker)
    local bonusacc = mob:getMod(dsp.mod.WSACC)

    -- get fstr
    local fstr = fSTR(mob:getStat(dsp.mod.STR),target:getStat(dsp.mod.VIT),mob:getWeaponDmgRank())

    -- apply WSC
    local weaponDamage = mob:getWeaponDmg()
    local weaponType = mob:getWeaponSkillType(dsp.slot.MAIN)
    local damageType = mob:getWeaponDamageType(dsp.slot.MAIN)

    if weaponType == dsp.skill.HAND_TO_HAND or weaponType == dsp.skill.NONE then
        local h2hSkill = mob:getSkillLevel(1) * 0.11 + 3
        weaponDamage = mob:getWeaponDmg()

        if params.kick and mob:hasStatusEffect(dsp.effect.FOOTWORK) then
            weaponDamage = mob:getMod(dsp.mod.KICK_DMG) -- Use Kick damage if footwork is on
        end

        weaponDamage = weaponDamage + h2hSkill
    end

    local base = weaponDamage + fstr +
        (mob:getStat(dsp.mod.STR) * params.str_wsc + mob:getStat(dsp.mod.DEX) * params.dex_wsc +
         mob:getStat(dsp.mod.VIT) * params.vit_wsc + mob:getStat(dsp.mod.AGI) * params.agi_wsc +
         mob:getStat(dsp.mod.INT) * params.int_wsc + mob:getStat(dsp.mod.MND) * params.mnd_wsc +
         mob:getStat(dsp.mod.CHR) * params.chr_wsc) * getAlpha(mob:getMainLvl())

    -- Applying fTP multiplier
    local ftp = fTP(tp,params.ftp100,params.ftp200,params.ftp300) + bonusfTP

    local ignoredDef = 0
    if (params.ignoresDef == not nil and params.ignoresDef == true) then
        ignoredDef = calculatedIgnoredDef(tp, target:getStat(dsp.mod.DEF), params.ignored100, params.ignored200, params.ignored300)
        local targetDefense = target:getStat(dsp.mod.DEF)
    end

    -- get cratio min and max
    local cratio, ccritratio = cTrustMeleeRatio(mob, target, params, ignoredDef)
    local ccmin = 0
    local ccmax = 0
    local hasMightyStrikes = mob:hasStatusEffect(dsp.effect.MIGHTY_STRIKES)
    local isSneakValid = mob:hasStatusEffect(dsp.effect.SNEAK_ATTACK)
    if (isSneakValid and not (mob:isBehind(target) or mob:hasStatusEffect(dsp.effect.HIDE) or target:hasStatusEffect(dsp.effect.DOUBT))) then
        isSneakValid = false
    end
    mob:delStatusEffectsByFlag(dsp.effectFlag.DETECTABLE)
    mob:delStatusEffect(dsp.effect.SNEAK_ATTACK)
    local isTrickValid = taChar ~= nil

    local isAssassinValid = isTrickValid
    if (isAssassinValid and not mob:hasTrait(68)) then
        isAssassinValid = false
    end

    local critrate = 0
    local nativecrit = 0

    if (params.canCrit) then -- work out critical hit ratios, by +1ing
        critrate = fTP(tp,params.crit100,params.crit200,params.crit300)
        -- add on native crit hit rate (guesstimated, it actually follows an exponential curve)
        local flourisheffect = mob:getStatusEffect(dsp.effect.BUILDING_FLOURISH)
        if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
            critrate = critrate + (10 + flourisheffect:getSubPower()/2)/100
        end
        nativecrit = (mob:getStat(dsp.mod.DEX) - target:getStat(dsp.mod.AGI))*0.005; -- assumes +0.5% crit rate per 1 dDEX

        if (nativecrit > 0.2) then -- caps only apply to base rate, not merits and mods
            nativecrit = 0.2
        elseif (nativecrit < 0.05) then
            nativecrit = 0.05
        end

        nativecrit = nativecrit + (mob:getMod(dsp.mod.CRITHITRATE)/100) + mob:getMerit(dsp.merit.CRIT_HIT_RATE)/100 - target:getMerit(dsp.merit.ENEMY_CRIT_RATE)/100

        -- Handle Fencer


        -- Fix Fencer below based on mob name to check for dual wield or not
        --[[
        if mainEquip and not mainEquip:isTwoHanded() and not mainEquip:isHandToHand() then
            local subEquip = mob:getStorageItem(0, 0, dsp.slot.SUB)
            if subEquip == nil or subEquip:getSkillType() == dsp.skill.NONE or subEquip:isShield() then
                nativecrit = nativecrit + mob:getMod(dsp.mod.FENCER_CRITHITRATE) / 100
            end
        end]]--

        if (mob:hasStatusEffect(dsp.effect.INNIN) and mob:isBehind(target, 23)) then -- Innin acc boost attacker is behind target
            nativecrit = nativecrit + mob:getStatusEffect(dsp.effect.INNIN):getPower()
        end

        critrate = critrate + nativecrit
    end

    -- Applying pDIF
    local pdif = generatePdif (cratio[1], cratio[2], true)

    local missChance = math.random()
    local finaldmg = 0
    local hitrate = getTrustHitRate(mob,target,true,bonusacc)
    if (params.acc100~=0) then
        -- ACCURACY VARIES WITH TP, APPLIED TO ALL HITS.
        -- print("Accuracy varies with TP.")
        hr = accVariesWithTP(getTrustHitRate(mob,target,false,bonusacc),mob:getACC(),tp,params.acc100,params.acc200,params.acc300)
        hitrate = hr
    end

    local dmg = base * ftp
    print(base)
    print(ftp)
    print(dmg)
    local tpHitsLanded = 0
    local shadowsAbsorbed = 0
    if ((missChance <= hitrate or isSneakValid or isAssassinValid or math.random() < mob:getMod(dsp.mod.ZANSHIN)/100) and
            not target:hasStatusEffect(dsp.effect.PERFECT_DODGE) and not target:hasStatusEffect(dsp.effect.ALL_MISS) ) then
        if not shadowAbsorb(target) then
            if (params.canCrit or isSneakValid or isAssassinValid or hasMightyStrikes) then
                local critchance = math.random()
                if (critchance <= critrate or hasMightyStrikes or isSneakValid or isAssassinValid) then -- crit hit!
                    local cpdif = generatePdif (ccritratio[1], ccritratio[2], true)
                    finaldmg = dmg * cpdif
                    if (isSneakValid and mob:getMainJob() == dsp.job.THF) then -- have to add on DEX bonus if on THF main
                        finaldmg = finaldmg + (mob:getStat(dsp.mod.DEX) * (1 + mob:getMod(dsp.mod.SNEAK_ATK_DEX)/100) * ftp * cpdif) * ((100+(mob:getMod(dsp.mod.AUGMENTS_SA)))/100)
                    end
                    if (isTrickValid and mob:getMainJob() == dsp.job.THF) then
                        finaldmg = finaldmg + (mob:getStat(dsp.mod.AGI) * (1 + mob:getMod(dsp.mod.TRICK_ATK_AGI)/100) * ftp * cpdif) * ((100+(mob:getMod(dsp.mod.AUGMENTS_TA)))/100)
                    end
                else
                    finaldmg = dmg * pdif
                    if (isTrickValid and mob:getMainJob() == dsp.job.THF) then
                        finaldmg = finaldmg + (mob:getStat(dsp.mod.AGI) * (1 + mob:getMod(dsp.mod.TRICK_ATK_AGI)/100) * ftp * pdif) * ((100+(mob:getMod(dsp.mod.AUGMENTS_TA)))/100)
                    end
                end
            else
                finaldmg = dmg * pdif
                if (isTrickValid and mob:getMainJob() == dsp.job.THF) then
                    finaldmg = finaldmg + (mob:getStat(dsp.mod.AGI) * (1 + mob:getMod(dsp.mod.TRICK_ATK_AGI)/100) * ftp * pdif) * ((100+(mob:getMod(dsp.mod.AUGMENTS_TA)))/100)
                end
            end
            tpHitsLanded = 1
        else
            shadowsAbsorbed = shadowsAbsorbed + 1
        end
    end

    if not multiHitfTP then dmg = base end

    if ((mob:getOffhandDmg() ~= 0) and (mob:getOffhandDmg() > 0 or weaponType==dsp.skill.HAND_TO_HAND)) then

        local chance = math.random()
        if ((chance<=hitrate or math.random() < mob:getMod(dsp.mod.ZANSHIN)/100 or isSneakValid)
                and not target:hasStatusEffect(dsp.effect.PERFECT_DODGE) and not target:hasStatusEffect(dsp.effect.ALL_MISS) ) then -- it hit
            if not shadowAbsorb(target) then
                pdif = generatePdif (cratio[1], cratio[2], true)
                if (params.canCrit) then
                    critchance = math.random()
                    if (critchance <= nativecrit or hasMightyStrikes) then -- crit hit!
                        criticalHit = true
                        cpdif = generatePdif (ccritratio[1], ccritratio[2], true)
                        finaldmg = finaldmg + dmg * cpdif
                    else
                        finaldmg = finaldmg + dmg * pdif
                    end
                else
                    finaldmg = finaldmg + dmg * pdif
                end
                tpHitsLanded = tpHitsLanded + 1
            else
                shadowsAbsorbed = shadowsAbsorbed + 1
            end
        end
    end

    -- Store first hit bonus for use after other calcs are done..
    local firstHitBonus = ((finaldmg * mob:getMod(dsp.mod.ALL_WSDMG_FIRST_HIT))/100)

    local numHits = getMultiAttacks(mob, target, params.numHits)
    local extraHitsLanded = 0

    if (numHits > 1) then

        local hitsdone = 1
        while (hitsdone < numHits) do
            local chance = math.random()
            local targetHP = target:getHP()
            if ((chance<=hitrate or math.random() < mob:getMod(dsp.mod.ZANSHIN)/100) and
                    not target:hasStatusEffect(dsp.effect.PERFECT_DODGE) and not target:hasStatusEffect(dsp.effect.ALL_MISS) ) then  -- it hit
                if not shadowAbsorb(target) then
                    pdif = generatePdif (cratio[1], cratio[2], true)
                    if (params.canCrit) then
                        critchance = math.random()
                        if (critchance <= nativecrit or hasMightyStrikes) then -- crit hit!
                            criticalHit = true
                            cpdif = generatePdif (ccritratio[1], ccritratio[2], true)
                            finaldmg = finaldmg + dmg * cpdif
                        else
                            finaldmg = finaldmg + dmg * pdif
                        end
                    else
                        finaldmg = finaldmg + dmg * pdif
                    end
                    extraHitsLanded = extraHitsLanded + 1
                else
                    shadowsAbsorbed = shadowsAbsorbed + 1
                end
            end
            hitsdone = hitsdone + 1
            if (finaldmg > targetHP) then
                break
            end
        end
    end
    finaldmg = finaldmg + souleaterBonus(mob, (tpHitsLanded+extraHitsLanded))
    -- print("Landed " .. hitslanded .. "/" .. numHits .. " hits with hitrate " .. hitrate .. "!")


    -- DMG Bonus for any WS
    local bonusdmg = mob:getMod(dsp.mod.ALL_WSDMG_ALL_HITS)

    -- Ws Specific DMG Bonus
    --[[
    if (mob:getMod(dsp.mod.WEAPONSKILL_DAMAGE_BASE + wsID) > 0) then
        bonusdmg = bonusdmg + mob:getMod(dsp.mod.WEAPONSKILL_DAMAGE_BASE + wsID)
    end]]--

    -- Add in bonusdmg
    finaldmg = finaldmg * ((100 + bonusdmg)/100)
    finaldmg = finaldmg + firstHitBonus

    -- Check for reductions from PDT
    finaldmg = target:physicalDmgTaken(finaldmg, damageType)

    -- Check for reductions from phys resistances
    if (weaponType == dsp.skill.HAND_TO_HAND) then
        finaldmg = finaldmg * target:getMod(dsp.mod.HTHRES) / 1000
    elseif (weaponType == dsp.skill.DAGGER or weaponType == dsp.skill.POLEARM) then
        finaldmg = finaldmg * target:getMod(dsp.mod.PIERCERES) / 1000
    elseif (weaponType == dsp.skill.CLUB or weaponType == dsp.skill.STAFF) then
        finaldmg = finaldmg * target:getMod(dsp.mod.IMPACTRES) / 1000
    else
        finaldmg = finaldmg * target:getMod(dsp.mod.SLASHRES) / 1000
    end

    mob:delStatusEffectSilent(dsp.effect.BUILDING_FLOURISH)
    finaldmg = finaldmg * WEAPON_SKILL_POWER



    finaldmg = takeWeaponskillDamage(target, mob, skill, params, finaldmg, dsp.attackType.PHYSICAL, damageType, dsp.slot.MAIN, tpHitsLanded, extraHitsLanded, shadowsAbsorbed, bonusTP, action, taChar)

        print(finaldmg)
        printf("TP on WS is %u",tp)
    return finaldmg, criticalHit, tpHitsLanded, extraHitsLanded
end




function takeWeaponskillDamage(target, mob, skill, params, finaldmg, attackType, damageType, slot, tpHitsLanded, extraHitsLanded, shadowsAbsorbed, bonusTP, action, taChar)
--[[
    -- physical attack missed, skip rest
    if (skill:hasMissMsg()) then
        return 0;
    end

    --handle pd
    if ((target:hasStatusEffect(dsp.effect.PERFECT_DODGE) or target:hasStatusEffect(dsp.effect.ALL_MISS) )
            and attackType==dsp.attackType.PHYSICAL) then
        skill:setMsg(dsp.msg.basic.SKILL_MISS);
        return 0;
    end

    -- set message to damage
    -- this is for AoE because its only set once
    skill:setMsg(dsp.msg.basic.DAMAGE);

    if (attackType == dsp.attackType.PHYSICAL) then
        finaldmg = target:physicalDmgTaken(finaldmg, damageType);
    end]]--

    return finaldmg
end




function getTrustHitRate(mob,target,capHitRate,bonus)
    local flourisheffect = mob:getStatusEffect(dsp.effect.BUILDING_FLOURISH)
    if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
        mob:addMod(dsp.mod.ACC, 20 + flourisheffect:getSubPower())
    end
    local acc = mob:getACC()
    local eva = target:getEVA()
    if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
        mob:delMod(dsp.mod.ACC, 20 + flourisheffect:getSubPower())
    end
    if (bonus == nil) then
        bonus = 0
    end
    if (mob:hasStatusEffect(dsp.effect.INNIN) and mob:isBehind(target, 23)) then -- Innin acc boost if mob is behind target
        bonus = bonus + mob:getStatusEffect(dsp.effect.INNIN):getPower()
    end
    if (target:hasStatusEffect(dsp.effect.YONIN) and mob:isFacing(target, 23)) then -- Yonin evasion boost if mob is facing target
        bonus = bonus - target:getStatusEffect(dsp.effect.YONIN):getPower()
    end
    if (mob:hasTrait(76) and mob:isBehind(target, 23)) then --TRAIT_AMBUSH
        bonus = bonus + mob:getMerit(dsp.merit.AMBUSH)
    end

    acc = acc + bonus

    if (mob:getMainLvl() > target:getMainLvl()) then -- acc bonus!
        acc = acc + ((mob:getMainLvl()-target:getMainLvl())*4)
    elseif (mob:getMainLvl() < target:getMainLvl()) then -- acc penalty :(
        acc = acc - ((target:getMainLvl()-mob:getMainLvl())*4)
    end

    local hitdiff = 0
    local hitrate = 75
    if (acc>eva) then
    hitdiff = (acc-eva)/2
    end
    if (eva>acc) then
    hitdiff = ((-1)*(eva-acc))/2
    end

    hitrate = hitrate+hitdiff
    hitrate = hitrate/100


    -- Applying hitrate caps
    if (capHitRate) then -- this isn't capped for when acc varies with tp, as more penalties are due
        if (hitrate>0.95) then
            hitrate = 0.95
        end
        if (hitrate<0.2) then
            hitrate = 0.2
        end
    end
    return hitrate
end



-- Given the raw ratio value (atk/def) and levels, returns the cRatio (min then max)
function cTrustMeleeRatio(mob, defender, params, ignoredDef)
    local flourisheffect = mob:getStatusEffect(dsp.effect.BUILDING_FLOURISH)
    if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
        mob:addMod(dsp.mod.ATTP, 25 + flourisheffect:getSubPower() / 2)
    end
    local atkmulti = fTP(params.atk100, params.atk200, params.atk300)
    local cratio = (mob:getStat(dsp.mod.ATT) * atkmulti) / (defender:getStat(dsp.mod.DEF) - ignoredDef)
    local wType = mob:getWeaponSkillType(dsp.slot.MAIN)
    local baseCap = 2.25

    if (wType == dsp.skill.HAND_TO_HAND) then
        baseCap = 2.50
    elseif (wType == dsp.skillGREAT_SWORD or wType == dsp.skill.GREAT_AXE or wType == dsp.skill.SCYTHE or wType == dsp.skill.POLEARM) then
        baseCap = 2.75
    elseif(wType == dsp.skill.GREAT_KATANA) then
        baseCap = 2.35
    elseif (wType == dsp.skill.SCYTHE) then
        baseCap = 3.0
    end



    cratio = utils.clamp(cratio, 0, baseCap)
    if flourisheffect ~= nil and flourisheffect:getPower() > 1 then
        mob:delMod(dsp.mod.ATTP, 25 + flourisheffect:getSubPower() / 2)
    end
    local levelcor = 0
    if mob:getMainLvl() < defender:getMainLvl() then
        levelcor = 0.05 * (defender:getMainLvl() - mob:getMainLvl())
    end

    cratio = cratio - levelcor

    if cratio < 0 then
        cratio = 0
    end
    local pdifmin = 0
    local pdifmax = 0

    -- max

    if cratio < 0.5 then
        pdifmax = cratio + 0.5
    elseif cratio < 0.7 then
        pdifmax = 1
    elseif cratio < 1.2 then
        pdifmax = cratio + 0.3
    elseif cratio < 1.5 then
        pdifmax = cratio * 0.25 + cratio
    elseif cratio < 2.625 then
        pdifmax = cratio + 0.375
    else
        pdifmax = 3
    end
    -- min

    if cratio < 0.38 then
        pdifmin = 0
    elseif (cratio < 1.25) then
        pdifmin = cratio * 1176 / 1024 - 448 / 1024
    elseif cratio < 1.51 then
        pdifmin = 1
    elseif cratio < 2.44 then
        pdifmin = cratio * 1176 / 1024 - 775 / 1024
    else
        pdifmin = cratio - 0.375
    end

    local pdif = {}
    pdif[1] = pdifmin
    pdif[2] = pdifmax

    local pdifcrit = {}
    cratio = cratio + 1
    cratio = utils.clamp(cratio, 0, 3)

    -- printf("ratio: %f min: %f max %f\n", cratio, pdifmin, pdifmax)

    if cratio < 0.5 then
        pdifmax = cratio + 0.5
    elseif cratio < 0.7 then
        pdifmax = 1
    elseif (cratio < 1.2) then
        pdifmax = cratio + 0.3
    elseif cratio < 1.5 then
        pdifmax = cratio * 0.25 + cratio
    elseif cratio < 2.625 then
        pdifmax = cratio + 0.375
    else
        pdifmax = 3
    end
    -- min

    if cratio < 0.38 then
        pdifmin = 0
    elseif cratio < 1.25 then
        pdifmin = cratio * 1176 / 1024 - 448 / 1024
    elseif cratio < 1.51 then
        pdifmin = 1
    elseif cratio < 2.44 then
        pdifmin = cratio * 1176 / 1024 - 775 / 1024
    else
        pdifmin = cratio - 0.375
    end

    local critbonus = mob:getMod(dsp.mod.CRIT_DMG_INCREASE) - defender:getMod(dsp.mod.CRIT_DEF_BONUS)
    critbonus = utils.clamp(critbonus, 0, 100)
    pdifcrit[1] = pdifmin * (100 + critbonus) / 100
    pdifcrit[2] = pdifmax * (100 + critbonus) / 100

    return pdif, pdifcrit
end



function fTP(tp,ftp1,ftp2,ftp3)
    if (tp < 1000) then
        tp = 1000
    end
    if (tp >= 1000 and tp < 2000) then
        return ftp1 + ( ((ftp2-ftp1)/1000) * (tp-1000))
    elseif (tp >= 2000 and tp <= 3000) then
        -- generate a straight line between ftp2 and ftp3 and find point @ tp
        return ftp2 + ( ((ftp3-ftp2)/1000) * (tp-2000))
    else
        print("fTP error: TP value is not between 1000-3000!")
    end
    return 1; -- no ftp mod
end


function generatePdif (cratiomin, cratiomax, melee)
    local pdif = math.random(cratiomin*1000, cratiomax*1000) / 1000
    if (melee) then
        pdif = pdif * (math.random(100,105)/100)
    end
    return pdif
end



-- obtains alpha, used for working out WSC
function getAlpha(level)
    alpha = 1.00
    if (level <= 5) then
        alpha = 1.00
    elseif (level <= 11) then
        alpha = 0.99
    elseif (level <= 17) then
        alpha = 0.98
    elseif (level <= 23) then
        alpha = 0.97
    elseif (level <= 29) then
        alpha = 0.96
    elseif (level <= 35) then
        alpha = 0.95
    elseif (level <= 41) then
        alpha = 0.94
    elseif (level <= 47) then
        alpha = 0.93
    elseif (level <= 53) then
        alpha = 0.92
    elseif (level <= 59) then
        alpha = 0.91
    elseif (level <= 61) then
        alpha = 0.90
    elseif (level <= 63) then
        alpha = 0.89
    elseif (level <= 65) then
        alpha = 0.88
    elseif (level <= 67) then
        alpha = 0.87
    elseif (level <= 69) then
        alpha = 0.86
    elseif (level <= 71) then
        alpha = 0.85
    elseif (level <= 73) then
        alpha = 0.84
    elseif (level <= 75) then
        alpha = 0.83
    elseif (level < 99) then
        alpha = 0.85
    else
        alpha = 1; -- Retail has no alpha anymore!
    end
    return alpha
end