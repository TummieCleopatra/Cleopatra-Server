-------------------------------------------------
--  TRUST: Nanaa Mihgo
--  Magic: None
--  JA: Sneak Attack, Trick Attack
--  WS: Wasp Sting, Shadow Stitch, Viper Bite,
--      Dancing Edge, Shark Bite, King Kobra Clamp
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    printf("spawned")
    local weaponskill = 0
    local wsCooldown = 4
    local sneakAttackCooldown = 60
    mob:setLocalVar("sneakAttackCooldown",60)
    nanaaTrustPoints(mob)
    mob:setLocalVar("distanceTime",0)
    mob:setLocalVar("saTime",0)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("berserkTime",0)


    mob:addListener("COMBAT_TICK", "NANAA_DISTANCE_TICK", function(mob, player, target)
        trustSneakAttackMove(mob, player, target)
    end)

    mob:addListener("COMBAT_TICK", "NANAA_SA_TICK", function(mob, player, target)
        doNanaaSa(mob, player, target)
    end)

    mob:addListener("COMBAT_TICK", "NANAA_BERSERK_TICK", function(mob, player, target)
        local battletime = os.time()
        local berserk = mob:getLocalVar("berserkTime")
        if ((battletime > berserk + berserkCooldown) and lvl >= 50 and mob:getTP() >= 800) then
            mob:useJobAbility(15, target)
            mob:setLocalVar("berserkTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "NANAA_COMBAT_TICK", function(mob, player, target)
        local lvl = mob:getMainLvl()
        local saTime = mob:getLocalVar("saTime")
        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        local enmity = enmityCalc(mob, player, target)
        if (lvl > 29) then
            if ((mob:getTP() >= 1000) and enmity ~= 0 and (battletime > saTime + sneakAttackCooldown) and (battletime > weaponSkillTime + wsCooldown)) then
                printf("try weaponskill")
                weaponskill = doNanaaWeaponskill(mob)
                mob:useJobAbility(28)
                mob:useMobAbility(weaponskill)
                mob:setLocalVar("wsTime",battletime)
                mob:setLocalVar("saTime",battletime)
            end
        else
            if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
                local targ = mob:getTarget()
                weaponskill = doNanaaWeaponskill(mob)
                mob:useMobAbility(weaponskill)
                mob:setLocalVar("wsTime",battletime)
            end
        end
    end)


end

function doNanaaSa(mob, player, target)
    local saTime = mob:getLocalVar("saTime")
    local sneakAttackCooldown = 60
    local battletime = os.time()
    local trot = target:getRotPos()
    local mrot = mob:getRotPos()
    local drot = trot - mrot
    local tp = mob:getTP()
    local enmity = enmityCalc(mob, player, target)
    if (((drot > 118 and drot < 135) or (drot > 250) or (drot < 5)) and enmity ~= 0) then
        if (tp < 40) then
            if (battletime > saTime + sneakAttackCooldown) then
                mob:useJobAbility(28)
                printf("Sneak Attack")
                mob:setLocalVar("saTime",os.time())
            end
        end
    end
end

function doNanaaWeaponskill(mob)
    local lvl = mob:getMainLvl()
    local wsList = {}
    local newWsList = {}
    if (lvl > 32) then
        wsList = {{65,24},{60,23},{33,17}}
    else
        wsList = {{23,18},{1,16}}
    end

    local maxws = 3 -- Maximum number of weaponskills to choose from randomly
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
    print(finalWS)
    return finalWS
end