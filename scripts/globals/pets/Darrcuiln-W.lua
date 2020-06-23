-------------------------------------------------
--  Trust: Darcullin
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
    darcTrustPoints(mob)
    mob:setLocalVar("caTime",0)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("caActive",0)
    mob:setLocalVar("caSpell",0)
    mob:setLocalVar("bluCureTime",0)
    mob:setLocalVar("berserkTime",0)
    local angle = getAngle(mob)
    local wsCooldown = 4
    local caCooldown = 120
    local bluCastCooldown = 35
    local bluBuffCooldown = 30
    local bluCureCooldown = 18
    local berserkCooldown = 300
    local lvl = mob:getMainLvl()
    set1HStats(mob)


    mob:addListener("COMBAT_TICK", "DARCULLIN_DISTANCE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
    end)

    mob:addListener("COMBAT_TICK", "DARCULLIN_BLUE_SPELL_TICK", function(mob, player, target)
        local battletime = os.time()
        local bluCast = mob:getLocalVar("bluCast")
        if ((battletime > bluCast + bluCastCooldown) and mob:getTP() >= 150 and not mob:hasPreventActionEffect()) then
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

        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown) and caActive ~= 1 and not mob:hasPreventActionEffect()) then
            if (lvl >= 40 and (battletime > caTime + caCooldown)) then
                mob:useJobAbility(78, mob)
                weaponskill = doDarcullinCAWeaponskill(mob)
                mob:setLocalVar("WS_TP",mob:getTP())
                mob:useMobAbility(weaponskill, target)
                mob:setLocalVar("wsTime",battletime)
                mob:setLocalVar("caActive",1)  -- Turn on Chain Affinity
            else
                weaponskill = doDarcullinWeaponskill(mob)
                mob:setLocalVar("WS_TP",mob:getTP())
                mob:useMobAbility(weaponskill, target)
                mob:setLocalVar("wsTime",battletime)
            end
        elseif (caActive == 1 and (battletime > weaponSkillTime + wsCooldown) and not mob:hasPreventActionEffect()) then
            mob:castSpell(caSpell, target)
            mob:setLocalVar("caSpell",0)
            mob:setLocalVar("caActive",0)
            mob:setLocalVar("wsTime",battletime)
            mob:setLocalVar("bluCast",battletime - 10)
        end
    end)

    mob:addListener("COMBAT_TICK", "DARRCUILN_BERSERK_TICK", function(mob, player, target)
        local battletime = os.time()
        local berserk = mob:getLocalVar("berserkTime")
        if ((battletime > berserk + berserkCooldown) and lvl >= 50 and mob:getTP() >= 800) then
            mob:useJobAbility(15, target)
            mob:setLocalVar("berserkTime",battletime)
        end
    end)
end


function doDarrcuilnCure(mob, player, target)
    local cureList = {{58,72,593}, {30,37,578}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local cure = 0
    local party = player:getPartyWithTrusts()
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