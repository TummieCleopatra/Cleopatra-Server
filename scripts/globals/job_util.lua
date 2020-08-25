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

    local power = ((math.floor(lvl / 10)) * 3) + 5 + (player:getMerit(dsp.merit.MERIT_RUNE_ENHANCE) * 2);

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
    player:injectActionPacket(15,2,animation,0)
    player:addStatusEffect(effect,0,3,120);
end;

function addGambit(player, target, action, effect)
    local lvl = player:getMainLvl()

    local ignis = player:countEffect(dsp.effect.IGNIS)
    local gelus = player:countEffect(dsp.effect.GELUS)
    local flabra = player:countEffect(dsp.effect.FLABRA)
    local tellus = player:countEffect(dsp.effect.TELLUS)
    local sulpor = player:countEffect(dsp.effect.SULPOR)
    local unda = player:countEffect(dsp.effect.UNDA)
    local lux = player:countEffect(dsp.effect.LUX)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)

    target:addMod(dsp.mod.ICEDEF, -(ignis * 10))
    target:addMod(dsp.mod.WINDDEF, -(gelus * 10))
    target:addMod(dsp.mod.EARTHDEF, -(flabra * 10))
    target:addMod(dsp.mod.THUNDERDEF, -(tellus * 10))
    target:addMod(dsp.mod.WATERDEF, -(sulpor * 10))
    target:addMod(dsp.mod.FIREDEF, -(unda * 10))
    target:addMod(dsp.mod.DARKDEF, -(lux * 10))
    target:addMod(dsp.mod.LIGHTDEF, -(tenebrae * 10))

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
    action:speceffect(target:getID(),animation)
    action:animation(target:getID(), 3)
    player:removeAllRunes()
    if target:addStatusEffect(effect,0,3,120) then
        -- skill:setMsg(dsp.msg.basic.SKILL_GAIN_EFFECT)
    else
        ability:setMsg(dsp.msg.basic.JA_NO_EFFECT)
    end

end;

function addRayke(player, target, action, ability, effect)
    local lvl = player:getMainLvl()

    local ignis = player:countEffect(dsp.effect.IGNIS)
    local gelus = player:countEffect(dsp.effect.GELUS)
    local flabra = player:countEffect(dsp.effect.FLABRA)
    local tellus = player:countEffect(dsp.effect.TELLUS)
    local sulpor = player:countEffect(dsp.effect.SULPOR)
    local unda = player:countEffect(dsp.effect.UNDA)
    local lux = player:countEffect(dsp.effect.LUX)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)

    local bonus = player:getMerit(dsp.merit.MERIT_RAYKE)
    target:addMod(dsp.mod.ICERES, -(ignis * 10) + bonus)
    target:addMod(dsp.mod.WINDRES, -(gelus * 10) + bonus)
    target:addMod(dsp.mod.EARTHRES, -(flabra * 10) + bonus)
    target:addMod(dsp.mod.THUNDERRES, -(tellus * 10) + bonus)
    target:addMod(dsp.mod.WATERRES, -(sulpor * 10) + bonus)
    target:addMod(dsp.mod.FIRERES, -(unda * 10) + bonus)
    target:addMod(dsp.mod.DARKRES, -(lux * 10) + bonus)
    target:addMod(dsp.mod.LIGHTRES, -(tenebrae * 10) + bonus)

    target:setLocalVar("ignis", (ignis * 10) + bonus)
    target:setLocalVar("gelus", (gelus * 10) + bonus)
    target:setLocalVar("flabra", (flabra * 10) + bonus)
    target:setLocalVar("tellus", (tellus * 10) + bonus)
    target:setLocalVar("sulpor", (sulpor * 10) + bonus)
    target:setLocalVar("unda", (unda * 10) + bonus)
    target:setLocalVar("lux", (lux * 10) + bonus)
    target:setLocalVar("tenebrae", (tenebrae * 10) + bonus)

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
    action:speceffect(target:getID(),animation)
    action:animation(target:getID(), 1)
    player:removeAllRunes()
    if target:addStatusEffect(effect,0,3,120) then
        -- ability:setMsg(dsp.msg.basic.JA_ENFEEB_IS)
    else
        ability:setMsg(dsp.msg.basic.JA_NO_EFFECT)
    end

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

