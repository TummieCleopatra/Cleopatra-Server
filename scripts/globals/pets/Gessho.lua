-------------------------------------------------
--  TRUST: Gessho
--  Magic: None
--  JA: Yonin and Provoke
--  WS: Hane Fubuki, Shibaraku
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    -- doGesshoTrustPoints(mob)
    local weaponskill = 0
    local yoninCooldown = 180
    local provokeCooldown = 30
    local warcryCooldown = 600
    local parryCooldown = 600
    local debuffCooldown = 12
    local utsuIchiCooldown = 30
    local utsuNiCooldown = 45
    local lvl = mob:getMainLvl()
    local wsCooldown = 4
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("utsuIchiTime",0)
    mob:setLocalVar("utsuNiTime",0)
    mob:setLocalVar("yoninTime",0)
    mob:setLocalVar("provokeTime",0)
    mob:setLocalVar("debuffTime",os.time() + 10)
    mob:setLocalVar("warcryTime",os.time() + 13)
    mob:setLocalVar("parryTime",os.time() + 6)

    set1HStats(mob)
    mob:addListener("COMBAT_TICK", "GESSHO_DISTANCE_TICK", function(mob, player, target)
        trustTankMove(mob, player, target)
    end)

    mob:addListener("COMBAT_TICK", "GESSHO_COMBAT_TICK", function(mob)
        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown) and not mob:hasPreventActionEffect()) then
            local targ = mob:getTarget()
            weaponskill = doWeaponskill(mob)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
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

    mob:addListener("COMBAT_TICK", "GESHO_UTSU_TICK", function(mob, player, target)
        local battletime = os.time()
        local utsuIchi = mob:getLocalVar("utsuIchiTime")
        local utsuNi = mob:getLocalVar("utsuNiTime")
        local count = mob:getMod(dsp.mod.UTSUSEMI)
        printf("Current Shadows %u",count)


        if ((battletime > utsuNi + utsuNiCooldown) and lvl >= 37 and (count == nil or count <= 1)) then
            mob:castSpell(339, mob)
            mob:setLocalVar("utsuNiTime",battletime)
        elseif ((battletime > utsuIchi + utsuIchiCooldown) and lvl >= 12 and (count == nil or count == 0)) then
            mob:castSpell(338, mob)
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


