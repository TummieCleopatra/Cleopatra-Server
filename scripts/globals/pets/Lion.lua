-------------------------------------------------
--  TRUST: Lion
--  Magic: None
--  JA: Provoke
--  WS: Burning Blade, Red Lotus Blade, Vorpal Blade
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)

    lionTrustPoints(mob)
    local weaponskill = 0
    local lvl = mob:getMainLvl()
    local angle = getAngle(mob)
    local wsCooldown = 4
    mob:setLocalVar("wsTime",0)

    mob:addListener("COMBAT_TICK", "DISTANCE_TICK", function(mob, player, target)
	    trustMeleeMove(mob, player, target, angle)
    end)

    mob:addListener("COMBAT_TICK", "LION_COMBAT_TICK", function(mob, player, target)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
            local zeid = isZeidInParty(mob, player, target)
            local prishe = isPrisheInParty(mob, player, target)
            if (zeid == 1 and lvl >= 65) then
                local zeidTP = getZeidTP(mob, player, target)
                if (zeidTP <= 500) then -- don't wait
                    mob:useMobAbility(2894)
                elseif (zeidTP >= 1000) then
                    local weakness = getWeakness(mob, player, target)
                    if (weakness <= 4 and weakness ~= 0) then
                        mob:setLocalVar("WS_TP",mob:getTP())
                        mob:useMobAbility(2894)
                        mob:setLocalVar("lastWSTime",os.time())
                        mob:setLocalVar("lastWS",2894)
                    elseif (weakness > 4 and lvl >= 72) then
                        mob:setLocalVar("WS_TP",mob:getTP())
                        mob:useMobAbility(2892)
                        mob:setLocalVar("lastWSTime",os.time())
                        mob:setLocalVar("lastWS",2892)
                    else
                        mob:setLocalVar("WS_TP",mob:getTP())
                        mob:useMobAbility(2894)
                        mob:setLocalVar("lastWSTime",os.time())
                        mob:setLocalVar("lastWS",2894)
                    end
                end
                mob:setLocalVar("wsTime",battletime)
            elseif (prishe == 1 and lvl >= 65) then
                local battletime = os.time()
                local prisheTP, wsTime, prisheLastWS = getPrisheTP(mob, player, target)
                if (prisheTP <= 200 and (battletime > wsTime + 8)) then
                    mob:setLocalVar("WS_TP",mob:getTP())
                    mob:useMobAbility(2894)
                    mob:setLocalVar("wsTime",battletime)
                end
            else
                weaponskill = doLionWeaponskill(mob)
                mob:setLocalVar("WS_TP",mob:getTP())
                mob:useMobAbility(weaponskill)
                mob:setLocalVar("wsTime",battletime)
            end
        end
    end)

end


function doLionWeaponskill(mob)
    local wsList = {{72,2892},{65,2894}, {45,2893}, {1,2891}}
    local newWsList = {}
    local lvl = mob:getMainLvl()
    local maxws = 2 -- Maximum number of weaponskills to choose from randomly
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
    return finalWS
end