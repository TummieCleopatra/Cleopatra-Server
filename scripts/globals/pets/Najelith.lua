-------------------------------------------------
--  TRUST: Najelith
--  Magic: Flash, Cure I - IV
--  JA: Sentinel
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
	local rangedAttackCooldown = 12
	local sharpShotCooldown = 300
    local barrageCooldown = 300
    local velocityShotCooldown = 300

    local angle = getAngle(mob)
    local wsCooldown = 4
    local angle = getAngle(mob)
	local master = mob:getMaster()
	local najelith = mob:getID()
	mob:setLocalVar("rangedAttackTime",0)
	mob:setLocalVar("sharpShotTime",0)
	mob:setLocalVar("barrageTime",0)
	mob:setLocalVar("veloctiyShotTime",0)

    mob:addListener("COMBAT_TICK", "NAJELITH_DISTANCE_TICK", function(mob, player, target)
        trustMageMove(mob, player, target, angle)
    end)

	mob:addListener("COMBAT_TICK", "NAJELITH_RA_TICK", function(mob, player, target)
	    local battletime = os.time()
		local rangedAttackTime = mob:getLocalVar("rangedAttackTime")
        if (battletime > rangedAttackTime + rangedAttackCooldown) then
		    mob:useMobAbility(1202, target)
			mob:setLocalVar("rangedAttackTime",battletime)
            if (mob:hasStatusEffect(dsp.effect.VELOCITY_SHOT)) then
                rangedAttackCooldown = math.floor(rangedAttackCooldown * 0.85)
            else
                rangedAttackCooldown = 9
            end
		end
    end)


	mob:addListener("COMBAT_TICK", "NAJELITH_BARRAGE_TICK", function(mob, player, target)
	    local battletime = os.time()
		local barrageTime = mob:getLocalVar("barrageTime")
        local enmity = enmityCalc(mob, player, target)
        if (lvl >= 30 and enmity >= 500 and mob:getTP() >= 400) then
            if (battletime > barrageTime + barrageCooldown) then
		        mob:useJobAbility(44, target)
			    mob:setLocalVar("barrageTime",battletime)
		    end
        end
	end)

	mob:addListener("COMBAT_TICK", "NAJELITH_SHARPSHOT_TICK", function(mob, player, target)
	    local battletime = os.time()
		local sharpShotTime = mob:getLocalVar("sharpShotTime")
        local racc = mob:getRACC()
        local eva = target:getEVA()
        local dif = math.floor(eva - racc)
        if (dif > 10) then
            if (battletime > sharpShotTime + sharpShotCooldown) then
		        mob:useJobAbility(43, target)
			    mob:setLocalVar("sharpShotTime",battletime)
		    end
        end
	end)

	mob:addListener("COMBAT_TICK", "NAJELITH_VELOCITY_TICK", function(mob, player, target)
	    local battletime = os.time()
		local velocityShotTime = mob:getLocalVar("velocityShotTime")
        if (lvl >= 45 and not mob:hasStatusEffect(dsp.effect.VELOCITY_SHOT)) then
            if (battletime > velocityShotTime + velocityShotCooldown) then
		        mob:useJobAbility(208, target)
			    mob:setLocalVar("velocityShotTime",battletime)
		    end
        end
	end)


	mob:addListener("COMBAT_TICK", "NAJELITH_COMBAT_TICK", function(mob, player, target)
        local enmity = enmityCalc(mob, player, target)
		local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
	    if (mob:getTP() >= 1000 and enmity >= 300 and (battletime > weaponSkillTime + wsCooldown)) then
		    weaponskill = doNajelithWeaponskill(mob)
            mob:setLocalVar("WS_TP",mob:getTP())
			mob:useMobAbility(weaponskill)
			mob:setLocalVar("wsTime",battletime)
		end
	end)

end

function doNajelithWeaponskill(mob)
    local wsList = {{75,2136}, {65,198}, {55,196}, {13,193}, {1,192}}
    local newWsList = {}
	local maxws = 3 -- Maximum number of weaponskills to choose from randomly
	local wscount = 0
	local lvl = mob:getMainLvl()
	local finalWS = 0

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