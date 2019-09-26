-------------------------------------------------
--  Trust: Darcullin-NIN
--  Magic: None
--  JA: Chain Affinity
--  WS: All Sword WS
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/pathfind")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    doDarrcuilnTrustPoints(mob)
    doDualWield(mob)
    mob:setLocalVar("caTime",0)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("caActive",0)
    mob:setLocalVar("caSpell",0)
    mob:setLocalVar("bluCureTime",0)
    mob:setLocalVar("utsuIchiTime",0)
    mob:setLocalVar("utsuNiTime",0)

    local angle = getAngle(mob)
    local wsCooldown = 4
    local caCooldown = 120
    local bluCastCooldown = 25
    local bluBuffCooldown = 30
    local bluCureCooldown = 18
    local stunCooldown = 10
    local utsuIchiCooldown = 30
    local utsuNiCooldown = 45
    local lvl = mob:getMainLvl()

    mob:addListener("COMBAT_TICK", "DARCULLIN_DISTANCE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
        -- Change spell cooldown to a higher number if Darrcuilin has hate to preserve MP for self cures
        local hate = enmityCalc(mob, player, target)
        if (hate == 0) then
            bluCastCooldown = 50
            bluBuffCooldown = 45
        else
            bluCastCooldown = 25
            bluBuffCooldown = 30
        end
    end)


    mob:addListener("COMBAT_TICK", "DARRCUILN_UTSU_TICK", function(mob, player, target)
        local battletime = os.time()
        local stunCast = mob:getLocalVar("stunCast")
        local mp = mob:getMP()
        local hate = enmityCalc(mob, player, target)
        local utsuIchi = mob:getLocalVar("utsuIchiTime")
        local utsuNi = mob:getLocalVar("utsuNiTime")
        local shadows = mob:getStatusEffect(dsp.effect.COPY_IMAGE)
        local count = 0
        if (shadows ~= nil) then
            count = shadows:getPower()
        else
            count = 0
        end

        -- Darrcuilin will try to use headbutt to stun before casting Utsu if he has hate
        if ((battletime > utsuNi + utsuNiCooldown) and lvl >= 37 and (count == nil or count <= 1)) then
            if (hate == 0 and (battletime > stunCast + stunCooldown) and mp >= 12) then
                mob:castSpell(623, target)
                mob:setLocalVar("stunCast",battletime)
            end

            mob:castSpell(339, mob)
            mob:setLocalVar("utsuNiTime",battletime)
        elseif ((battletime > utsuIchi + utsuIchiCooldown) and lvl >= 12 and (count == nil)) then
            if (hate == 0 and (battletime > stunCast + stunCooldown) and mp >= 12) then
                mob:castSpell(623, target)
                mob:setLocalVar("stunCast",battletime)
            end

            mob:castSpell(338, mob)
            mob:setLocalVar("utsuIchiTime",battletime)
        end
    end)


    mob:addListener("COMBAT_TICK", "DARCULLIN_BLUE_SPELL_TICK", function(mob, player, target)
        local battletime = os.time()
        local bluCast = mob:getLocalVar("bluCast")
        if ((battletime > bluCast + bluCastCooldown) and mob:getTP() >= 150) then
            local spell = doDarrcuilnSpells(mob)
            if (spell > 0) then
                mob:castSpell(spell, target)
                mob:setLocalVar("bluCast",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "DARCULLIN_BLUE_BUFF_TICK", function(mob, player, target)
        local battletime = os.time()
        local bluBuff = mob:getLocalVar("bluBuff")
        if (battletime > bluBuff + bluBuffCooldown) then
            local buff = doDarrcuilnBuff(mob)
            if (buff > 0) then
                mob:castSpell(buff, mob)
                mob:setLocalVar("bluBuff",battletime)
                mob:setLocalVar("bluCast",battletime - 10)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "DARCULLIN_BLUE_HEAL_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("bluCureTime")
        if (battletime > cureTime + bluCureCooldown) then
            doDarrcuilnCure(mob, player, target)
        end
    end)


    mob:addListener("COMBAT_TICK", "DARCULLIN_COMBAT_TICK", function(mob, player, target)
        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        local caTime = mob:getLocalVar("caTime")
        local caActive = mob:getLocalVar("caActive")
        local caSpell = mob:getLocalVar("caSpell")

        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown) and caActive ~= 1) then
            if (lvl >= 40 and (battletime > caTime + caCooldown)) then
                mob:useJobAbility(78, mob)
                weaponskill = doDarcullinCAWeaponskill(mob)
                mob:useMobAbility(weaponskill, target)
                mob:setLocalVar("wsTime",battletime)
                mob:setLocalVar("caActive",1)  -- Turn on Chain Affinity
            else
                weaponskill = doDarcullinWeaponskill(mob)
                mob:useMobAbility(weaponskill, target)
                mob:setLocalVar("wsTime",battletime)
            end
        elseif (caActive == 1 and (battletime > weaponSkillTime + wsCooldown)) then
            mob:castSpell(caSpell, target)
            mob:setLocalVar("caSpell",0)
            mob:setLocalVar("caActive",0)
            mob:setLocalVar("wsTime",battletime)
            mob:setLocalVar("bluCast",battletime - 10)
        end
    end)