function getPflugAnimation(player)

    local ignis = player:countEffect(dsp.effect.IGNIS)
    local gelus = player:countEffect(dsp.effect.GELUS)
    local flabra = player:countEffect(dsp.effect.FLABRA)
    local tellus = player:countEffect(dsp.effect.TELLUS)
    local sulpor = player:countEffect(dsp.effect.SULPOR)
    local unda = player:countEffect(dsp.effect.UNDA)
    local lux = player:countEffect(dsp.effect.LUX)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)
    local animation = 0
    local vallationList = {{523,35},{524,37},{525,39},{526,41},{527,43},{528,45},{529,47},{530,49}}

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

function doVivaciousPulse(player, ability)
    local ignis = player:countEffect(dsp.effect.IGNIS)
    local gelus = player:countEffect(dsp.effect.GELUS)
    local flabra = player:countEffect(dsp.effect.FLABRA)
    local tellus = player:countEffect(dsp.effect.TELLUS)
    local sulpor = player:countEffect(dsp.effect.SULPOR)
    local unda = player:countEffect(dsp.effect.UNDA)
    local lux = player:countEffect(dsp.effect.LUX)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)

    local str = (player:getStat(dsp.mod.STR) * ignis) * 0.5
    local int = (player:getStat(dsp.mod.INT) * gelus) * 0.5
    local agi = (player:getStat(dsp.mod.AGI) * flabra) * 0.5
    local vit = (player:getStat(dsp.mod.VIT) * tellus) * 0.5
    local dex = (player:getStat(dsp.mod.DEX) * sulpor) * 0.5
    local mnd = (player:getStat(dsp.mod.MND) * unda) * 0.5
    local chr = (player:getStat(dsp.mod.CHR) * lux) * 0.5

    local divine = player:getSkillLevel(dsp.skill.DIVINE_MAGIC)

    local hp = 10 + math.floor(divine / 2) + (math.floor(str + int + agi + vit + dex + mnd + chr))
    local mp = 0

    return hp, mp
end


-- GEOMANCER


function bellCheck(caster,bell)
    local bell = 0;
    if (caster:getEquipID(dsp.slot.RANGED) == 21460) then
        bell = 1;
	else
	    bell = 2;
	end

    return bell;
end

