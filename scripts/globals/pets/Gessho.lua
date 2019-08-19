-------------------------------------------------
--  TRUST: Gessho
--  Magic: None
--  JA: Yonin and Provoke
--  WS: Hane Fubuki, Shibaraku
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/enmitycalc")
require("scripts/globals/trustpoints")

function onMobSpawn(mob)
    -- doGesshoTrustPoints(mob)
    local weaponskill = 0
    local yoninCooldown = 180
    local provokeCooldown = 30
    local warcryCooldown = 600
    local parryCooldown = 600
    local debuffCooldown = 12
    local utsuIchiCooldown = 30
    local utsusemiNiCooldown = 45
    local lvl = mob:getMainLvl()
    mob:setLocalVar("utsuIchiTime",0)
    mob:setLocalVar("utsuNiTime",0)
    mob:setLocalVar("yoninTime",0)
    mob:setLocalVar("provokeTime",0)
    mob:setLocalVar("debuffTime",os.time() + 10)
    mob:setLocalVar("warcryTime",os.time() + 13)
    mob:setLocalVar("parryTime",os.time() + 6)


    mob:addListener("COMBAT_TICK", "GESSHO_DISTANCE_TICK", function(mob, player, target)
        local distanceTime = mob:getLocalVar("distanceTime")
        local battletime = os.time()
        mob:moveToTarget()
         --    mob:setLocalVar("distanceTime", battletime)
        -- end
    end)

    mob:addListener("COMBAT_TICK", "GESSHO_COMBAT_TICK", function(mob)
        if (mob:getTP() > 1000) then
            local targ = mob:getTarget()
            weaponskill = doWeaponskill(mob)
            mob:useMobAbility(weaponskill)
        end
    end)

    mob:addListener("COMBAT_TICK", "GESSHO_PROVOKE_TICK", function(mob, player, target)
        local battletime = os.time()
        local provoke = mob:getLocalVar("provokeTime")
        if (battletime > provoke + provokeCooldown) then
            mob:useJobAbility(19, target)
            mob:setLocalVar("provokeTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "GESSHO_UTSU_TICK", function(mob, player, target)
        local battletime = os.time()
        local utsuIchi = mob:getLocalVar("utsuIchiTime")
        local utsuNi = mob:getLocalVar("utsuNiTime")
        local effect = target:getStatusEffect(dsp.effect.COPY_IMAGE)
        if ((battletime > utsuNi + utsuNiCooldown) and lvl >= 37 and (effect == nil or effect:getPower() <= 1)) then
            mob:castSpell(338, mob)
            mob:setLocalVar("utsuNiTime",battletime)
        elseif ((battletime > utsuIchi + utsuIchiCooldown) and lvl >= 12 and (effect == nil)) then
            mob:castSpell(339, mob)
            mob:setLocalVar("utsuIchiTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "GESSHO_YONIN_TICK", function(mob, player, target)
        local battletime = os.time()
        local yonin = mob:getLocalVar("yoninTime")
        if (battletime > yonin + yoninCooldown) then
            mob:useJobAbility(232, mob)
            mob:setLocalVar("yoninTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "GESSHO_DEBUFF_TICK", function(mob, player, target)
        local battletime = os.time()
        local debuffTime = mob:getLocalVar("debuffTime")
        if (battletime > debuffTime + debuffCooldown) then
            local spell = doDebuffGessho(mob, target)
            if (spell > 0 ) then
                mob:castSpell(spell, target)
            end
            mob:setLocalVar("debuffTime",battletime)
        end
    end)

end

function doWeaponskill(mob)
    local wsList = {{65,1936},{5,1998}}
    local newWsList = {}
    local lvl = mob:getMainLvl()
    local maxws = 2 -- Maximum number of weaponskills to choose from randomly
    local wscount = 0

    local finalWS = 0

    if (lvl >= 65) then
        maxws = 2
    else
        maxws = 1
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

function doDebuffGessho(mob, target)
    local kuraCooldown = 30
    local hojoCooldown = 30

    local battletime = os.time()
    local kuraTime = mob:getLocalVar("kuraTime")
    local hojoTime = mob:getLocalVar("hojoTime")
    local lvl = mob:getMainLvl()
    local debuff = 0

    if ((battletime > kuraTime + kuraCooldown) and not target:hasStatusEffect(dsp.effect.BLINDNESS) and lvl >= 19) then
        if (lvl >= 44) then
            debuff = 348
        else
            debuff = 347
        end
        mob:setLocalVar("kuraTime",battletime)
    elseif ((battletime > hojoTime + hojoCooldown) and not target:hasStatusEffect(dsp.effect.SLOW) and lvl >= 23) then
        if (lvl >= 48) then
            debuff = 345
        else
            debuff = 344
        end
        mob:setLocalVar("hojoTime",battletime)
    end

    return debuff
end


