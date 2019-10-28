-------------------------------------------------
--  Trust: Kupipi
--  Magic: Cure I-VI, Protect/ra I-IV Shell/ra I-IV
--    -na Spells, Slow, Paralyze, Erase, Flash
--  JA: None
--  WS: Starlight, Moonlight
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)

    mob:addMod(dsp.mod.ATTP, - 30)
    local weaponskill = 0
    local cureCooldown = 16
    local debuffCooldown = 10
    local buffCooldown = 7
    local ailmentCooldown = 15
    local master = mob:getMaster()
    local kupipi = mob:getID()
    local angle = getAngle(mob)
    local wsCooldown = 4
    local enmity = math.floor(mob:getMainLvl() / 6 )
    mob:addMod(dsp.mod.ENMITY, -enmity)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("cureTime",0)
    mob:setLocalVar("debuffTime",0)
    mob:setLocalVar("ailmentTime",0)
    mob:setLocalVar("buffTime",0)
    mob:setLocalVar("paraTime",0)
    mob:setLocalVar("slowTime",0)
    mob:setLocalVar("flashTime",0)
    -- kupipiTrustPoints(mob)
    mageArmor(mob)
    set1HStats(mob)

    mob:addListener("COMBAT_TICK", "KUPIPI_CURE_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("cureTime")

        if (battletime > cureTime + cureCooldown) then
            local party = player:getParty()
            for _,member in ipairs(party) do
                if (member:getHPP() <= 30) then
                    local spell = doEmergencyCureKupipi(mob)
                    if (spell > 0) then
                        mob:castSpell(spell, member)
                        mob:setLocalVar("cureTime",battletime)
                        break
                    end
                elseif (member:getHPP() <= 65) then
                    local spell = doCureKupipi(mob)
                    if (spell > 0) then
                        mob:castSpell(spell, member)
                        mob:setLocalVar("cureTime",battletime)
                        break
                    end
                else
                    mob:setLocalVar("cureTime",battletime - 10)  -- If no member has low HP change global check to 8 seconds
                end
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "KUPIPI_BUFF_TICK", function(mob, player, target)
        local battletime = os.time()
        local buffTime = mob:getLocalVar("buffTime")

        if (battletime > buffTime + buffCooldown) then
            doBuff(mob, player)
        end
    end)

    mob:addListener("COMBAT_TICK", "AILMENT_TICK", function(mob, player, target)
        local battletime = os.time()
        local ailmentTime = mob:getLocalVar("ailmentTime")

        if (battletime > ailmentTime + ailmentCooldown) then
            local spell = doStatusRemoval(mob, player)
            if (spell > 0 ) then
                mob:castSpell(spell, player)
            end
            mob:setLocalVar("ailmentTime",battletime)
        end
    end)



    mob:addListener("COMBAT_TICK", "COMBAT_TICK", function(mob, player, target)
        local tlvl = target:getMainLvl()
        local lvl = mob:getMainLvl()
        local dlvl = tlvl - lvl
        if (dlvl >= 3) then
            trustMageMove(mob, player, target, angle)
        else
            trustMeleeMove(mob, player, target, angle)
        end

        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() > 1000 and (battletime > weaponSkillTime + wsCooldown)) then
            weaponskill = doKupipiWeaponskill(mob)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill, mob)
            mob:setLocalVar("wsTime",battletime)
        end
    end)
end

function doStatusRemoval(mob, player)
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local spell = 0

    if (player:hasStatusEffect(dsp.effect.POISON) and lvl >= 6 and mp >= 8) then
        spell = 14
    elseif (player:hasStatusEffect(dsp.effect.PARALYSIS) and lvl >= 9 and mp >= 12) then
        spell = 15
    elseif (player:hasStatusEffect(dsp.effect.BLINDNESS) and lvl >= 14 and mp >= 16) then
        spell = 16
    elseif (player:hasStatusEffect(dsp.effect.SILENCE) and lvl >= 19 and mp >= 24) then
        spell = 17
    elseif (player:hasStatusEffect(dsp.effect.CURSE_I) and lvl >= 29 and mp >= 30) then
        spell = 20
    elseif (player:hasStatusEffectByFlag(dsp.effectFlag.ERASABLE) and lvl >= 32 and mp >= 18) then
        spell = 143
    elseif (player:hasStatusEffect(dsp.effect.DISEASE) and lvl >= 34 and mp >= 20) then
        spell = 19
    elseif (player:hasStatusEffect(dsp.effect.PETRIFICATION) and lvl >= 39 and mp >= 40) then
        spell = 18
    end

    return spell
