-------------------------------------------------
--  TRUST: Rughadjeen
--  Magic: Stun, Dread Spikes, Drain, Aspir
--  JA: Last Resort
--  WS: Double Thrust, Leg Sweep, Penta Thrust
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hpp = mob:getHPP()
    local weaponskill = 0

    local cureCooldown = 15
    local meditateCooldown = 300
    local hassoCooldown = 60
    local seiganCooldown = 60
    local thirdEyeCooldown = 30
    local angle = getAngle(mob)
    local wsCooldown = 4

	local master = mob:getMaster()

    mob:setLocalVar("meditateTime",0)
    mob:setLocalVar("hassoTime",0)
    mob:setLocalVar("seiganTime",0)
    mob:setLocalVar("thirdEyeTime",0)
    mob:setLocalVar("cureTimeRughadjeen",0)
    mob:setLocalVar("wsTime",0)

	mob:addListener("COMBAT_TICK", "RUGHADJEEN_COMBAT_TICK", function(mob, player, target)
	    trustMeleeMove(mob, player, target, angle)
        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
		    weaponskill = doRughadjeenWeaponskill(mob)
			mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "RUGHADJEEN_MEDITATE_TICK", function(mob, player, target)
        local battletime = os.time()
        local meditate = mob:getLocalVar("meditateTime")
        if (lvl >= 60) then
            if ((battletime > meditate + meditateCooldown) and mob:getTP() >= 400) then
                mob:useJobAbility(47, mob)
                mob:setLocalVar("meditateTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "RUGHADJEEN_HASSO_TICK", function(mob, player, target)
        local battletime = os.time()
        local hasso = mob:getLocalVar("hassoTime")
        if (lvl >= 50 and not mob:hasStatusEffect(dsp.effect.HASSO)) then
            if (battletime > hasso + hassoCooldown) then
                mob:useJobAbility(157, mob)
                mob:setLocalVar("hassoTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "RUGHADJEEN_SEIGAN_TICK", function(mob, player, target)
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

    mob:addListener("COMBAT_TICK", "RUGHADJEEN_TE_TICK", function(mob, player, target)
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

    mob:addListener("COMBAT_TICK", "RUGHADJEEN_CURE_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("cureTimeRughadjeen")
        if (battletime > cureTime + cureCooldown) then
            doRughadjeenCure(mob, player, target)
        end
    end)

end


function doRughadjeenWeaponskill(mob)
    -- Ground Strike only when Lion is in the party
    local wsList = {{72,56}, {65,55}, {60,54}, {55,53}, {10,49}, {1,48}}
    local newWsList = {}
	local maxws = 3 -- Maximum number of weaponskills to choose from randomly
	local wscount = 0
	local lvl = mob:getMainLvl()
	local finalWS = 0

    if (lvl >= 72) then
        maxws = 2
    end

	for i = 1, #wsList do
		if (lvl >= wsList[i][1]) then
			table.insert(newWsList, wscount + 1, wsList[i][2])
			wscount = wscount + 1
			if (wscount >= maxws) then
				break
			end
		end
	end

	finalWS = newWsList[math.random(1,#newWsList)]
	return finalWS
end

function doRughadjeenCure(mob, player, target)
    local cureList = {{55,46,3}, {30,24,2}, {17,8,1}, {5,8,1}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local cure = 0
    local party = player:getPartyWithTrusts()
    local battletime = os.time()
    for _,member in ipairs(party) do
        if (member:getHPP() <= 35) then
            cure = doEmergencyCureCur(mob)
            if (cure > 0) then
                mob:castSpell(cure, member)
                mob:setLocalVar("cureTimeRughadjeen",battletime)
                break
            end
        elseif (member:getHPP() <= 76) then
            for i = 1, #cureList do
                if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
                    cure = cureList[i][3]
                    if (cure > 0) then
                        mob:castSpell(cure, member)
                        mob:setLocalVar("cureTimeRughadjeen",battletime)
                        break
                    end
                end
            end
        end
    end

    if (cure == 0) then
        mob:setLocalVar("cureTimeRughadjeen",battletime - 4)
    end

end