end


function doDarrcuilnCure(mob, player, target)
    local cureList = {{58,72,593}, {30,37,578}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local cure = 0
    local party = player:getParty()
    local battletime = os.time()
    for _,member in ipairs(party) do
        if (member:getHPP() <= 45) then
            for i = 1, #cureList do
                if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
                    cure = cureList[i][3]
                    if (cure > 0) then
                        mob:castSpell(cure, member)
                        mob:setLocalVar("bluCureTime",battletime)
                        break
                    end
                end
            end
        end
    end

    if (cure == 0) then
        mob:setLocalVar("bluCureTime",battletime - 4)
    end

end

function doDarcullinWeaponskill(mob)
    local wsList = {{72,42}, {60,40}, {60,150}, {41,37}, {16,34}, {1,32}}
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


function doDarcullinCAWeaponskill(mob)
    local lvl = mob:getMainLvl()
    local finalWS = 0

    if (lvl >= 72) then
        finalWS = 42
        mob:setLocalVar("caSpell",611)
    elseif (lvl >= 60) then
        finalWS = 34
        mob:setLocalVar("caSpell",554)
    elseif (lvl >= 40) then
        finalWS = 34
        mob:setLocalVar("caSpell",569)
    end

    return finalWS
end

function doDarrcuilnSpells(mob)
    local spellList = {{75,617,86},{72,611,74},{69,641,61},{63,560,61},{60,554,51},{60,589,48},{38,569,47},{26,519,21},{18,529,16},{12,623,12},{4,551,5},{4,597,6},{1,577,5}}
    local newBluList = {}
    local maxspell = 5
    local spellcount = 0
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local finalSpell = 0
    local battletime = os.time()

    for i = 1, #spellList do
        if (lvl >= spellList[i][1] and mp >= spellList[i][3]) then
            table.insert(newBluList, spellcount + 1, spellList[i][2])
            spellcount = spellcount + 1
            if (spellcount >= maxspell) then
                finalSpell = newBluList[math.random(1,#newBluList)]
                break
            end
        else
            break
        end
    end

    if (finalSpell == 0) then
        mob:setLocalVar("bluCast",battletime + 5)
    end
    return finalSpell
end

function doDarrcuilnBuff(mob)
    local lvl = mob:getMainLvl()
    local mp = mob:getMP()
    local buffSpell = 0

    if (lvl >= 71 and mp >= 24 and not mob:hasStatusEffect(dsp.effect.ATTACK_BOOST)) then
        buffSpell = 655
    elseif (lvl >= 48 and mp >= 29 and not mob:hasStatusEffect(dsp.effect.HASTE)) then
        buffSpell = 530
    end

    return buffSpell
end