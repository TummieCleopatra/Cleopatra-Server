-------------------------------------------------
--  Trust: Adelheid
--  Magic: Cure I-VI, Protect/ra I-IV Shell/ra I-IV
--
--  JA: None
--  WS: Starlight, Moonlight
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/pathfind")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local cureCooldown = 22
    local regenCooldown = 120
    local helixCooldown = 120
    local stormCooldown = 180
    local nukeCooldown = 33
    local subCooldown = 30
    local mbCooldown = 5
    local skill = 0
    local angle = getMageAngle(mob)
    local master = mob:getMaster()
    mob:addStatusEffect(dsp.effect.MAX_MP_BOOST,105,0,0);
    mob:addMP(900)

    adelheidTrustPoints(mob)
    local lvl = mob:getMainLvl()
    if (lvl < 61) then
        skill = (lvl * 0.75) + (lvl * 2)
    else
        skill = (lvl + (lvl * 2)) - (lvl - 62)
    end
    mob:addMod(dsp.mod.ELEM,skill)

    local elem = mob:getMod(dsp.mod.ELEM)
    printf("Elemental Magic is: %u \n", elem)
    -- local ailmentCooldown = 15

    mob:setLocalVar("cureTime",0)
    mob:setLocalVar("helixTime",0)
    -- mob:setLocalVar("ailmentTime",0) Later Feature
    mob:setLocalVar("stormTime",0)
    mob:setLocalVar("nukeTime",0)
    mob:setLocalVar("subTime",0)
    mob:setLocalVar("distanceTime",0)


    local master = mob:getMaster()
    master:setVar("mbTime",0)

    mob:addListener("COMBAT_TICK", "ADEL_DISTANCE_TICK", function(mob, player, target)
        trustMageMove(mob, player, target, angle)
    end)


    mob:addListener("COMBAT_TICK", "STORM_TICK", function(mob, target)
        local battletime = os.time()
        local stormTime = mob:getLocalVar("stormTime")
        local distance = mob:checkDistance(target)
        if (distance ~= 10) then
            if (battletime > stormTime + stormCooldown) then
                local id = mob:getID()
                master:setVar("AdelheidID",id)
                doStorm(mob)
                mob:setLocalVar("stormTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "ADEL_REGEN_TICK", function(mob, player, target)
        local battletime = os.time()
        local regenTime = mob:getLocalVar("regenTime")
        local distance  = mob:checkDistance(target)
        if (distance ~= 10) then
            if (battletime > regenTime + regenCooldown) then
                doRegen(mob, player)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "HELIX_TICK", function(mob, player, target)
        local battletime = os.time()
        local helixTime = mob:getLocalVar("helixTime")
        local distance = mob:checkDistance(target)
        if (distance ~= 10) then
            if (battletime > helixTime + helixCooldown) then
                doHelix(mob, target)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "ADEL_CURE_TICK", function(mob, player, target)
        local battletime = os.time()
        local cureTime = mob:getLocalVar("cureTime")
        local act = mob:getCurrentAction()

        if (act ~= dsp.act.MAGIC_CASTING) then
            mob:setLocalVar("cureCasting",0)  -- Set this to 0 to mean mob is not or is done casting cures
        end

        if (battletime > cureTime + cureCooldown) then
            local party = player:getPartyWithTrusts()
            for _,member in ipairs(party) do
                if (member:getHPP() <= 30) then
                    local spell = doEmergencyCureAdel(mob)
                    if (spell > 0) then
                        mob:castSpell(spell, member)
                        mob:setLocalVar("cureTime",battletime)
                        mob:setLocalVar("magicTime",battletime)
                        break
                    end
                elseif (member:getHPP() <= 55) then

                    local spell, moreCure = doAdelCure(mob, member)
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

    mob:addListener("COMBAT_TICK", "NUKE_TICK", function(mob, player, target)
        local battletime = os.time()
        local nukeTime = mob:getLocalVar("nukeTime")
        if (battletime > nukeTime + nukeCooldown) then
            doNukeAdelheid(mob,player,target)
        end
    end)

    mob:addListener("COMBAT_TICK", "SUB_TICK", function(mob)
        local battletime = os.time()
        local subTime = mob:getLocalVar("subTime")
        local lvl = mob:getMainLvl()
        local mpp = (mob:getMP() / mob:getMaxMP()) * 100
        if (battletime > subTime + subCooldown and lvl >= 25 and mob:hasStatusEffect(dsp.effect.SUBLIMATION_COMPLETE) and mpp < 20) then
            doSublimation(mob)
        elseif (battletime > subTime + subCooldown and lvl >= 25 and mob:hasStatusEffect(dsp.effect.SUBLIMATION_ACTIVATED) == false and mob:hasStatusEffect(dsp.effect.SUBLIMATION_COMPLETE) == false) then
            doSublimation(mob)
        end
    end)

    master:addListener("WEAPONSKILL_USE", "ADEL_SKILLCHAIN", function(player, target, skillid)
        local battletime = os.time()
        local resonance = target:getStatusEffect(dsp.effect.SKILLCHAIN);
        local element = resonance:getPower()
        local mbTime = master:getVar("mbTime")
        if (battletime > (mbTime + mbCooldown)) then
            if (element > 0 and element < 15) then
                doMagicBurst(player,target,element)
            end
            master:setVar("mbTime",battletime)
        end
    end)

--[[
    mob:addListener("COMBAT_TICK", "COMBAT_TICK", function(mob, target)
        if (mob:getTP() >= 1000) then
            weaponskill = doKupipiWeaponskill(mob)
            mob:useMobAbility(weaponskill, mob)
        end
    end)--]]


end

function onMobFight(mob, target)

end

function doStorm(mob)
    printf("Try STORM!!!!!!")
    local dayList = {{0,115}, {1,99}, {2,113}, {3,114}, {4,116}, {5,117}, {6,119}, {7,118}}
    local stormList = {{48,30,119}, {47,30,118}, {46,30,117}, {45,30,116}, {44,30,115}, {43,30,114}, {42,30,113}, {41,30,99}}
    local dayElement = VanadielDayElement()
    printf("Day of the week is %u \n",dayElement)
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local spell = 0
    local storm = 0

    for i = 1, #dayList do
        if (dayElement == dayList[i][1]) then
            spell = dayList[i][2]
            break
        end
    end
    printf("Spell is %u \n",spell)
    for i = 1, #stormList do
        if (lvl >= stormList[i][1] and mp >= stormList[i][2] and spell == stormList[i][3]) then
            storm = stormList[i][3]
            break
        end
    end

    if (storm > 0) then
        if not mob:hasStatusEffect(dsp.effect.DARK_ARTS) then
            mob:useJobAbility(196, mob)
        end
        mob:castSpell(storm, mob)
    else
        printf("Storm not found no appropriate level")
    end

end

function doHelix(mob, target)
    local dayList = {{0,281}, {1,278}, {2,279}, {3,280}, {4,282}, {5,283}, {6,285}, {7,284}} -- (Fire, Earth, Water, Wind, Ice, Thunder, Light, Dark)
    local helixList = {{32,30,285}, {30,30,284}, {28,30,283}, {26,30,282}, {24,30,281}, {22,30,280}, {20,30,279}, {18,30,278}}
    local dayElement = VanadielDayElement()
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local spell = 0
    local helix = 0
    local battletime = os.time()

    -- printf("Day is currently: %u \n",dayElement)
    for i = 1, #dayList do
        if (dayElement == dayList[i][1]) then
            spell = dayList[i][2]
            break
        end
    end

    for i = 1, #helixList do
        if (lvl >= helixList[i][1] and mp >= helixList[i][2] and spell == helixList[i][3]) then
            helix = helixList[i][3]
            break
        end
    end

    if (helix > 0) then
        printf("Trying for helix but first Dark Arts")
        if not mob:hasStatusEffect(dsp.effect.DARK_ARTS) and not target:hasStatusEffect(dsp.effect.HELIX) then
            mob:useJobAbility(196, mob)
        end

        if not target:hasStatusEffect(dsp.effect.HELIX) then
            mob:castSpell(helix)
        end
        mob:setLocalVar("helixTime",battletime)
    end
end

function doNukeAdelheid(mob,player,target)
    -- Table below {Level, MP Cost, SpellID, Day Element}
    local nukeList = {}
    local thp = target:getHPP()
    -- Adelheid Nukes lower tiers when HP of target is high to conserve MP
    if (thp > 60) then
        nukeList = {{75,91,166,5}, {74,75,151,4}, {73,63,146,0}, {72,54,156,3}, {71,46,171,2}, {70,40,161,1},   -- Thunder, Blizard, Fire, Aero, Water, Stone
                    {69,37,165,5}, {66,31,150,4}, {63,26,145,0}, {60,22,155,3}, {57,19,170,2}, {54,16,160,1},
                    {51,9,164,5}, {46,8,149,4}, {42,7,144,0}, {38,6,154,3}, {34,5,169,2}, {30,4,159,1},
                    {24,9,164,5}, {20,8,149,4}, {16,7,144,0}, {12,6,154,3}, {8,5,169,2}, {4,4,159,1}}
    else
        nukeList = {{75,195,167,5}, {74,152,166,4}, {73,135,147,0}, {72,115,157,3}, {71,99,172,2}, {70,88,162,1},   -- Thunder, Blizard, Fire, Aero, Water, Stone
                    {69,91,166,5}, {66,75,151,4}, {63,63,146,0}, {60,54,156,3}, {57,46,171,2}, {54,40,161,1},
                    {51,37,165,5}, {46,31,150,4}, {42,26,145,0}, {38,22,155,3}, {34,19,170,2}, {30,16,160,1},
                    {24,9,164,5}, {20,8,149,4}, {16,7,144,0}, {12,6,154,3}, {8,5,169,2}, {4,4,159,1}}
    end


    local weatherList = {{75,195,167,6}, {74,152,166,7}, {73,135,147,6}, {72,115,157,6}, {71,99,172,7}, {70,88,162,7},   -- Thunder, Blizard, Fire, Aero, Water, Stone
                        {69,91,166,6}, {66,75,151,7}, {63,63,146,6}, {60,54,156,6}, {57,46,171,7}, {54,40,161,7},
                        {51,37,165,6}, {46,31,150,7}, {42,26,145,6}, {38,22,155,6}, {34,19,170,7}, {30,16,160,7},
                        {24,9,164,6}, {20,8,149,7}, {16,7,144,6}, {12,6,154,6}, {8,5,169,7}, {4,4,159,7}}

    local dayElement = VanadielDayElement()
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local thp = target:getHPP()
    local spell = 0
    local splvl = 0;
    local battletime = os.time()
    local hp = target:getHPP()

    if (dayElement < 6) then
        for i = 1, #nukeList do
            if (lvl >= nukeList[i][1] and mp >= nukeList[i][2] and dayElement == nukeList[i][4]) then
                spell = nukeList[i][3]
                splvl = nukeList[i][1]
                break
            end
        end
    else
        for i = 1, #weatherList do
            if (lvl >= weatherList[i][1] and mp >= weatherList[i][2] and dayElement == weatherList[i][4]) then
                spell = weatherList[i][3]
                splvl = weatherList[i][1]
                break
            end
        end
    end

    if (spell > 0) then
        spell = doNukeCheck(mob,player,target,spell,splvl)
        if not mob:hasStatusEffect(dsp.effect.DARK_ARTS) then
            mob:useJobAbility(196, mob)
        end

        -- Addendum: Black
        if (spell == 147 or spell == 152 or spell == 157 or spell == 162 or spell == 167 or spell == 172) then
            mob:useJobAbility(219, mob)
        end

        mob:castSpell(spell)
        -- TODO: Add Bind so she won't move for spellcast
        if (spell == 0) then
            mob:setLocalVar("nukeTime",battletime - 15)
        else
            mob:setLocalVar("nukeTime",battletime)
        end
    end



end
--[[
function doKupipiWeaponskill(mob)
    local wsList = {{43,164}, {1,163}}
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

function doBuff(mob, player)
    local proRaList = {{63,65,128}, {47,46,127}, {27,28,126}, {7,9,125}}
    local proList = {{63,65,46}, {47,46,45}, {27,28,44}, {7,9,43}}
    local shellRaList = {{68,75,133}, {57,56,132}, {37,37,131}, {17,18,130}}
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
    elseif ((battletime > flashTime + flashCooldown) and not target:hasStatusEffect(dsp.effect.FLASH) and lvl >= 45 and mp >= 25) then
        mob:setLocalVar("flashTime",battletime)
        debuff = 112
    end

    return debuff
end
--]]
function doAdelCure(mob, member)
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
        cureList = {{8,8,1}}
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

function doEmergencyCureAdel(mob)
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

    if not mob:hasStatusEffect(dsp.effect.LIGHT_ARTS) then
        mob:useJobAbility(195, mob)
    end

    mob:useJobAbility(201, mob)

    return spell
end

function doMagicBurst(player, target, element)





    --[[ {Element, Level, MP, SpellID}

    {8,75,195,167},{8,69,91,166},{8,51,37,165},{8,24,9,164},     Thunder
    {7,74,152,152},{7,66,75,151},{7,46,31,150},{7,20,8,149},     Bliz
    {6,72,115,157},{6,60,54,156},{6,38,22,155},{6,12,6,154},    Aero
    {5,71,99,172},{5,57,46,171},{5,34,19,170},{5,8,5,169},    Water
    {4,70,88,162},{4,54,40,161},{4,30,16,160},{4,4,4,159},     STone
    {3,73,135,147},{3,63,63,146},{3,42,26,145},{3,16,7,144},     Fire

    --]]
    local mb = 0

    local match =
    {
        {1,32,26,285},                                            -- Light
        {2,30,26,284},                                            -- Dark
        {3,73,135,147},{3,63,63,146},{3,42,26,145},{3,16,7,144},  -- Liquefication
        {4,70,88,162},{4,54,40,161},{4,30,16,160},{4,4,4,159},    -- Scission
        {5,71,99,172},{5,57,46,171},{5,34,19,170},{5,8,5,169},    -- Reverberation
        {6,72,115,157},{6,60,54,156},{6,38,22,155},{6,12,6,154},  -- Detonation
        {7,74,152,152},{7,66,75,151},{7,46,31,150},{7,20,8,149},  -- Induration
        {8,75,195,167},{8,69,91,166},{8,51,37,165},{8,24,9,164},  -- Impaction
        {9,70,88,162},{9,54,40,161},{9,30,16,160},{9,4,4,159},    -- Gravitation
        {10,74,152,152},{10,71,99,172},{10,66,75,151},{10,57,46,171},{10,46,31,150},{10,34,19,170},{10,20,8,149},{10,8,5,169},  -- Distortion
        {11,73,135,147},{11,63,63,146},{11,42,26,145},{11,16,7,144},  -- Fusion
        {12,75,195,167},{12,72,115,157},{12,69,91,166},{12,60,54,156},{12,51,37,165},{12,38,22,155},{12,24,9,164},{12,12,6,154},  -- Fragmentation
        {13,75,195,167},{13,73,135,147},{13,72,115,157},{13,69,91,166},{13,63,63,146},{13,60,54,156},{13,51,37,165},{13,42,26,145},{13,38,22,155},{13,24,9,164},{13,16,7,144},{13,12,6,154},  -- Light
        {14,74,152,152},{14,71,99,172},{14,70,88,162},{14,66,75,151},{14,57,46,171},{14,54,40,161},{14,46,31,150},{14,34,19,170},{14,30,16,160},{14,20,8,149},{14,8,5,169},{14,4,4,159}  -- Darkness
    }

    local mp = 0
    local lvl = 0
    local mob = 0
    local ptmember = player:getVar("AdelheidID")
    local id = 0



    -- Hack to find Adelheid
    local party = player:getPartyWithTrusts()
    for _,member in ipairs(party) do
        id = member:getID()
            printf("PTMember is %u \n",ptmember)
                printf("ID is %u \n",id)
        if (id == ptmember) then
            printf("FOUND MEMBER THAT MATCHES")
            mp = GetMobByID(id):getMP()
            lvl = GetMobByID(id):getMainLvl()
            mob = id
            break
        end
    end

    for i = 1, #match do
        if (element == match[i][1] and lvl >= match[i][2] and mp >= match[i][3]) then
            mb = match[i][4]
            break
        end
    end


    if (id > 0) then
        player:setVar("mbTime", os.time())
        GetMobByID(id):castSpell(mb, target)

    end





    --[[
    if (mb > 0) then
        printf("ADELHEID START CASTING MB!!!!!!!!!!!!!! \n")
        adel:castSpell(mb, target)
    end]]--
end

function doSublimation(mob)

    local battletime = os.time()
    local mp = mob:getMP()
    local maxmp = mob:getMaxMP()
    local dif = ((mp / maxmp) * 100)
    if not mob:hasStatusEffect(dsp.effect.SUBLIMATION_ACTIVATED) then
        mob:useJobAbility(217, mob)
    elseif (mob:hasStatusEffect(dsp.effect.SUBLIMATION_COMPLETE) and dif < 50) then
        mob:useJobAbility(217, mob)
    end

    mob:setLocalVar("subTime",battletime)
end

function doNukeCheck(mob, player, target, spell, splvl)
    -- This function is to determine enmity check based on spell being cast.
    -- TODO: Also will check for the right HP level to cast
    player:PrintToPlayer("Adelheid Enmity Check")
    -- local hp = target:getHPP()
    local enmity = enmityCalc(mob, player, target)
    -- printf("splvl is %u \n",splvl)
    if (splvl >= 70 and enmity < 2000) then
        spell = 0
        -- printf("ADELHEID HAS TOO MUCH ENMITY TO CAST TIER IV!")
        player:PrintToPlayer("Adelheid has too much hate to cast right now! Hate is %u", enmity)
    elseif (splvl >= 54 and enmity < 1600) then
        spell = 0
        -- printf("ADELHEID HAS TOO MUCH ENMITY TO CAST TIER III!")
        player:PrintToPlayer("Adelheid has too much hate to cast right now! Hate is %u", enmity)
    elseif (splvl >= 30 and enmity < 1500) then
        spell = 0
        -- printf("ADELHEID HAS TOO MUCH ENMITY TO CAST TIER II!")
        player:PrintToPlayer("Adelheid has too much hate to cast right now! Hate is %u", enmity)
    elseif (splvl >= 4 and enmity < 1200) then
        spell = 0
        -- printf("ADELHEID HAS TOO MUCH ENMITY TO CAST TIER I!")
        player:PrintToPlayer("Adelheid has too much hate to cast right now! Hate is %u", enmity)
    elseif (enmity == 0) then
        spell = 0
        -- printf("ADELHEID HAS TOO MUCH ENMITY TO CAST ANYTHING!")
        player:PrintToPlayer("Adelheid has too much hate to cast right now! Hate is %u", enmity)
    end

    if (spell ~= 0) then
        -- printf("ADELHEID HAS %u ENMITY DIFFERENCE TO CAST SPELL DO IT! \n",enmity)
    end

    return spell
end

function doRegen(mob, player)
    local regenList = {{59,64,111}, {37,36,110}, {18,15,108}}

    -- For now Regen trigger will be based on HP levels
    -- TODO: Maybe make it hate based?
    -- TODO: AoE regen?
    printf("TRY REGEN!!!!")
    local mp = mob:getMP()
    local lvl = mob:getMainLvl()
    local spell = 0
    local master = mob:getMaster()
    local party = master:getParty()
    local battletime = os.time()

    for _,member in ipairs(party) do
        if (member:getHPP() <= 90) then
            for i = 1, #regenList do
                if (lvl >= regenList[i][1] and mp >= regenList[i][2]) then
                    spell = regenList[i][3]
                    if (spell > 0) then
                        mob:castSpell(spell, member)
                        mob:setLocalVar("regenTime",battletime)
                        break
                    end
                end
            end
        end
    end

end