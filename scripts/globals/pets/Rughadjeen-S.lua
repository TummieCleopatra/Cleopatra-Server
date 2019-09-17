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
	local weaponBashCooldown = 180
	local souleaterCooldown = 360
    local lastResortCooldown = 300
    local meditateCooldown = 300
    local hassoCooldown = 60
    local seiganCooldown = 60
    local thirdEyeCooldown = 30
    local drainCooldown = 60

	local master = mob:getMaster()
	local RUGHADJEEN = mob:getID()
    mob:setLocalVar("drainTimeRughadjeen",0)
	mob:setLocalVar("weaponBashTime",0)
	mob:setLocalVar("souleaterTime",0)
	mob:setLocalVar("lastResortTime",0)
    mob:setLocalVar("meditateTime",0)
    mob:setLocalVar("hassoTime",0)
    mob:setLocalVar("seiganTime",0)
    mob:setLocalVar("thirdEyeTime",0)


    mob:addListener("COMBAT_TICK", "DISTANCE_TICK", function(mob, player, target)


        mob:moveToTarget()
         --    mob:setLocalVar("distanceTime", battletime)
        -- end
    end)

    --[[
	mob:addListener("TRUST_COMBAT_TICK", "RUGHADJEEN_SOULEATER_TICK" .. RUGHADJEEN, function(mob, player, target)
	    local battletime = os.time()
		local souleaterTime = mob:getLocalVar("souleaterTime")

        if (lvl >= 30 and mob:getHPP() >= 90) then
		    if (battletime > souleaterTime + souleaterCooldown) then
		        mob:useJobAbility(33, mob)
			    mob:setLocalVar("souleaterTime",battletime)
		    end
        end
	end)]]--

	mob:addListener("TRUST_COMBAT_TICK", "RUGHADJEEN_LAST_RESORT_TICK", function(mob, player, target)
	    local battletime = os.time()
		local lastResortTime = mob:getLocalVar("lastResortTime")

        if (lvl >= 30) then
		    if (battletime > lastResortTime + lastResortCooldown) then
		        mob:useJobAbility(35, mob)
			    mob:setLocalVar("lastResortTime",battletime)
		    end
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


	mob:addListener("COMBAT_TICK", "RUGHADJEEN_COMBAT_TICK", function(mob, player, target)
	    if (mob:getTP() > 1000) then
		    weaponskill = doRughadjeenWeaponskill(mob)
			mob:useMobAbility(weaponskill)
        end
    end)

    mob:addListener("COMBAT_TICK", "RUGHADJEEN_DRAIN_TICK", function(mob, player, target)
        local battletime = os.time()
        local drainTime = mob:getLocalVar("rughadjeenDrainTime")
        local hp = mob:getHPP()
        if ((battletime > drainTime + drainCooldown) and hp < 40) then
            doRughadjeenDrain(mob, target)
        end
    end)

end

--[[
function onMobFight(mob, target)
    target:addListener("MAGIC_START", "RUGHADJEEN_BASH", function(mob, target, spell, action)
        if (spell:getID() >= 144 and spell:getID() <= 219) then
            if (battletime > weaponBash + weaponBashCooldown) then
                mob:useJobAbility(61, target)
                mob:setLocalVar("weaponBash",battletime)
            end
        end
    end)
end]]--

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

function doRughadjeenDrain(mob, target)
    local drainList = {{62,37,246},{10,21,245}}
    local lvl = mob:getMainLvl()
    local mp = mob:getMP()
    local battletime = os.time()

    for i = 1, #drainList do
        if (lvl >= drainList[i][1] and mp >= drainList[i][2]) then
            drain = drainList[i][3]
            if (drain > 0) then
                mob:castSpell(drain, target)
                mob:setLocalVar("drainTimeRughadjeen",battletime)
                break
            end
        end
    end
end