-------------------------------------------------
--  TRUST: Najelith
--  Subjob: Ninja
--  JA: Sharpshot, Barrage, Velicity Shot
--  Spells: Utsusem:Ichi, Utsusemi: Ni
--  WS: Double Thrust, Leg Sweep, Penta Thrust
--  Notes:  Doesn't give a damn about enmity
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hpp = mob:getHPP()
    local weaponskill = 0
	local rangedAttackCooldown = 11
	local sharpShotCooldown = 300
    local barrageCooldown = 300
    local velocityShotCooldown = 300
    local utsuIchiCooldown = 30
    local utsuNiCooldown = 45
    local wsCooldown = 4
    local angle = getAngle(mob)
	local master = mob:getMaster()
	local najelith = mob:getID()
    set1HStats(mob)
    local racc = mob:getRACC()
    local distanceCooldown = 6

	mob:setLocalVar("rangedAttackTime",0)
	mob:setLocalVar("sharpShotTime",0)
	mob:setLocalVar("barrageTime",0)
	mob:setLocalVar("veloctiyShotTime",0)
    mob:setLocalVar("utsuIchiTime",0)
    mob:setLocalVar("utsuNiTime",0)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("distanceTime",0)

    mob:addListener("COMBAT_TICK", "NAJELITH_DISTANCE_TICK", function(mob, player, target)
        local battletime = os.time()
        local distanceTime = mob:getLocalVar("distanceTime")
        local enmity = enmityCalc(mob, player, target)
        if ((battletime > distanceTime + distanceCooldown) and enmity ~= 0) then
            trustRangedMove(mob, player, target, angle)
            mob:setLocalVar("disatnceTime",os.time())
        end
    end)

    mob:addListener("COMBAT_TICK", "NAJELITH_UTSU_TICK", function(mob, player, target)
        local battletime = os.time()
        local utsuIchi = mob:getLocalVar("utsuIchiTime")
        local utsuNi = mob:getLocalVar("utsuNiTime")
        local shadows = mob:getStatusEffect(dsp.effect.COPY_IMAGE)
        local count = 0
        if (shadows ~= nil) then
            count = shadows:getPower()
        else
            count = 0
        end

        if ((battletime > utsuNi + utsuNiCooldown) and lvl >= 74 and (count == nil or count <= 1)) then
            mob:castSpell(339, mob)
            mob:setLocalVar("utsuNiTime",battletime)
        elseif ((battletime > utsuIchi + utsuIchiCooldown) and lvl >= 24 and (count == nil)) then
            mob:castSpell(338, mob)
            mob:setLocalVar("utsuIchiTime",battletime)
        end
    end)

	mob:addListener("COMBAT_TICK", "NAJELITH_RA_TICK", function(mob, player, target)
	    local battletime = os.time()
		local rangedAttackTime = mob:getLocalVar("rangedAttackTime")
        local distance = mob:checkDistance(target)
        if ((battletime > rangedAttackTime + rangedAttackCooldown) and distance > 9.9) then
		    mob:useMobAbility(1202, target)
			mob:setLocalVar("rangedAttackTime",battletime)
            if (mob:hasStatusEffect(dsp.effect.VELOCITY_SHOT)) then
                rangedAttackCooldown = math.floor(rangedAttackCooldown * 0.85)
            else
                rangedAttackCooldown = 7
            end
        end
	end)

	mob:addListener("COMBAT_TICK", "NAJELITH_BARRAGE_TICK", function(mob, player, target)
	    local battletime = os.time()
		local barrageTime = mob:getLocalVar("barrageTime")
        if (lvl >= 30 and mob:getTP() >= 100) then
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


	mob:addListener("COMBAT_TICK", "NAJELITH_COMBAT_TICK", function(mob, target)
        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
	    if (mob:getTP() > 1000 and (battletime > weaponSkillTime + wsCooldown)) then
		    weaponskill = doNajelithWeaponskill(mob)
            mob:setLocalVar("WS_TP",mob:getTP())
			mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
		end
	end)


end

function doNajelithWeaponskill(mob)
	local lvl = mob:getMainLvl()
    local wsList = {{75,2136}, {55,196}, {13,193}, {1,192}}
    local newWsList = {}
    local maxws = 0
    if (lvl < 55) then
	    maxws = 2 -- Maximum number of weaponskills to choose from randomly
    elseif (lvl < 75) then
        maxws = 1
    elseif (lvl == 75) then
        maxws = 2
    end
	local wscount = 0

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
    -- print(finalWS)
	return finalWS
end