end

function doKupipiWeaponskill(mob)
    local wsList = {{1,163}}
    local maxws = 1

    local newWsList = {}
    local maxws = 1 -- Maximum number of weaponskills to choose from randomly
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

function doBuff(mob, player)
    local proRaList = {}
    local shellRaList = {}
    if (player:getVar("TrustPro_Kup") == 1) then
        proRaList = {{75,84,129},{63,65,128}, {47,46,127}, {27,28,126}, {7,9,125}}
    else
        proRaList = {{63,65,128}, {47,46,127}, {27,28,126}, {7,9,125}}
    end

    if (player:getVar("TrustShell_Kup") == 1) then
        shellRaList = {{75,93,134},{68,75,133}, {57,56,132}, {37,37,131}, {17,18,130}}
    else
        shellRaList = {{68,75,133}, {57,56,132}, {37,37,131}, {17,18,130}}
    end

    local proList = {{63,65,46}, {47,46,45}, {27,28,44}, {7,9,43}}
    local shellList = {{68,75,51}, {57,56,50}, {37,37,49}, {17,18,48}}
    local battletime = os.time()
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local party = player:getParty()
    local pro = 0
    local shell = 0
    local procount = 0
    local shellcount = 0

    for i,member in pairs(party) do
        if (not member:hasStatusEffect(dsp.effect.PROTECT)) then
            procount = procount + 1
            if (procount >= 2) then -- do protectra instead
                for i = 1, #proRaList do
                    if (lvl >= proRaList[i][1] and mp >= proRaList[i][2]) then
                        pro = proRaList[i][3]
                        break
                    end
                end
                mob:castSpell(pro, mob)
                mob:setLocalVar("buffTime",battletime)
                break
            end
        end
    end

    if (procount == 1) then
        for i,member in pairs(party) do
            if (not member:hasStatusEffect(dsp.effect.PROTECT)) then
                for i = 1, #proList do
                    if (lvl >= proList[i][1] and mp >= proList[i][2]) then
                        pro = proList[i][3]
                        break
                    end
                end
                mob:castSpell(pro, member)
                mob:setLocalVar("buffTime",battletime)
                break
            end
        end
    end

    for i,member in pairs(party) do
        if (not member:hasStatusEffect(dsp.effect.SHELL)) then
            shellcount = shellcount + 1
            if (shellcount >= 2) then
                for i = 1, #shellRaList do
                    if (lvl >= shellRaList[i][1] and mp >= shellRaList[i][2]) then
                        shell = shellRaList[i][3]
                        break
                    end
                end
                mob:castSpell(shell, mob)
                mob:setLocalVar("buffTime",battletime)
                break
            end
        end
    end

    if (shellcount == 1) then
        for i,member in pairs(party) do
            if (not member:hasStatusEffect(dsp.effect.SHELL)) then
                for i = 1, #proList do
                    if (lvl >= shellList[i][1] and mp >= shellList[i][2]) then
                        shell = shellList[i][3]
                        break
                    end
                end
                mob:castSpell(shell, member)
                mob:setLocalVar("buffTime",battletime)
                break
            end
        end
    end
end

function doCureKupipi(mob)
    local cureList = {{41,88,4}, {21,46,3}, {11,24,2}, {1,8,1}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local cure = 0

    for i = 1, #cureList do
        if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
            cure = cureList[i][3]
            break
        end
    end

    return cure
end

function doEmergencyCureKupipi(mob)
    local cureList = {{61,135,5}, {41,88,4}, {21,46,3}, {11,24,2}, {1,8,1}}
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local cure = 0

    for i = 1, #cureList do
        if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
            cure = cureList[i][3]
            break
        end
    end

    return cure
end