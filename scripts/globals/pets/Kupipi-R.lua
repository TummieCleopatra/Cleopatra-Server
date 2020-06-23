-------------------------------------------------
--  Trust: Kupipi
--  Magic: Cure I-VI, Protect/ra I-IV Shell/ra I-IV
--    -na Spells, Slow, Paralyze, Erase, Flash
--  JA: None
--  WS: Starlight, Moonlight
--  Notes: Main difference between default is the
--         addition of haste casted on player and
--         expanded debuffs
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local weaponskill = 0
    local magicCheck = 4
    local cureCooldown = 14
    local debuffCooldown = 10
    local buffCooldown = 7
    local ailmentCooldown = 15
    local sleepCheck = 20
    local hasteCooldown = 220
    local master = mob:getMaster()
    local kupipi = mob:getID()
    local angle = getMageAngle(mob)
    local wsCooldown = 4
    local sleepCooldown = 10
    -- increase Kupipi's MP
    mob:addStatusEffect(dsp.effect.MAX_MP_BOOST,32,0,0);
    mob:addMP(600)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("magicTime",0)
    mob:setLocalVar("cureTime",0)
    mob:setLocalVar("debuffTime",0)
    mob:setLocalVar("ailmentTime",0)
    mob:setLocalVar("buffTime",0)
    mob:setLocalVar("paraTime",0)
    mob:setLocalVar("slowTime",0)
    mob:setLocalVar("flashTime",0)
    mob:setLocalVar("hasteTime",0)
    mob:setLocalVar("sleepTime",0)
    mob:setLocalVar("sleepCheck",0)
    local enmity = math.floor(mob:getMainLvl() / 6 )
    mob:addMod(dsp.mod.ENMITY, -enmity)

    -- kupipiTrustPoints(mob)
    mageArmor(mob)
    set1HStats(mob)

    mob:addListener("COMBAT_TICK", "KUPIPI_CURE_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("cureTime")
        local act = mob:getCurrentAction()


        if (act ~= dsp.act.MAGIC_CASTING) then
            mob:setLocalVar("cureCasting",0)  -- Set this to 0 to mean mob is not or is done casting cures
            -- printf("Done Casting, set cure to 0")
        end

        if (battletime > cureTime + cureCooldown) then
            local party = player:getPartyWithTrusts()
            local threshold = 75
            local mymp = math.floor((mob:getMP() / mob:getMaxMP()) * 100)
            local koru, mp = isKoruInParty(mob, player, target)
            if (koru == 1) then
                if (mymp >= 30 and mp >= 30) then
                    threshold = 75
                elseif (mymp < 30 and mp >= 30) then
                    threshold = 35
                else
                    threshold = 50
                end
            end


            for _,member in ipairs(party) do
                if (member:getHPP() <= 30) then
                    local spell = doEmergencyCureKupipi(mob)
                    if (spell > 0) then
                        mob:castSpell(spell, member)
                        mob:setLocalVar("cureTime",battletime)
                        mob:setLocalVar("magicTime",battletime)
                        break
                    end
                elseif (member:getHPP() <= 75) then

                    local spell, moreCure = doCureKupipi(mob, member)
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
                            break
                        end
                    end
                else
                    mob:setLocalVar("cureTime",battletime - 12)
                end
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "KUPIPI_SLEEP_CHECK_TICK", function(mob, player, target)
        local battletime = os.time()
        local sleep = mob:getLocalVar("sleepCheck")
        if (battletime > sleep + sleepCheck) then
            local id = isPartyAsleep(mob, player)
            if (id ~= 0) then
                printf("Try to curaga!")
                mob:castSpell(7, GetMobByID(id))
                mob:setLocalVar("sleepCheck",battletime)
            end

        end
    end)

    mob:addListener("COMBAT_TICK", "KUPIPI_MAGIC_TICK", function(mob, player, target)
        local battletime = os.time()
        local magicTime = mob:getLocalVar("magicTime")
        local buffTime = mob:getLocalVar("buffTime")
        local debuffTime = mob:getLocalVar("debuffTime")
        local ailmentTime = mob:getLocalVar("ailmentTime")
        local hasteTime = mob:getLocalVar("hasteTime")
        local distance = mob:checkDistance(target)
        local tlvl = target:getMainLvl()
        local lvl = mob:getMainLvl()
        local dlvl = tlvl - lvl
        local move = 10
        local koru, mp = isKoruInParty(mob, player, target)
        if (target:getName() == "Fafnir" or target:getName() == "Nidhogg") then
           move = 1
        elseif (dlvl > 3) then
            move = 10
        else
           move = 1
        end

            -- Global Magic Check every 4 Seconds
        if (battletime > magicTime + magicCheck) then
            -- BUFFS
            if (battletime > buffTime + buffCooldown and distance >= move) then
                -- printf("DO BUFFS")
                doKupipiBuff(mob, player)
                mob:setLocalVar("buffTime",battletime)
            -- HASTE
            elseif (battletime > hasteTime + hasteCooldown and koru == 0) then

                local spell = doHasteKupipi(mob)
                if (spell > 0 ) then
                    mob:castSpell(spell, player)
                end
                mob:setLocalVar("hasteTime",battletime)
            -- DEBUFF
            elseif (battletime > debuffTime + debuffCooldown and koru == 0 and not player:hasStatusEffect(dsp.effect.HASTE)) then

                local spell = doDebuff(mob, target)
                if (spell > 0 ) then
                    mob:castSpell(spell, target)
                end
                mob:setLocalVar("debuffTime",battletime)
            -- AILMENTS
            elseif (battletime > ailmentTime + ailmentCooldown) then
                doStatusRemoval(mob, player)
            else
               mob:setLocalVar("magicTime",battletime)
            end
        end
    end)







    mob:addListener("COMBAT_TICK", "COMBAT_TICK", function(mob, player, target)
        local tlvl = target:getMainLvl()
        local lvl = mob:getMainLvl()
        local dlvl = tlvl - lvl
        if (dlvl > 3) then
            trustMageMove(mob, player, target, angle)
        else
            trustMeleeMove(mob, player, target, angle)
        end

        local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
            weaponskill = doKupipiWeaponskill(mob)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill, target)
            mob:setLocalVar("wsTime",battletime)
        end
    end)


    mob:addListener("COMBAT_TICK", "KUPIPI_SLEEP_TICK", function(mob, player, target)
        local cureList = {{40,30,93}, {16,60,7}}
        local battletime = os.time()
        local mp = mob:getMP()
        local lvl = mob:getMainLvl()
        local cure = 0
        local sleepTime = mob:getLocalVar("sleepTime")
        local party = player:getPartyWithTrusts()
        local memberCount = 0
        if (battletime > sleepTime + sleepCooldown) then
            for i, member in ipairs(party) do
                if (member:hasStatusEffect(dsp.effect.SLEEP_I) == true or member:hasStatusEffect(dsp.effect.SLEEP_II) == true)  then -- Check to see if there is a member in the party who is slept and is a WHM
                    memberCount = memberCount + 1
                    if (memberCount >= 2) then
                        for i = 1, #cureList do
                            if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
                                cure = cureList[i][3]
                                break
                            end
                        end

                        if (cure == 7) then
                            mob:castSpell(cure, member)
                        elseif (cure == 93) then
                            mob:castSpell(cure, mob)
                        end
                    else
                        if (mp >= 8) then
                            mob:castSpell(1, member)
                        end
                    end
                end
            end
            mob:setLocalVar("sleepTime",battletime)
        end
    end)

    mob:addListener("MAGIC_START", "KUPIPI_MAGIC_CHECK", function(pet, spell, action)
        if (spell:getID() > 124 and spell:getID() < 135) then
            spell:setFlag(dsp.magic.spellFlag.HIT_ALL);
            spell:setRadius(60);
        end
    end)



