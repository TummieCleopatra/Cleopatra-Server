require("scripts/globals/status")

function addRune(player, rune)
    local lvl = 0
    local maxRune = 0;

    if (player:getMainJob() == dsp.job.RUN) then
        lvl = player:getMainLvl();
    else
        lvl = player:getSubLvl();
    end

    if (lvl < 30) then
        maxRune = 1;
    elseif (lvl < 60) then
        maxRune = 2;
    else
        maxRune = 3;
    end

    if (player:getActiveRunes() >= maxRune) then
        printf("Remove Active Rune")
        player:removeOldestRune();
    end

    local power = ((math.floor(lvl / 10)) * 3) + 5;
    print(power)
    player:addStatusEffect(rune,power,3,300);
end;

function dominanceCheck(target, effect)

    local ignis = target:countEffect(dsp.effect.IGNIS)
    local gelus = target:countEffect(dsp.effect.GELUS)
    local flabra = target:countEffect(dsp.effect.FLABRA)
    local tellus = target:countEffect(dsp.effect.TELLUS)
    local sulpor = target:countEffect(dsp.effect.SULPOR)
    local unda = target:countEffect(dsp.effect.UNDA)
    local lux = target:countEffect(dsp.effect.LUX)
    local tenebrae = target:countEffect(dsp.effect.TENEBRAE)
    local enSpell = 0
    local power = effect:getPower() / 2;  -- Change this to be based on main hand skill

    printf("The power is %u \n",power)

    local enSpellList = {{523,1},{524,5},{525,4},{526,2},{527,6},{528,3},{529,7},{530,8}}

    if (ignis < 2 and gelus < 2 and flabra < 2 and tellus < 2 and sulpor < 2 and unda < 2 and lux < 2 and tenebrae < 2) then
        printf("No Dominant Rune Found")
        local newRune = target:getNewestRune()
        for i = 1, #enSpellList do
            if (newRune == enSpellList[i][1]) then
                enSpell = enSpellList[i][2]
                break
            end
        end
        target:setMod(dsp.mod.ENSPELL,enSpell)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    elseif (ignis > 1) then
        target:setMod(dsp.mod.ENSPELL,1)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    elseif (gelus > 1) then
        target:setMod(dsp.mod.ENSPELL,5)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    elseif (flabra > 1) then
        target:setMod(dsp.mod.ENSPELL,4)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    elseif (tellus > 1) then
        target:setMod(dsp.mod.ENSPELL,2)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    elseif (sulpor > 1) then
        target:setMod(dsp.mod.ENSPELL,6)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    elseif (unda > 1) then
        target:setMod(dsp.mod.ENSPELL,3)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    elseif (lux > 1) then
        target:setMod(dsp.mod.ENSPELL,7)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    elseif (tenebrae > 1) then
        target:setMod(dsp.mod.ENSPELL,8)
        target:addMod(dsp.mod.ENSPELL_DMG,power)
    end
end

function addVallation(player, effect)
    local lvl = player:getMainLvl()

    local ignis = player:countEffect(dsp.effect.IGNIS)
    local gelus = player:countEffect(dsp.effect.GELUS)
    local flabra = player:countEffect(dsp.effect.FLABRA)
    local tellus = player:countEffect(dsp.effect.TELLUS)
    local sulpor = player:countEffect(dsp.effect.SULPOR)
    local unda = player:countEffect(dsp.effect.UNDA)
    local lux = player:countEffect(dsp.effect.LUX)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)

    player:addMod(dsp.mod.ICEDEF, ignis * 15)
    player:addMod(dsp.mod.WINDDEF, gelus * 15)
    player:addMod(dsp.mod.EARTHDEF, flabra * 15)
    player:addMod(dsp.mod.THUNDERDEF, tellus * 15)
    player:addMod(dsp.mod.WATERDEF, sulpor * 15)
    player:addMod(dsp.mod.FIREDEF, unda * 15)
    player:addMod(dsp.mod.DARKDEF, lux * 15)
    player:addMod(dsp.mod.LIGHTDEF, tenebrae * 15)

    --[[
    player:addMod(dsp.mod.ATT, ignis * ((lvl / 10) + 1))
    player:addMod(dsp.mod.WINDDEF, gelus * 15)
    player:addMod(dsp.mod.EARTHDEF, flabra * 15)
    player:addMod(dsp.mod.THUNDERDEF, tellus * 15)
    player:addMod(dsp.mod.WATERDEF, sulpor * 15)
    player:addMod(dsp.mod.FIREDEF, unda * 15)
    player:addMod(dsp.mod.REGEN, lux * ((lvl / 10) + 1))
    player:addMod(dsp.mod.REFRESH, tenebrae * ((lvl / 37) + 1)) ]]--
    local animation = getVallationAnimation(player)
    player:injectActionPacket(15,1,animation,0)
    player:addStatusEffect(effect,0,3,120);
