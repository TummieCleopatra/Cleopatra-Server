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
    doDualWield(mob)
    local lvl = mob:getMainLvl()
    local weaponskill = 0
    local wsCooldown = 4
    local sneakAttackCooldown = 60
    local utsuIchiCooldown = 30
    local utsuNiCooldown = 45
    nanaaTrustPoints(mob)
    mob:setLocalVar("sneakAttackCooldown",60)
    mob:setLocalVar("trickAttackCooldown",60)

    mob:setLocalVar("distanceTime",0)
    mob:setLocalVar("saTime",15)
    mob:setLocalVar("taTime",0)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("utsuIchiTime",0)
    mob:setLocalVar("utsuNiTime",0)
    mob:setLocalVar("TrickAttack",1)  -- Do TA First

    set1HStats(mob)
    mob:addListener("COMBAT_TICK", "NANAA_DISTANCE_TICK", function(mob, player, target)
        local trickAttackCooldown = mob:getLocalVar("trickAttackCooldown")
        local taTime = mob:getLocalVar("taTime")
        local curilla, id = isCurillaInParty(mob, player, target)
        local battletime = os.time()
        if (battletime > taTime + trickAttackCooldown) then
            mob:setLocalVar("TrickAttack",1)
        end

        local test = mob:getLocalVar("TrickAttack")


        if (mob:getLocalVar("TrickAttack") == 0) then
            -- printf("SNEAK ATTACK POS")
            trustSneakAttackMove(mob, player, target)
        elseif (curilla == 1 and mob:getLocalVar("TrickAttack") == 1) then
            -- printf("MOVE TO DO TRICK ATTACK")
            trustTrickAttackMove(mob,player,target,id)
        else
            trustSneakAttackMove(mob, player, target)
        end
    end)

    mob:addListener("COMBAT_TICK", "NANAA_UTSU_TICK", function(mob, player, target)
        local battletime = os.time()
        local utsuIchi = mob:getLocalVar("utsuIchiTime")
        local utsuNi = mob:getLocalVar("utsuNiTime")
        local shadows = mob:getStatusEffect(dsp.effect.COPY_IMAGE)
        local count = 0
        if (shadows ~= nil) then
            count = shadows:getPower()
        else
            count = 0
        end

        if ((battletime > utsuNi + utsuNiCooldown) and lvl >= 74 and (count == nil or count <= 1)) then
            mob:castSpell(339, mob)
            mob:setLocalVar("utsuNiTime",battletime)
        elseif ((battletime > utsuIchi + utsuIchiCooldown) and lvl >= 24 and (count == nil)) then
            mob:castSpell(338, mob)
            mob:setLocalVar("utsuIchiTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "NANAA_TA_TICK", function(mob, player, target)
        local ta = mob:getLocalVar("TrickAttack")
        if (ta == 1) then
            doNanaaTa(mob, player, target)
        end
    end)

    mob:addListener("COMBAT_TICK", "NANAA_SA_TICK", function(mob, player, target)
        local ta = mob:getLocalVar("TrickAttack")
        if (ta == 0) then
            doNanaaSa(mob, player, target)
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
                mob:useJobAbility(28, mob)
                mob:setLocalVar("WS_TP",mob:getTP())
                mob:useMobAbility(weaponskill)
                mob:setLocalVar("wsTime",battletime)
                mob:setLocalVar("saTime",battletime)
            end
        else
            if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
                local targ = mob:getTarget()
                weaponskill = doNanaaWeaponskill(mob)
                mob:setLocalVar("WS_TP",mob:getTP())
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
    if ((drot > -5 and drot < 5) and enmity ~= 0) then
        if (tp < 700) then
            if (battletime > saTime + sneakAttackCooldown) then
                mob:useJobAbility(28, mob)
                mob:setLocalVar("saTime",os.time())
            end
        end
    end
end


function doNanaaTa(mob, player, target)
    local taTime = mob:getLocalVar("taTime")
    local trickAttackCooldown = 60
    local battletime = os.time()

    local trot = target:getRotPos()
    local mrot = mob:getRotPos()
    local drot = mrot - trot
    local nrot = trot - mrot
    local tp = mob:getTP()

    -- printf("Trick Attack Rot is %u",drot)

    if ((drot < 131 and drot > 125) or (nrot < 131 and nrot > 125)) then
        if (tp < 800) then
            if (battletime > taTime + trickAttackCooldown) then
                mob:useJobAbility(60, mob)
                mob:setLocalVar("taTime",os.time())
            end
        end
    end
end

function doNanaaWeaponskill(mob)
    local lvl = mob:getMainLvl()
    local wsList = {{75,3189},{65,24},{60,23},{33,17},{20,18},{1,16}}
    local newWsList = {}

    local maxws = 0 -- Maximum number of weaponskills to choose from randomly
    if (lvl >= 65) then
        maxws = 2
    elseif (lvl >= 60) then
        maxws = 2
    elseif (lvl >= 33) then
        maxws = 1
    else
        maxws = 2
    end

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