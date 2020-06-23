-------------------------------------------------
--  TRUST: Naji
--  Magic: None
--  JA: Provoke
--  WS: Burning Blade, Red Lotus Blade, Vorpal Blade
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)


    doDualWield(mob)
    local weaponskill = 0
    local naji = mob:getID()
    local lvl = mob:getMainLvl()
    local angle = getAngle(mob)
    local utsuIchiCooldown = 30
    local utsuNiCooldown = 45
    local wsCooldown = 4
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("provokeTime",0)
    mob:setLocalVar("provokeCooldown",30)
    mob:setLocalVar("berserkTime",0)
    mob:setLocalVar("berserkCooldown",300)
    mob:setLocalVar("aggresorTime",0)
    mob:setLocalVar("aggresorCooldown",300)
    mob:setLocalVar("utsuIchiTime",0)
    mob:setLocalVar("utsuNiTime",0)
    mob:setLocalVar("tomahawkTime",0)
    local tomahawkCooldown = 300
    set1HStats(mob)
    najiTrustPoints(mob)

    mob:addListener("COMBAT_TICK", "NAJI_COMBAT_TICK", function(mob, player, target)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        trustMeleeMove(mob, player, target, angle)
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
            local targ = mob:getTarget()
            weaponskill = doWeaponskill(mob)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "NAJI_PROVOKE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
        local battletime = os.time()
        local provoke = mob:getLocalVar("provokeTime")
        local provokeCooldown = mob:getLocalVar("provokeCooldown")
        if ((battletime > provoke + provokeCooldown) and target:isAlive() and target:getTarget() ~= mob) then  -- Only provoke when the mob turns attention to player
            mob:useJobAbility(19, target)
            mob:setLocalVar("provokeTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "NAJI_BERSERK_TICK", function(mob, player, target)
        local battletime = os.time()
        local berserk = mob:getLocalVar("berserkTime")
        local berserkCooldown = mob:getLocalVar("berserkCooldown")
        if ((battletime > berserk + berserkCooldown) and lvl >= 25) then
            mob:useJobAbility(15, target)
            mob:setLocalVar("berserkTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "NAJI_AGGRESOR_TICK", function(mob, player, target)
        local battletime = os.time()
        local aggresor = mob:getLocalVar("aggresorTime")
        local aggresorCooldown = mob:getLocalVar("aggresorCooldown")
        if ((battletime > aggresor + aggresorCooldown) and lvl >= 45) then
            mob:useJobAbility(18, mob)
            mob:setLocalVar("aggresorTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "NAJI_UTSU_TICK", function(mob, player, target)
        doUtsusemi(mob, player, target)
    end)

    mob:addListener("COMBAT_TICK", "NAJI_TOMA_TICK", function(mob, player, target)
        local battletime = os.time()
        local mobfamily = target:getSystem()
        local tomahawk = mob:getLocalVar("tomahawkTime")
        if ((battletime > tomwahawk + tomwahawkCooldown) and lvl >= 75 and (mobfamily == 1 or mobfamily == 11) and (mob:getLocalVar("[TRUST]NAJI_TOMAWAHK") == 1) then
            mob:useJobAbility(134, target)
            mob:setLocalVar("tomahawkTime",battletime)
        end
    end)
end

function doWeaponskill(mob)
    local wsList = {{62,40}, {17,34}, {1,33}}
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