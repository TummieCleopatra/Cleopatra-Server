-------------------------------------------------
--  Trust: Koru
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
    local magicCheck = 6
    local cureCooldown = 15
    local debuffCooldown = 15
    local buffCooldown = 10
    local ailmentCooldown = 15
    local hasteCooldown = 220
    local convertCooldown = 600
    local flurryCooldown = 180
    local addCooldown = 45
    local master = mob:getMaster()
    local lvl = master:getMainLvl()
    if (lvl >= 55) then
        mob:addMod(dsp.mod.FASTCAST, 20)
    elseif (lvl >= 35) then
        mob:addMod(dsp.mod.FASTCAST, 15)
    elseif (lvl >= 15) then
        mob:addMod(dsp.mod.FASTCAST, 10)
    end
    local koru = mob:getID()
    local angle = getMageAngle(mob)
    local wsCooldown = 4
    local sleepCooldown = 10
    -- increase koru's MP
    mob:addStatusEffect(dsp.effect.MAX_MP_BOOST,39,0,0);
    mob:addMP(700)
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("magicTime",0)
    mob:setLocalVar("cureTime",0)
    mob:setLocalVar("debuffTime",0)
    mob:setLocalVar("ailmentTime",0)
    mob:setLocalVar("buffTime",0)
    mob:setLocalVar("paraTime",0)
    mob:setLocalVar("slowTime",0)
    mob:setLocalVar("blindTime",0)
    mob:setLocalVar("flashTime",0)
    mob:setLocalVar("hasteTime",0)
    mob:setLocalVar("sleepTime",0)
    mob:setLocalVar("convertTime",0)
    mob:setLocalVar("cureCasting",0)
    local enmity = math.floor(mob:getMainLvl() / 6 )
    mob:addMod(dsp.mod.ENMITY, -enmity)

    -- koruTrustPoints(mob)
    mageArmor(mob)
    set1HStats(mob)


    mob:addListener("COMBAT_TICK", "COMBAT_TICK", function(mob, player, target)
        trustMageMove(mob, player, target, angle)
    end)

    mob:addListener("COMBAT_TICK", "KORU_CURE_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("cureTime")
        local act = mob:getCurrentAction()
        if (act ~= dsp.act.MAGIC_CASTING) then
            mob:setLocalVar("cureCasting",0)  -- Set this to 0 to mean mob is not or is done casting cures
            -- printf("Done Casting, set cure to 0")
        end

            -- CURE CHECK
        if (battletime > cureTime + cureCooldown) then
            local party = player:getPartyWithTrusts()
            local threshold = 65
            local mymp = math.floor((mob:getMP() / mob:getMaxMP()) * 100)
            local kup, mp = isKupipiInParty(mob, player, target)
            if (kup == 1) then
                if (mymp >= 30 and mp >= 30) then
                    threshold = 35
                elseif (mp < 30 and mymp >=30) then
                    threshold = 70
                else
                    threshold = 50
                end
            end

            for _,member in ipairs(party) do
                if (member:getHPP() <= threshold) then
                    local spell, moreCure = doCureKoru(mob, member)
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


    mob:addListener("COMBAT_TICK", "KORU_MAGIC_TICK", function(mob, player, target)
        local battletime = os.time()
        local magicTime = mob:getLocalVar("magicTime")
        local buffTime = mob:getLocalVar("buffTime")
        local debuffTime = mob:getLocalVar("debuffTime")
        local ailmentTime = mob:getLocalVar("ailmentTime")
        local hasteTime = mob:getLocalVar("hasteTime")
        local distance = mob:checkDistance(target)
                -- Global Magic Check every 4 Seconds
        local move = 10
        if (target:getName() == "Fafnir" or target:getName() == "Nidhogg") then
            move = 1
        end

        if (battletime > magicTime + magicCheck) then
            -- BUFFS
            if (battletime > buffTime + buffCooldown and distance >= move) then

                doKoruBuff(mob, player)
                mob:setLocalVar("buffTime",battletime)
                mob:setLocalVar("magicTime",battletime)
            -- HASTE
            elseif (battletime > hasteTime + hasteCooldown and not player:hasStatusEffect(dsp.effect.HASTE)) then
                local spell = doHasteKoru(mob)
                if (spell > 0 ) then
                    mob:castSpell(spell, player)
                end
                mob:setLocalVar("hasteTime",battletime)
                mob:setLocalVar("magicTime",battletime)
            -- DEBUFF
            elseif (battletime > debuffTime + debuffCooldown) then
                printf("DO DEBUFFS")
                local spell = doDebuffKoru(mob, target)
                if (spell > 0 ) then
                    mob:castSpell(spell, target)
                end
                mob:setLocalVar("debuffTime",battletime)
                mob:setLocalVar("magicTime",battletime)
            else
               mob:setLocalVar("magicTime",battletime + 5)
            end
        end
    end)


    mob:addListener("COMBAT_TICK", "FLURRY_TICK", function(mob, player)
        local battletime = os.time()
        local mp = mob:getMP()
        local lvl = mob:getMainLvl()
        local flurryTime = mob:getLocalVar("flurryTime")
        local party = player:getPartyWithTrusts()
        if (battletime > flurryTime + flurryCooldown and lvl >= 48 and mp >= 40) then
            for i, member in ipairs(party) do
                if (member:getMainJob() == dsp.job.RNG or member:getMainJob() == dsp.job.COR and member:hasStatusEffect(dsp.effect.FLURRY) == false and mob:checkDistance(member) < 6) then
                   mob:castSpell(845, member)
                   break
                end
                mob:setLocalVar("flurryTime",battletime)
            end
        end
    end)




    mob:addListener("COMBAT_TICK", "CONVERT_TICK", function(mob)
        local battletime = os.time()
        local mp = mob:getMP()
        local lvl = mob:getMainLvl()
        local convertTime = mob:getLocalVar("convertTime")
        local mpp = (mp / mob:getMaxMP()) * 100
        if (battletime > convertTime + convertCooldown and lvl >= 40 and mpp < 10) then
            mob:useJobAbility(67, mob)
            mob:setLocalVar("convertTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "KORU_ADD_TICK", function(mob, player, target)
        local battletime = os.time()
        local addTime = mob:getLocalVar("addTime")
        local tID = target:getID()
        if (battletime > addTime + addCooldown and lvl >= 25) then
            local nearbyTargets = target:getTargetsWithinArea(12, 8);
            for i,enemy in pairs(nearbyTargets) do  -- Look around for all targets in area
                if ((enemy:getID() ~= tID) and enemy:getObjType() == dsp.objType.MOB and enemy:hasStatusEffect(dsp.effect.SLEEP_II) == false) then
                    local enmityList = enemy:getEnmityList()
                    local party = player:getPartyWithTrusts()
                    if enmityList and #enmityList > 0 then
                        printf("Something has enmity")
                        for _,enmity in ipairs(enmityList) do
                            for i, member in ipairs(party) do
                                if (enmity.entity:getID() == member:getID()) then
                                    printf("Try to sleep")
                                    mob:castSpell(259, enemy)
                                    local enemID = enemy:getID()
                                    player:setVar("[TRUST]KORU_SLEEP",enemID)
                                    mob:setLocalVar("addTime",battletime)
                                    break
                                end
                            end
                        end
                    end
                end

                mob:setLocalVar("addTime",battletime - 40)
            end

        end
    end)


    mob:addListener("COMBAT_TICK", "KORU_SLEEP_TICK", function(mob, player, target)
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



end




function doKoruBuff(mob, player)
    local proRaList = {}
    local shellRaList = {}



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
    local kupipi, kupmp = isKupipiInParty(mob, player, target)


    if (player:hasStatusEffect(dsp.effect.PROTECT) == false and kupipi == 0) then
        for i = 1, #proList do
            if (lvl >= proList[i][1] and mp >= proList[i][2]) then
                pro = proList[i][3]
                break
            end
        end
        mob:castSpell(pro, player)
        mob:setLocalVar("buffTime",battletime)
    end



    if (player:hasStatusEffect(dsp.effect.SHELL) == false and kupipi == 0) then
        for i = 1, #proList do
            if (lvl >= shellList[i][1] and mp >= shellList[i][2]) then
                shell = shellList[i][3]
                break
            end
        end
        mob:castSpell(shell, player)
        mob:setLocalVar("buffTime",battletime)
    end


    if (lvl >= 41 and mp > 40) then
        local party = player:getPartyWithTrusts()
        for _,member in pairs(party) do
            if (member:getMP() > 50 and (member:hasStatusEffect(dsp.effect.REFRESH) == false and member:hasStatusEffect(dsp.effect.SUBLIMATION_ACTIVATED) == false and member:hasStatusEffect(dsp.effect.SUBLIMATION_COMPLETE) == false)) then
                mob:castSpell(109, member)
                mob:setLocalVar("buffTime",battletime)
                break
            end
        end
    end


end

function doDebuffKoru(mob, target)
    local player = mob:getMaster()
    local paraCooldown = 120
    local slowCooldown = 180
    local blindCooldown = 120
    local battletime = os.time()
    local paraTime = mob:getLocalVar("paraTime")
    local slowTime = mob:getLocalVar("slowTime")
    local blindTime = mob:getLocalVar("flashTime")
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local debuff = 0
    local maxmp = mob:getMaxMP()
    local mpp = (mp / maxmp) * 100
    -- printf("TRYING TO DEBUFF THE MOB!!!")
    if ((battletime > paraTime + paraCooldown) and not target:hasStatusEffect(dsp.effect.DIA) and mpp > 40) then
      --  printf("TRY DIA!!!")
        if (lvl > 74 and mp >= 45) then
            mob:setLocalVar("diaTime",battletime)
            debuff = 25
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Dia III >>  "..tname.."",0xF)
            end
        elseif (lvl >= 31 and mp >= 30) then
            mob:setLocalVar("diaTime",battletime)
            debuff = 24
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Dia II >>  "..tname.."",0xF)
            end
        elseif (lvl >= 1 and mp >= 7) then
            mob:setLocalVar("diaTime",battletime)
            debuff = 23
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Dia >>  "..tname.."",0xF)
            end
        end
    elseif ((battletime > paraTime + paraCooldown) and not target:hasStatusEffect(dsp.effect.PARALYSIS) and mpp > 40) then
        if (lvl > 74 and mp >= 36) then
            mob:setLocalVar("paraTime",battletime)
            debuff = 80
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Paralyze II >>  "..tname.."",0xF)
            end
        elseif (lvl >= 4 and mp >= 6) then
            mob:setLocalVar("paraTime",battletime)
            debuff = 58
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Paralyze >>  "..tname.."",0xF)
            end
        end
    elseif ((battletime > slowTime + slowCooldown) and not target:hasStatusEffect(dsp.effect.SLOW) and mpp > 40) then
        if (lvl > 74 and mp >= 45) then
            mob:setLocalVar("slowTime",battletime)
            debuff = 79
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Slow II >>  "..tname.."",0xF)
            end
        elseif (lvl >= 13 and mp >= 15) then
            mob:setLocalVar("slowTime",battletime)
            debuff = 56
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Slow >>  "..tname.."",0xF)
            end
        end
    elseif ((battletime > blindTime + blindCooldown) and not target:hasStatusEffect(dsp.effect.BLINDNESS) and mpp > 40) then
        if (lvl > 74 and mp >= 31) then
            mob:setLocalVar("slowTime",battletime)
            debuff = 254
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Blind II >>  "..tname.."",0xF)
            end
        elseif (lvl >= 8 and mp >= 5) then
            mob:setLocalVar("slowTime",battletime)
            debuff = 276
            if (player:getVar("TrustSilence") == 1) then
                local tname = target:getName()
                player:PrintToPlayer("(Koru-Moru) Blind >>  "..tname.."",0xF)
            end
        end
    end

    return debuff
end

function doCureKoru(mob, member)
    local maxhp = member:getMaxHP()
    local hp = member:getHP()
    local hpdif = (maxhp - hp)
    local cureList = {}

    if (hpdif < 45) then
        cureList = {{3,8,1}}
    elseif (hpdif < 125) then
        cureList = {{14,24,2}, {3,8,1}}
    elseif (hpdif < 275) then
        cureList = {{26,46,3}, {14,24,2}, {3,8,1}}
    else
        cureList = {{48,88,4}, {26,46,3}, {14,24,2}, {3,8,1}}
    end

    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local cure = 0

    for i = 1, #cureList do
        if (lvl >= cureList[i][1] and mp >= cureList[i][2]) then
            cure = cureList[i][3]
            break
        end
    end

    local expectedLeft = 0
    local cureNeeded = 0
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



function doHasteKoru(mob)
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local haste = 0

    if (lvl >= 48 and mp >= 40) then
       haste = 57
    end

    return haste
end