end

function doStatusRemoval(mob, player)
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local spell = 0
    local battletime = os.time()
    local party = player:getPartyWithTrusts()

    for i,member in pairs(party) do
        if (member:hasStatusEffect(dsp.effect.PETRIFICATION) == true and lvl >= 39 and mp >= 40) then
            mob:castSpell(18, member)
            break
        elseif (member:hasStatusEffect(dsp.effect.PARALYSIS) == true and lvl >= 9 and mp >= 12) then
            mob:castSpell(15, member)
            break
        elseif (member:hasStatusEffect(dsp.effect.SILENCE) == true and lvl >= 19 and mp >= 24) then
            mob:castSpell(17, member)
            break
        elseif (member:hasStatusEffect(dsp.effect.BLINDNESS) == true and lvl >= 14 and mp >= 16) then
            mob:castSpell(16, member)
            break
        elseif (member:hasStatusEffect(dsp.effect.CURSE_I) == true and lvl >= 29 and mp >= 30) then
            mob:castSpell(20, member)
            break
        elseif (member:hasStatusEffectByFlag(dsp.effectFlag.ERASABLE) and lvl >= 32 and mp >= 18) then
            mob:castSpell(143, member)
            break
        elseif (member:hasStatusEffect(dsp.effect.DISEASE) == true and lvl >= 34 and mp >= 20) then
            mob:castSpell(19, member)
            break
        elseif (member:hasStatusEffect(dsp.effect.POISON) == true and lvl >= 6 and mp >= 8) then
            mob:castSpell(14, member)
            break
        end

        mob:setLocalVar("ailmentTime",battletime)

    end
