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

    -- doNajiTrustPoints(mob)
    local weaponskill = 0
    local lvl = mob:getMainLvl()

    mob:addListener("COMBAT_TICK", "DISTANCE_TICK", function(mob, player, target)
        local distanceTime = mob:getLocalVar("distanceTime")
        local battletime = os.time()
        mob:moveToTarget()
         --    mob:setLocalVar("distanceTime", battletime)
        -- end
    end)

    mob:addListener("COMBAT_TICK", "LION_COMBAT_TICK", function(mob, player, target)
        if (mob:getTP() > 1000) then
            local zeid = isZeidInParty(mob, player, target)
            if (zeid == 1 and lvl >= 65) then
                local zeidTP = getZeidTP(mob, player, target)
                if (zeidTP <= 500) then -- don't wait
                    mob:useMobAbility(2894)
                elseif (zeidTP >= 1000) then
                    local weakness = getWeakness(mob, player, target)
                    if (weakness <= 4 and weakness ~= 0) then
                        mob:useMobAbility(2894)
                        mob:setLocalVar("lastWSTime",os.time())
                    elseif (weakness > 4) then
                        mob:useMobAbility(2892)
                        mob:setLocalVar("lastWSTime",os.time())
                    else
                        weaponskill = doLionWeaponskill(mob)
                        mob:useMobAbility(weaponskill)
                        mob:setLocalVar("lastWS",weaponskill)
                    end
                end
            else
                weaponskill = doLionWeaponskill(mob)
                mob:useMobAbility(weaponskill)
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