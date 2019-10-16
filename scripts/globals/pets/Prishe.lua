-------------------------------------------------
--  TRUST: Prishe
--  Subjob: WHM
--  JA: Dodge, Focus, Chakra
--  WS: Combo, Raging Fists, Howling Fists, Dragon Kick
--      Meteoric Impact
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hp = mob:getHPP()
	local cureCooldown = 20
    doPrisheTrustPoints(mob)
    local angle = getAngle(mob)
    local wsCooldown = 4

    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("cureTime",0)

    mob:addListener("COMBAT_TICK", "PRISHE_DISTANCE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
            local lion = isLionInParty(mob, player, target)
            if (lion == 1 and lvl >= 65) then
                local lionTP = getLionTPPrishe(mob, player, target)
                if (lionTP <= 500) then -- don't wait
                    weaponskill = doPrisheWeaponskill(mob)
			        mob:useMobAbility(weaponskill)
                    mob:setLocalVar("wsTime",battletime)
                elseif (lionTP >= 1000) then
                    mob:useMobAbility(3236)
                    mob:setLocalVar("wsTime",battletime)
                end
            else
		        weaponskill = doPrisheWeaponskill(mob)
			    mob:useMobAbility(weaponskill)
                mob:setLocalVar("wsTime",battletime)
            end
		end
    end)

    mob:addListener("COMBAT_TICK", "PRISHE_CURE_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("cureTime")

        if (battletime > cureTime + cureCooldown) then
            local party = player:getParty()
            for _,member in ipairs(party) do
                if (member:getHPP() <= 40) then
                    local spell = doPrisheCure(mob)
                    if (spell > 0) then
                        mob:castSpell(spell, member)
                        mob:setLocalVar("cureTime",battletime)
                        break
                    end
                end
            end
            mob:setLocalVar("cureTime",battletime - 4)  -- If no member has low HP change global check to 8 seconds
        end
    end)



end

function doPrisheWeaponskill(mob)
    local wsList = {{70,3235}, {60,3236}, {1,3234}}
    local newWsList = {}
	local maxws = 2 -- Maximum number of weaponskills to choose from randomly
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

function doPrisheCure(mob)
    local cureList = {{42,46,3}, {22,24,2}, {1,8,1}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local cure = 0

    for i = 1, #cureList do
        if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
            cure = cureList[i][3]
            break
        end
    end

    return cure
end