end

function doKupipiWeaponskill(mob)
    local wsList = {{43,164}, {1,163}}
    local maxws = 3

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

function doKupipiBuff(mob, player)
    local proRaList = {}
    local shellRaList = {}
    if (mob:getLocalVar("[TRUST]KUPIPI_SHELLPROV") == 1) then
        proRaList = {{75,84,129},{63,65,128}, {47,46,127}, {27,28,126}, {7,9,125}}
    else
        proRaList = {{63,65,128}, {47,46,127}, {27,28,126}, {7,9,125}}
    end

    if (mob:getLocalVar("[TRUST]KUPIPI_SHELLPROV") == 1) then
        shellRaList = {{75,93,134},{68,75,133}, {57,56,132}, {37,37,131}, {17,18,130}}
    else
        shellRaList = {{68,75,133}, {57,56,132}, {37,37,131}, {17,18,130}}
    end

    local proList = {{63,65,46}, {47,46,45}, {27,28,44}, {7,9,43}}
    local shellList = {{68,75,51}, {57,56,50}, {37,37,49}, {17,18,48}}
    local battletime = os.time()
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local party = player:getPartyWithTrusts()
    local pro = 0
    local shell = 0
    local procount = 0
    local shellcount = 0

    for i,member in pairs(party) do
        if (member:hasStatusEffect(dsp.effect.PROTECT) == false) then
            if (not mob:hasStatusEffect(dsp.effect.PROTECT)) then
                for i = 1, #proRaList do
                    if (lvl >= proRaList[i][1] and mp >= proRaList[i][2]) then
                        pro = proRaList[i][3]
                        break
                    end
                end
                print(pro)
                mob:castSpell(pro, mob)
                mob:setLocalVar("buffTime",battletime)
                break
            end
        end
    end

    --[[
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
    end ]]--

    for i,member in pairs(party) do
        if (not member:hasStatusEffect(dsp.effect.SHELL)) then
            if (not mob:hasStatusEffect(dsp.effect.SHELL)) then
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

    --[[

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
    end ]]--
end

function doDebuff(mob, target)
    local paraCooldown = 120
    local slowCooldown = 180
    local flashCooldown = 120
    local battletime = os.time()
    local paraTime = mob:getLocalVar("paraTime")
    local slowTime = mob:getLocalVar("slowTime")
    local flashTime = mob:getLocalVar("flashTime")
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local debuff = 0

    if ((battletime > paraTime + paraCooldown) and not target:hasStatusEffect(dsp.effect.PARALYSIS) and lvl >= 4 and mp >= 6) then
        mob:setLocalVar("paraTime",battletime)
        debuff = 58
    elseif ((battletime > slowTime + slowCooldown) and not target:hasStatusEffect(dsp.effect.SLOW) and lvl >= 13 and mp >= 15) then
        mob:setLocalVar("slowTime",battletime)
        debuff = 56
    -- elseif ((battletime > flashTime + flashCooldown) and not target:hasStatusEffect(dsp.effect.FLASH) and lvl >= 45 and mp >= 25) then
       -- mob:setLocalVar("flashTime",battletime)
        -- debuff = 112
    end

    return debuff
end

function doCureKupipi(mob, member)
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
        cureList = {{1,8,1}}
    elseif (hpdif < 120) then
        cureList = {{11,24,2}, {1,8,1}}
    elseif (hpdif < 300) then
        cureList = {{21,46,3}, {11,24,2}, {1,8,1}}
    else
        cureList = {{41,88,4}, {21,46,3}, {11,24,2}, {1,8,1}}
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

function doHasteKupipi(mob)
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local haste = 0

    if (lvl >= 48 and mp >= 40) then
       haste = 57
    end

    return haste

end