end;

function getVallationAnimation(player)

    local ignis = player:countEffect(dsp.effect.IGNIS)
    local gelus = player:countEffect(dsp.effect.GELUS)
    local flabra = player:countEffect(dsp.effect.FLABRA)
    local tellus = player:countEffect(dsp.effect.TELLUS)
    local sulpor = player:countEffect(dsp.effect.SULPOR)
    local unda = player:countEffect(dsp.effect.UNDA)
    local lux = player:countEffect(dsp.effect.LUX)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)
    local animation = 0
    local vallationList = {{523,1},{524,2},{525,3},{526,4},{527,5},{528,6},{529,7},{530,8}}

    if (ignis < 2 and gelus < 2 and flabra < 2 and tellus < 2 and sulpor < 2 and unda < 2 and lux < 2 and tenebrae < 2) then
        printf("No Dominant Rune Found")
        local newRune = player:getNewestRune()
        for i = 1, #vallationList do
            if (newRune == vallationList[i][1]) then
                animation = vallationList[i][2]
                break
            end
        end
    elseif (ignis > 1) then
        animation = 1
    elseif (gelus > 1) then
        animation = 2
    elseif (flabra > 1) then
        animation = 3
    elseif (tellus > 1) then
        animation = 4
    elseif (sulpor > 1) then
        animation = 5
    elseif (unda > 1) then
        animation = 6
    elseif (lux > 1) then
        animation = 7
    elseif (tenebrae > 1) then
        animation = 8
    end

    return animation
end

function getLungeElement(player)
    local ignis = player:countEffect(dsp.effect.IGNIS)
    local gelus = player:countEffect(dsp.effect.GELUS)
    local flabra = player:countEffect(dsp.effect.FLABRA)
    local tellus = player:countEffect(dsp.effect.TELLUS)
    local sulpor = player:countEffect(dsp.effect.SULPOR)
    local unda = player:countEffect(dsp.effect.UNDA)
    local lux = player:countEffect(dsp.effect.LUX)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)
    local element = 0
    local lungeList = {{523,2},{524,4},{525,6},{526,8},{527,10},{528,12},{529,14},{530,16}}


    if (ignis < 2 and gelus < 2 and flabra < 2 and tellus < 2 and sulpor < 2 and unda < 2 and lux < 2 and tenebrae < 2) then
        printf("No Dominant Rune Found")
        local newRune = player:getNewestRune()
        for i = 1, #lungeList do
            if (newRune == lungeList[i][1]) then
                element = lungeList[i][2]
                break
            end
        end
    elseif (ignis > 1) then
        element = 2
    elseif (gelus > 1) then
        element = 4
    elseif (flabra > 1) then
        element = 6
    elseif (tellus > 1) then
        element = 8
    elseif (sulpor > 1) then
        element = 10
    elseif (unda > 1) then
        element = 12
    elseif (lux > 1) then
        element = 14
    elseif (tenebrae > 1) then
        element = 16
    end

    return element
end

function getLungeAnimation(skill)
    if skill <= 1 then
        return 16
    elseif skill <= 3 then
        return 15
    elseif skill == 4 then
        return 20
    elseif skill == 5 then
        return 17
    elseif skill <= 7 then
        return 19
    elseif skill == 8 then
        return 21
    elseif skill == 9 then
        return 22
    elseif skill == 10 then
        return 23
    elseif skill == 11 then
        return 18
    elseif skill == 12 then
        return 24
    else
        return 0
    end
end

function pflugResist(player)
    local ignis = player:countEffect(dsp.effect.IGNIS)
    local gelus = player:countEffect(dsp.effect.GELUS)
    local flabra = player:countEffect(dsp.effect.FLABRA)
    local tellus = player:countEffect(dsp.effect.TELLUS)
    local sulpor = player:countEffect(dsp.effect.SULPOR)
    local unda = player:countEffect(dsp.effect.UNDA)
    local lux = player:countEffect(dsp.effect.LUX)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)
    local resList = {{523,242},{524,244},{525,246},{526,251},{527,241},{528,253},{529,243},{530,252}}
    local resistance = 0
    local power = 0

    if (ignis < 2 and gelus < 2 and flabra < 2 and tellus < 2 and sulpor < 2 and unda < 2 and lux < 2 and tenebrae < 2) then
        printf("No Dominant Rune Found")
        local newRune = player:getNewestRune()
        for i = 1, #resList do
            if (newRune == resList[i][1]) then
                resistance = resList[i][2]
                break
            end
        end
        power = 10
    end

    return resistance, power
end