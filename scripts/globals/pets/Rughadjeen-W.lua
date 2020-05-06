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
    local angle = getAngle(mob)
    local wsCooldown = 4

	local master = mob:getMaster()

    local berserkCooldown = 300

    mob:setLocalVar("berserkTime",0)
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

    mob:addListener("COMBAT_TICK", "RUGHADJEEN_BERSERK_TICK", function(mob, player, target)
        local battletime = os.time()
        local berserk = mob:getLocalVar("berserkTime")
        if ((battletime > berserk + berserkCooldown) and lvl >= 50 and mob:getTP() >= 800) then
            mob:useJobAbility(15, target)
            mob:setLocalVar("berserkTime",battletime)
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

