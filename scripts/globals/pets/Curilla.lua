-------------------------------------------------
--  TRUST: Curilla
--  Magic: None
--  JA: Provoke
--  WS: Burning Blade, Red Lotus Blade, Vorpal Blade
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local master = mob:getMaster()
    local lvl = master:getMainLvl()
    local addDef = (lvl * 4) / 3
    mob:addMod(dsp.mod.DEF, addDef)

    local defense = mob:getStat(dsp.mod.DEF)

    mob:addStatusEffect(dsp.effect.MAX_MP_BOOST,60,0,0);


    mob:addMod(dsp.mod.CURE_POTENCY,38)
    curillaTrustPoints(mob)

    local weaponskill = 0
    local cureCooldown = 17
    local provokeCooldown = 30
    local reprisalCooldown = 0
    local sleepCooldown = 10
    local bashCooldown = 180
    local chivalryCooldown = 600
    local wsCooldown = 4
    local lvl = mob:getMainLvl()
    local enmity = math.floor(lvl / 3.9)
    mob:addMod(dsp.mod.ENMITY, enmity)
    plateArmor(mob)
    set1HStats(mob)
    mob:setLocalVar("protectTime",0)
    mob:setLocalVar("shellTime",0)
    mob:setLocalVar("cureCurilla",0)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("provokeTime",0)
    mob:setLocalVar("flashTime",0)
    mob:setLocalVar("flashCooldown",45)
    mob:setLocalVar("sentinelTime",0)
    mob:setLocalVar("sentinelCooldown",300)
    mob:setLocalVar("bashTime",0)
    mob:setLocalVar("chivalryTime",0)
    mob:setLocalVar("majestyTime",0)
    mob:setLocalVar("reprisalCooldown",180)
    mob:setLocalVar("castingSpell",0)
    mob:setLocalVar("sleepTime",0)
    mob:setLocalVar("chivalryCooldown",300)
    mob:setLocalVar("majestyCooldown",180)
    mob:addMP(550)
    mob:addHP(500)


    --[[
    mob:addListener("ROAM_TICK", "CUR_ROAM_TICK", function(mob)
        if (mob:hasStatusEffect(dsp.effect.HEALING) == false) then
            local level = mob:getMainLvl()
            local tick = 10 - math.ceil(math.max(0, level / 20))
            mob:addStatusEffectEx(dsp.effect.HEALING, 0, 0, tick, 0)
        end
    end)]]-- TODO: Make core changes to allow this to happen


    mob:addListener("COMBAT_TICK", "DISTANCE_TICK", function(mob, player, target)
        local battletime = mob:getBattleTime()
        local distance = mob:checkDistance(target)
        local size = target:getModelSize()
        if (battletime < 10 or distance > size + 2) then
            trustTankMove(mob, player, target)
        end
    end)

    mob:addListener("COMBAT_TICK", "PROVOKE_TICK", function(mob, player, target)
        local battletime = os.time()
        local provoke = mob:getLocalVar("provokeTime")
        if (battletime > provoke + provokeCooldown) then
            mob:useJobAbility(19, target)
            mob:setLocalVar("provokeTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "COMBAT_TICK", function(mob)
        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() > 1000 and (battletime > weaponSkillTime + wsCooldown)) then
            weaponskill = doCurillaWeaponskill(mob)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
            mob:updateHealth() -- used to prevent TP from holding?
        end
    end)




    mob:addListener("COMBAT_TICK", "SHIELD_BASH_TICK", function(mob, player, target)
        local battletime = os.time()
        local bashTime = mob:getLocalVar("bashTime")
        local act = target:getCurrentAction()


        if ((battletime > bashTime + bashCooldown) and (act == dsp.act.MOBABILITY_START or act == dsp.act.MOBABILITY_USING)) then
            mob:useJobAbility(30, target)
            printf("Bashing")
            print(bashTime)
            mob:setLocalVar("bashTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "CUR_FLASH_TICK", function(mob, player, target)
        local enmity = enmityCalc(mob, player, target)
        local battletime = os.time()
        local flashTime = mob:getLocalVar("flashTime")
        local flashCooldown = mob:getLocalVar("flashCooldown")
        if (enmity > 0 and (battletime > flashTime + flashCooldown)) then
            doCurillaFlash(mob, player, target)
            mob:setLocalVar("flashTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "CUR_REPRISAL_TICK", function(mob, player, target)
        local battletime = os.time()
        local reprisalTime = mob:getLocalVar("reprisalTime")
        local reprisalCooldown = mob:getLocalVar("reprisalCooldown")
        if ((battletime > reprisalTime + reprisalCooldown) and mob:getMainLvl() >= 61) then
            mob:castSpell(97, mob)
            mob:setLocalVar("reprisalTime",battletime)
            mob:setLocalVar("castingSpell",97)
        end
    end)

    mob:addListener("COMBAT_TICK", "CUR_PRO_TICK", function(mob, player, target)
        local battletime = os.time()
        local proTime = mob:getLocalVar("protectTime")
        local kupipi, mp = isKupipiInParty(mob, player, target)
        if (battletime > proTime + 30 and mob:hasStatusEffect(dsp.effect.PROTECT) == false and kupipi == 0) then
            doCurillaProtect(mob)
            mob:setLocalVar("protectTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "CUR_SHELL_TICK", function(mob, player, target)
        local battletime = os.time()
        local shellTime = mob:getLocalVar("shellTime")
        local kupipi, mp = isKupipiInParty(mob, player, target)
        if (battletime > shellTime + 30 and mob:hasStatusEffect(dsp.effect.SHELL) == false and kupipi == 0) then
            doCurillaShell(mob)
            mob:setLocalVar("shellTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "CUR_SENTINEL_TICK", function(mob, player, target)
        local battletime = os.time()
        local sentinelTime = mob:getLocalVar("sentinelTime")
        local sentinelCooldown = mob:getLocalVar("sentinelCooldown")
        if (battletime > sentinelTime + sentinelCooldown) then
            doCurillaSentinel(mob)
        end
    end)


    mob:addListener("COMBAT_TICK", "CUR_CURE_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("cureTime")
        local act = mob:getCurrentAction()


        if (act ~= dsp.act.MAGIC_CASTING) then
            mob:setLocalVar("cureCasting",0)  -- Set this to 0 to mean mob is not or is done casting cures
            -- printf("Done Casting, set cure to 0")
        end

        if (battletime > cureTime + cureCooldown) then
            local party = player:getPartyWithTrusts()
            for _,member in ipairs(party) do
                if (member:getHPP() <= 85) then
                    local spell, moreCure = doCureCurilla(mob, member)
                    if (spell > 0) then
                    -- local canCast = true
                        local canCast = checkDoubleCure(mob, member)
                        if (canCast == 1) then
                            -- printf("Set Cure Cast to 1")
                            mob:setLocalVar("cureCasting",moreCure) -- Sets the cure casting to what is needed
                            mob:castSpell(spell, member)
                            mob:setLocalVar("cureTime",battletime)
                            mob:setLocalVar("magicTime",battletime)
                            break
                        elseif (canCast > 0) then
                            -- See which spell is allowed
                            mob:castSpell(canCast, member)
                            mob:setLocalVar("cureTime",battletime)
                            mob:setLocalVar("magicTime",battletime)
                        end
                    end
                end
            end
            mob:setLocalVar("cureTime",battletime - 12)
        end
    end)


    mob:addListener("COMBAT_TICK", "CUR_CHIVALRY_TICK", function(mob, player, target)
        local battletime = os.time()
        local chivalryTime = mob:getLocalVar("chivalryTime")
        local chivalryCooldown = mob:getLocalVar("chivalryCooldown")
        local trustPointChivalry = mob:getLocalVar("[TRUST]CURILLA_CHIV")
        local mp = mob:getMP()
        local lvl = mob:getMainLvl()
        local maxmp = mob:getMaxMP()
        local dif = (mp / maxmp) * 100
        if (trustPointChivalry == 1 and lvl >= 75) then
            if ((battletime > chivalryTime + chivalryCooldown) and dif < 20) then
                mob:useJobAbility(142, mob)
                mob:setLocalVar("chivalryTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "CUR_MAJ_TICK", function(mob, player, target)
        local battletime = os.time()
        local majestyTime = mob:getLocalVar("majestyTime")
        local majestyCooldown = mob:getLocalVar("majestyCooldown")
        local trustPointMajesty = mob:getLocalVar("[TRUST]CURILLA_MAJ")
        if (trustPointMajesty == 1 and lvl >= 75) then
            if (battletime > majestyTime + majestyCooldown) then
                mob:useJobAbility(378, mob)
                mob:setLocalVar("majestyTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "CUR_SLEEP_TICK", function(mob, player, target)
        local battletime = os.time()
        local mp = mob:getMP()
        local sleepTime = mob:getLocalVar("sleepTime")
        local party = player:getPartyWithTrusts()
        if (battletime > sleepTime + sleepCooldown) then
            for i, member in ipairs(party) do
                if ((member:hasStatusEffect(dsp.effect.SLEEP_I)) and mp >= 8) then -- Check to see if there is a member in the party who is slept and is a WHM
                    if (member:getName() == "Kupipi" or member:getName() == "Kupipi-W" or member:getName() == "Kupipi-R" or member:getMainJob() == dsp.job.RDM or member:getMainJob() == dsp.job.WHM) then
                        mob:castSpell(1, member)
                        mob:setLocalVar("sleepTime",battletime)
                        break
                    end
                end
            end
        end
    end)

end



function doCurillaWeaponskill(mob)
    local wsList = {{65,41},{60,40}, {17,34}, {1,33}}
    local newWsList = {}
    local lvl = mob:getMainLvl()
    local maxws = 0 -- Maximum number of weaponskills to choose from randomly
    local wscount = 0

    local finalWS = 0

    if (lvl >= 65) then
        maxws = 2
    else
        maxws = 3
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

function doCurillaFlash(mob, player, target)
    local mp = mob:getMP()

    local lvl = mob:getMainLvl()
    local battletime = os.time()
    -- Only use flash if Curilla doesn't have hate?
    local hate = enmityCalc(mob, player, target)

    if (hate > 0) then
        if (lvl >= 37 and mp >= 25) then
            mob:castSpell(112, target)
            mob:setLocalVar("flashTime",battletime)
        end
    end

    mob:setLocalVar("castingSpell",112)
end

function doCurillaSentinel(mob)
    local lvl = mob:getMainLvl()
    local battletime = os.time()

    if (lvl >= 30) then
        mob:useJobAbility(32, mob)
        mob:setLocalVar("sentinelTime",battletime)
    end
end

function doCureCurilla(mob, member)
    local maxhp = member:getMaxHP()
    local hp = member:getHP()
    local hpdif = (maxhp - hp)
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local cure = 0
    local expectedLeft = 0
    local cureNeeded = 0
    local cureList = {}

    if (hpdif < 50) then
        cureList = {{5,8,1}}
    elseif (hpdif < 120) then
        cureList = {{17,8,1}, {5,8,1}}
    elseif (hpdif < 300) then
        cureList = {{30,24,2}, {17,8,1}, {5,8,1}}
    else
        cureList = {{55,46,3}, {30,24,2}, {17,8,1}, {5,8,1}}
    end


    for i = 1, #cureList do
        if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
            cure = cureList[i][3]
            break
        end
    end


    if (cure == 4) then
        expectedLeft = hpdif - 440
    elseif (cure == 3) then
        expectedLeft = hpdif - 275
    elseif (cure == 2) then
        expectedLeft = hpdif - 125
    elseif (cure == 1) then
        expectedLeft = hpdif - 45
    end

    if (expectedLeft > 350) then
        cureNeeded = 4
    elseif (expectedLeft > 200) then
        cureNeeded = 3
    elseif (expectedLeft > 100) then
        cureNeeded = 2
    else
        cureNeeded = 10
    end

    return cure, cureNeeded
end

function doEmergencyCureCur(mob)
    local cureList = {{55,88,4}, {30,46,3}, {17,24,2}, {5,8,1}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local spell = 0

    for i = 1, #cureList do
        if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
            spell = cureList[i][3]
            break
        end
    end

    return spell
end

function doCurillaProtect(mob)
    local proList = {{70,65,46}, {50,46,45}, {30,28,44}, {10,9,43}}
    local shellList = {{68,75,51}, {57,56,50}, {37,37,49}, {17,18,48}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local pro = 0

    for i = 1, #proList do
        if (lvl >= proList[i][1] and mp >= proList[i][2]) then
            pro = proList[i][3]
            break
        end
    end
    mob:castSpell(pro, mob)
end

function doCurillaShell(mob)
    local shellList = {{60,56,50}, {40,37,49}, {20,18,48}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local shell = 0

    for i = 1, #shellList do
        if (lvl >= shellList[i][1] and mp >= shellList[i][2]) then
            shell = shellList[i][3]
            break
        end
    end
    mob:castSpell(shell, mob)
end

function onMobDeath(mob, player, isKiller)
    -- mob:setStatus(dsp.status.DISAPPEAR)
end