function doGeoPotency(caster, target, spell)
    -- Potency Table
	local spellId = spell:getID();
    local skill = caster:getSkillLevel(dsp.skill.GEOMANCY);
	local bell = caster:getSkillLevel(dsp.skill.BELL);
	local potency = 1;
	local geobonus = 0;  -- Future use to look at if specific Geomancy+ items are equipped;

	local bolster = 1;
	local pet = caster:getPet();

    if (caster:getEquipID(dsp.slot.MAIN) == 19381) then
        geobonus = 5;
    end

	if (caster:hasStatusEffect(dsp.effect.BOLSTER)) then
	    bolster = 2;
	end

	if (caster:hasStatusEffect(dsp.effect.BLAZE_OF_GLORY)) then
	    bolster = 1.5;
        caster:delStatusEffect(dsp.effect.BLAZE_OF_GLORY)
	end

    -- TODO: Turn this into an array
	-- Delete all Indi
	caster:delStatusEffect(dsp.effect.INDI_REFESH)
    caster:delStatusEffect(dsp.effect.INDI_REGEN)
	caster:delStatusEffect(dsp.effect.INDI_POISON)
	caster:delStatusEffect(dsp.effect.INDI_REFRESH)
	caster:delStatusEffect(dsp.effect.INDI_STR)
	caster:delStatusEffect(dsp.effect.INDI_DEX)
	caster:delStatusEffect(dsp.effect.INDI_VIT)
	caster:delStatusEffect(dsp.effect.INDI_AGI)
	caster:delStatusEffect(dsp.effect.INDI_INT)
	caster:delStatusEffect(dsp.effect.INDI_MND)
	caster:delStatusEffect(dsp.effect.INDI_CHR)
	caster:delStatusEffect(dsp.effect.INDI_FURY)
	caster:delStatusEffect(dsp.effect.INDI_BARRIER)
	caster:delStatusEffect(dsp.effect.INDI_ACUMEN)
	caster:delStatusEffect(dsp.effect.INDI_FEND)
	caster:delStatusEffect(dsp.effect.INDI_PRECISION)
	caster:delStatusEffect(dsp.effect.INDI_VOIDANCE)
	caster:delStatusEffect(dsp.effect.INDI_FOCUS)
	caster:delStatusEffect(dsp.effect.INDI_ATTUNEMENT)
	caster:delStatusEffect(dsp.effect.INDI_WILT)
	caster:delStatusEffect(dsp.effect.INDI_FRAILTY)
	caster:delStatusEffect(dsp.effect.INDI_FADE)
	caster:delStatusEffect(dsp.effect.INDI_MALAISE)
	caster:delStatusEffect(dsp.effect.INDI_SLIP)
	caster:delStatusEffect(dsp.effect.INDI_TOPOR)
	caster:delStatusEffect(dsp.effect.INDI_VEX)
	caster:delStatusEffect(dsp.effect.INDI_LANGUOR)
	caster:delStatusEffect(dsp.effect.INDI_SLOW)
	caster:delStatusEffect(dsp.effect.INDI_PARALYSIS)
	caster:delStatusEffect(dsp.effect.INDI_GRAVITY)

	-- Regen
	if (spellId == 768 or spellId == 798) then
	    potency = ((skill + bell) / 20);
		potency = utils.clamp(potency, 1, 30);
		potency = (potency + (geobonus * 2)) * bolster;
	end
	-- Poison
	if (spell:getID() == 769 or spell:getID() == 799) then
	    potency = ((skill + bell) / 20);
		potency = utils.clamp(potency, 1, 30);
		potency = (potency + (geobonus * 3)) * bolster;
	end
	-- Refresh
	if (spellId == 770 or spellId == 800) then
	    potency = ((skill + bell) / 120);
		potency = utils.clamp(potency, 1, 6);
		potency = (potency + geobonus) * bolster;
	end
	-- Boost STR
	if (spellId == 772 or spellId == 802) then
	    potency = ((skill + bell) / 36);
		potency = utils.clamp(potency, 1, 25);
		potency = (potency + (geobonus * 2)) * bolster;
	end
	-- Boost DEX
	if (spellId == 773 or spellId == 803) then
	    potency = ((skill + bell) / 36);
		potency = utils.clamp(potency, 1, 25);
		potency = (potency + (geobonus * 2)) * bolster;
	end
	-- Boost VIT
	if (spellId == 774 or spellId == 804) then
	    potency = ((skill + bell) / 36);
		potency = utils.clamp(potency, 1, 25);
		potency = (potency + (geobonus * 2)) * bolster;
	end
	-- Boost AGI
	if (spellId == 775 or spellId == 805) then
	    potency = ((skill + bell) / 36);
		potency = utils.clamp(potency, 1, 25);
		potency = (potency + (geobonus * 2)) * bolster;
	end
	-- Boost INT
	if (spellId == 776 or spellId == 806) then
	    potency = ((skill + bell) / 36);
		potency = utils.clamp(potency, 1, 25);
		potency = (potency + (geobonus * 2)) * bolster;
	end
	-- Boost MND
	if (spellId == 777 or spellId == 807) then
	    potency = ((skill + bell) / 36);
		potency = utils.clamp(potency, 1, 25);
		potency = (potency + (geobonus * 2)) * bolster;
	end
	-- Boost CHR
	if (spellId == 778 or spellId == 808) then
	    potency = ((skill + bell) / 36);
		potency = utils.clamp(potency, 1, 25);
		potency = (potency + (geobonus * 2)) * bolster;
	end
	-- Fury
	if (spell:getID() == 779 or spell:getID() == 809) then
	    potency = ((skill + bell) / 26);
		potency = utils.clamp(potency, 4, 35);
		potency = (potency + (geobonus * 2.2)) * bolster;
	end
	-- Barrier (Defense)
	if (spell:getID() == 780 or spell:getID() == 810) then
	    potency = ((skill + bell) / 23);
		potency = utils.clamp(potency, 9, 40);
		potency = (potency + (geobonus * 4.6)) * bolster;
	end
	-- Acumen
	if (spell:getID() == 781 or spell:getID() == 811) then -- Max of 20
	    potency = ((skill + bell) / 45);
		potency = utils.clamp(potency, 3, 20);
		potency = (potency + (geobonus * 3)) * bolster;
	end
	-- Fend (Magic Def Bonus)
	if (spell:getID() == 782 or spell:getID() == 812) then
	    potency = ((skill + bell) / 18);
		potency = utils.clamp(potency, 1, 50);
		potency = (potency + (geobonus * 4)) * bolster;
	end
	-- Precision (Accuracy)
	if (spell:getID() == 783 or spell:getID() == 813) then
	    potency = ((skill + bell) / 18);
		potency = utils.clamp(potency, 1, 50);
		potency = (potency + (geobonus * 5)) * bolster;
	end
	-- Voidance
	if (spell:getID() == 784 or spell:getID() == 814) then
	    potency = ((skill + bell) / 14);
		potency = utils.clamp(potency, 1, 65);
		potency = (potency + (geobonus * 6)) * bolster;
	end
	-- Focus (Magic Accuracy)
	if (spell:getID() == 785 or spell:getID() == 815) then
	    potency = ((skill + bell) / 18);
		potency = utils.clamp(potency, 1, 50);
		potency = (potency + (geobonus * 5)) * bolster;
	end
	-- Attunement
	if (spell:getID() == 786 or spell:getID() == 816) then -- Max of 20
	    potency = ((skill + bell) / 14);
		potency = utils.clamp(potency, 1, 65);
		potency = (potency + (geobonus * 6)) * bolster;
	end
	-- Wilt
	if (spell:getID() == 787 or spell:getID() == 817) then -- NYI
	    potency = ((skill + bell) / 36);
		potency = utils.clamp(potency, 4, 25);
		potency = (potency + (geobonus * 4.6)) * bolster;
	end
	-- Frailty
	if (spell:getID() == 788 or spell:getID() == 818) then -- NYU
	    potency = ((skill + bell) / 60);
		potency = utils.clamp(potency, 3, 15);
		potency = (potency + (geobonus * 2.7)) * bolster;
	end
	-- Fade
	if (spell:getID() == 789 or spell:getID() == 819) then  -- NYI
	    potency = ((skill + bell) / 45);
		potency = utils.clamp(potency, 5, 20);
		potency = (potency + (geobonus * 4)) * bolster;
	end
	-- Malaise
	if (spell:getID() == 790 or spell:getID() == 820) then  -- NYI
	    potency = ((skill + bell) / 60);
		potency = utils.clamp(potency, 3, 15);
		potency = (potency + (geobonus * 3)) * bolster;
	end
	-- Slip
	if (spell:getID() == 791 or spell:getID() == 821) then
	    potency = ((skill + bell) / 65);
		potency = utils.clamp(potency, 1, 14);
		potency = (potency + (geobonus * 6)) * bolster;
	end
	-- Torpor
	if (spell:getID() == 792 or spell:getID() == 822) then
	    potency = ((skill + bell) / 18);
		potency = utils.clamp(potency, 1, 50);
		potency = (potency + (geobonus * 5)) * bolster;
	end
	-- Vex
	if (spell:getID() == 793 or spell:getID() == 823) then
	    potency = ((skill + bell) / 14);
		potency = utils.clamp(potency, 1, 65);
		potency = (potency + (geobonus * 6)) * bolster;
	end
	-- Languor
	if (spell:getID() == 794 or spell:getID() == 824) then
	    potency = ((skill + bell) / 18);
		potency = utils.clamp(potency, 1, 50);
		potency = (potency + (geobonus * 5)) * bolster;
	end
	-- Slow
	if (spell:getID() == 795 or spell:getID() == 825) then
	    potency = ((skill + bell) / 60);
		potency = utils.clamp(potency, 1, 15);
		potency = (potency + (geobonus * 0.5)) * bolster;
	end
	-- Paralysis
	if (spell:getID() == 796 or spell:getID() == 826) then
	    potency = ((skill + bell) / 60);
		potency = utils.clamp(potency, 1, 15);
		potency = (potency + (geobonus * 1)) * bolster;
	end
	-- Gravity
	if (spellId == 797 or spellId == 826) then -- NYI
	    potency = ((skill + bell) / 112);
		potency = utils.clamp(potency, 4, 8);
		potency = (potency + (geobonus * 1)) * bolster;
	end
	-- Slip
	-- Boost STR
	-- Topor
	-- Vex
	-- Wilt

    -- set default potency bonus for Ecliptic Attrition


    return potency;
end

function finalizeLuopan(pet, target, hploss)
    local pos = target:getPos()
    pet:addMod(dsp.mod.REGEN_DOWN, hploss);
    pet:setLocalVar("potboost",1)
    pet:setPos(pos.x,pos.y,pos.z);
    pet:addStatusEffect(dsp.effect.BIND,1,0,3000)
end

function potencyBoost(target,effect)
    if (target:getObjType() == dsp.objType.PET) then
        local potboost = target:getLocalVar("Potency")
        local potency = effect:getPower()
        if (potboost == 1) then
            effect:setPower(potency * 1.25)
            target:setLocalVar("Potency", 0)
        elseif (potboost == 2) then
            effect:setPower(potency * 2)
            target:setLocalVar("Potency", 0)
        end
    end
end

