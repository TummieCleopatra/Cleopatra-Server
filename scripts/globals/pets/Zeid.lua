-------------------------------------------------
--  TRUST: Zeid
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
    local angle = getAngle(mob)

	local master = mob:getMaster()
	local ZEID = mob:getID()
    local wsCooldown = 4
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("drainTimeZeid",0)
	mob:setLocalVar("weaponBashTime",0)
	mob:setLocalVar("souleaterTime",0)
	mob:setLocalVar("lastResortTime",0)
    mob:setLocalVar("meditateTime",0)
    mob:setLocalVar("hassoTime",0)
    mob:setLocalVar("seiganTime",0)
    mob:setLocalVar("thirdEyeTime",0)


    mob:addListener("COMBAT_TICK", "DISTANCE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
    end)

    --[[
	mob:addListener("TRUST_COMBAT_TICK", "ZEID_SOULEATER_TICK" .. ZEID, function(mob, player, target)
	    local battletime = os.time()
		local souleaterTime = mob:getLocalVar("souleaterTime")

        if (lvl >= 30 and mob:getHPP() >= 90) then
		    if (battletime > souleaterTime + souleaterCooldown) then
		        mob:useJobAbility(33, mob)
			    mob:setLocalVar("souleaterTime",battletime)
		    end
        end
	end)]]--

	mob:addListener("TRUST_COMBAT_TICK", "ZEID_LAST_RESORT_TICK", function(mob, player, target)
	    local battletime = os.time()
		local lastResortTime = mob:getLocalVar("lastResortTime")

        if (lvl >= 30) then
		    if (battletime > lastResortTime + lastResortCooldown) then
		        mob:useJobAbility(35, mob)
			    mob:setLocalVar("lastResortTime",battletime)
		    end
        end
	end)


	mob:addListener("COMBAT_TICK", "ZEID_COMBAT_TICK", function(mob, player, target)
        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
	    if (mob:getTP() > 1000) then
            local lion = isLionInParty(mob, player, target)
            if (lion == 1 and lvl >= 65) then
                local battletime = os.time()
                local lionTP, wsTime, lionLastWS = getLionTP(mob, player, target)
                if (lionTP <= 200 and (battletime > wsTime + 8)) then
                    if (lionLastWS == 2894) then
                        mob:useMobAbility(55)
                    elseif (lionLastWS == 2892) then
                        mob:useMobAbility(56)
                    end
                end
            elseif (battletime > weaponSkillTime + wsCooldown) then
		        weaponskill = doZeidWeaponskill(mob)
			    mob:useMobAbility(weaponskill)
                mob:setLocalVar("wsTime",battletime)
            end
		end
	end)

    mob:addListener("COMBAT_TICK", "ZEID_DRAIN_TICK", function(mob, player, target)
        local battletime = os.time()
        local drainTime = mob:getLocalVar("zeidDrainTime")
        local hp = mob:getHPP()
        if ((battletime > drainTime + drainCooldown) and hp < 40) then
            doZeidDrain(mob, target)
        end
    end)

end

--[[
function onMobFight(mob, target)
    target:addListener("MAGIC_START", "ZEID_BASH", function(mob, target, spell, action)
        if (spell:getID() >= 144 and spell:getID() <= 219) then
            if (battletime > weaponBash + weaponBashCooldown) then
                mob:useJobAbility(61, target)
                mob:setLocalVar("weaponBash",battletime)
            end
        end
    end)
end]]--

function doZeidWeaponskill(mob)
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

function doZeidDrain(mob, target)
    local drainList = {{62,37,246},{10,21,245}}
    local lvl = mob:getMainLvl()
    local mp = mob:getMP()
    local battletime = os.time()

    for i = 1, #drainList do
        if (lvl >= drainList[i][1] and mp >= drainList[i][2]) then
            drain = drainList[i][3]
            if (drain > 0) then
                mob:castSpell(drain, target)
                mob:setLocalVar("drainTimeZeid",battletime)
                break
            end
        end
    end
end