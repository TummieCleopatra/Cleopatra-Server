-------------------------------------------------
--  TRUST: Gadalar
--  Subjob: SAM
--  JA: None
--  WS: Slice, Shadown of Death, Vorpal Scythe
--      Guillotine,
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hp = mob:getHPP()
    local angle = getAngle(mob)
    local wsCooldown = 4
	local castCooldown = 20
    local meditateCooldown = 300
    local hassoCooldown = 60
    local seiganCooldown = 60
    local thirdEyeCooldown = 30

    mob:setLocalVar("castTime",0)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("meditateTime",0)
    mob:setLocalVar("hassoTime",0)
    mob:setLocalVar("seiganTime",0)
    mob:setLocalVar("thirdEyeTime",0)

    mob:addListener("COMBAT_TICK", "GADALAR_DISTANCE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
		    weaponskill = doGadalarWeaponskill(mob)
			mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
		end
    end)


	mob:addListener("COMBAT_TICK", "GADALAR_DISTANCE_TICK", function(mob, player, target)
	    local battletime = os.time()
		local castTime = mob:getLocalVar("castTime")
		if (mob:getTP() >= 300 and (battletime > castTime + castCooldown)) then
		    if (target:getHPP() >= 50) then
			    local spell = doGadalarLowSpells(mob)
			else
                local spell = doGadalarSpells(mob)
	        end

            if (spell > 0) then
                mob:castSpell(spell, target)
                mob:setLocalVar("castTime",battletime)
            end
        end
	end)


    mob:addListener("COMBAT_TICK", "GADALAR_MEDITATE_TICK", function(mob, player, target)
        local battletime = os.time()
        local meditate = mob:getLocalVar("meditateTime")
        if (lvl >= 60) then
            if ((battletime > meditate + meditateCooldown) mob:getTP() >= 400) then
                mob:useJobAbility(47, mob)
                mob:setLocalVar("meditateTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "GADALAR_HASSO_TICK", function(mob, player, target)
        local battletime = os.time()
        local hasso = mob:getLocalVar("hassoTime")
        if (lvl >= 50 and not mob:hasStatusEffect(dsp.effect.HASSO)) then
            if (battletime > hasso + hassoCooldown) then
                mob:useJobAbility(157, mob)
                mob:setLocalVar("hassoTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "GADALAR_SEIGAN_TICK", function(mob, player, target)
        local battletime = os.time()
        local seigan = mob:getLocalVar("seiganTime")
        local enmity = enmityCalc(mob, player, target)
        if (lvl >= 50 and not mob:hasStatusEffect(dsp.effect.SEIGAN) and enmity == 0) then
            if (battletime > seigan + seiganCooldown) then
                mob:useJobAbility(158, mob)
                mob:setLocalVar("seiganTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "GADALAR_TE_TICK", function(mob, player, target)
        local battletime = os.time()
        local thirdEye = mob:getLocalVar("thirdEyeTime")
        local enmity = enmityCalc(mob, player, target)
        if (lvl >= 50 and mob:hasStatusEffect(dsp.effect.SEIGAN) and not mob:hasStatusEffect(dsp.effect.THIRD_EYE) and enmity == 0) then
            if (battletime > thirdEye + thirdEyeCooldown) then
                mob:useJobAbility(46, mob)
                mob:setLocalVar("thirdEyeTime",battletime)
            end
        end
    end)

end


function doGadalarLowSpells(mob)
    local spellList = {{73,146,63},{62,145,26},{38,144,7},{13,144,7}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local finalSpell = 0

    for i = 1, #spellList do
        if (lvl >= spellList[i][1] and mp >= spellList[i][3]) then
            finalSpell = spellList[i][2]
            break
        end
    end

    return finalSpell
end

function doGadalarSpells(mob)
    local spellList = {{73,147,135},{62,146,63},{38,145,26},{13,144,7}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local finalSpell = 0

    for i = 1, #spellList do
        if (lvl >= spellList[i][1] and mp >= spellList[i][3]) then
            finalSpell = spellList[i][2]
            break
        end
    end

    return finalSpell
end



