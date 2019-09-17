-------------------------------------------------
--  TRUST: Excenmille
--  Magic: Flash, Cure I - IV
--  JA: Sentinel
--  WS: Double Thrust, Leg Sweep, Penta Thrust
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trustpoints")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hpp = mob:getHPP()
    local weaponskill = 0
	local jumpCooldown = 60
	local highJumpCooldown = 120
    local superJumpCooldown = 180
    local berserkCooldown = 300

	local master = mob:getMaster()
	local excenmille = mob:getID()
	mob:setLocalVar("jumpTime",0)
	mob:setLocalVar("highJumpTime",0)
	mob:setLocalVar("superJumpTime",0)
    mob:setLocalVar("berserkTime",0)



	mob:addListener("TRUST_COMBAT_TICK", "EXCENMILLE_JUMP_TICK" .. excenmille, function(mob, player, target)
	    local battletime = os.time()
		local jumpTime = mob:getLocalVar("jumpTime")

        if (lvl >= 10 and mob:getTP() >= 300) then
		    if (battletime > jumpTime + jumpCooldown) then
		        mob:useJobAbility(50, target)
			    mob:setLocalVar("jumpTime",battletime)
		    end
        end
	end)

	mob:addListener("TRUST_COMBAT_TICK", "EXCENMILLE_HIGH_JUMP_TICK" .. excenmille, function(mob, player, target)
	    local battletime = os.time()
		local highJumpTime = mob:getLocalVar("highJumpTime")

        if (lvl >= 35 and mob:getTP() >= 500) then
		    if (battletime > highJumpTime + highJumpCooldown) then
		        mob:useJobAbility(51, target)
			    mob:setLocalVar("highJumpTime",battletime)
		    end
        end
	end)

	mob:addListener("TRUST_COMBAT_TICK", "EXCENMILLE_SUPER_JUMP_TICK" .. excenmille, function(mob, player, target)
	    local battletime = os.time()
		local superJumpTime = mob:getLocalVar("superJumpTime")

        if (lvl >= 50 and hpp <= 30) then
		    if (battletime > superJumpTime + superJumpCooldown) then
		        mob:useJobAbility(52, target)
			    mob:setLocalVar("superJumpTime",battletime)
		    end
        end
	end)

    mob:addListener("COMBAT_TICK", "EXCENMILLE_BERSERK_TICK", function(mob, player, target)
        local battletime = os.time()
        local berserk = mob:getLocalVar("berserkTime")
        if ((battletime > berserk + berserkCooldown) and lvl >= 50 and mob:getTP() >= 800) then
            mob:useJobAbility(15, target)
            mob:setLocalVar("berserkTime",battletime)
        end
    end)

	mob:addListener("TRUST_COMBAT_TICK", "EXCENMILLE_COMBAT_TICK" .. excenmille, function(mob, target)
	    if (mob:getTP() > 1000) then
		    weaponskill = doExcenmilleWeaponskill(mob)
			mob:useMobAbility(weaponskill)
		end
	end)

end

function doExcenmilleWeaponskill(mob)
    local wsList = {{65,119}, {60,118}, {117}, {49,116}, {40,115}, {1,112}}
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