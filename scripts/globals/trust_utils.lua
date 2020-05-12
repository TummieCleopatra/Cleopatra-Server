-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------


function trustSpawnCheck(caster, target, spell)
    -- Dynamis Check
    local zone = caster:getZoneID();
    local dynamis = caster:getVar("TrustDynamis");
    local bf = caster:getBattlefield()
    local bc = caster:getBattlefieldID()
    local trust = spell:getID()
    local name = ""
    if ((zone >= 185 and zone <= 188) or (zone >= 134 and zone <= 135) and dynamis ~= 1) then
        -- caster:PrintToPlayer("You cannot summon a trust in this area.  Please speak to Maccus in Feretory",0xD);
        return dsp.msg.basic.CANT_BE_USED_IN_AREA
    elseif ((bc == 1377 and trust ~= 902) or (bc == 1378 and trust ~= 899) or (bc == 1379 and trust ~= 900) or
    (bc == 1380 and trust ~= 897) or (bc == 1381 and trust ~= 898) or (bc == 1382 and trust ~= 901) or (bc == 1383 and trust ~= 991) or
    (bc == 1384 and trust ~= 968) or (bc == 1385 and trust ~= 907) or (bc == 1386 and trust ~= 906)) then
        if (bc == 1377) then
            name = "Curilla"
        elseif (bc == 1378) then
            name = "Exenmille"
        elseif (bc == 1379) then
            name = "Ayame"
        elseif (bc == 1380) then
            name = "Naji"
        elseif (bc == 1381) then
            name = "Kupipi"
        elseif (bc == 1382) then
            name = "Nanaa"
        elseif (bc == 1383) then
            name = "Darcuillin"
        elseif (bc == 1384) then
            name = "Adelheid"
        elseif (bc == 1385) then
            name = "Lion"
        elseif (bc == 1386) then
            name = "Zeid"
        end
        caster:PrintToPlayer("You can only summon "..name.." for this fight.",0xD);
        return dsp.msg.basic.CANT_BE_USED_IN_AREA
    else
        return 0
    end
end





function checkDoubleCure(mob, member)
    -- member is the person that needs the cure
    -- Person is the other caster in the party
    local player = mob:getMaster()
    local party = player:getPartyWithTrusts()
    local canCure = 1
    for _,person in ipairs(party) do
        local cureCast = person:getLocalVar("cureCasting")
        if (person:getObjType() == dsp.objType.TRUST and cureCast == 10 and mob:getID() ~= person:getID()) then
            canCure = 0  -- No Cure
        elseif (person:getObjType() == dsp.objType.TRUST and cureCast > 0 and mob:getID() ~= person:getID()) then
            canCure = person:getLocalVar("cureCasting")
        end
    end
    return canCure
end


function checkKoruCure(mob, member)
    -- member is the person that needs the cure
    -- Person is the other caster in the party
    local player = mob:getMaster()
    local party = player:getPartyWithTrusts()
    for _,person in ipairs(party) do
        local cureCast = person:getLocalVar("cureCasting")
        if (person:getObjType() == dsp.objType.TRUST and cureCast == 1) then

            -- printf("SOMEONE ELSE IS CASTING AND SO I SHOULDN'T!!!!!!")
            return false
        end
    end

    return true
end


-- ATT and ACC Fix

function set2HStats(mob)
    local str = mob:getStat(dsp.mod.STR)
    local dex = mob:getStat(dsp.mod.DEX)

    str = math.floor(str * 0.65)
    dex = math.floor(dex * 0.65)
    mob:addMod(dsp.mod.ATT, str)
    mob:addMod(dsp.mod.ACC, dex)
end

function set1HStats(mob)
    local str = mob:getStat(dsp.mod.STR)
    local dex = mob:getStat(dsp.mod.DEX)

    str = math.floor(str * 0.4)
    dex = math.floor(dex * 0.4)
    mob:addMod(dsp.mod.ATT, str)
    mob:addMod(dsp.mod.ACC, dex)
end

-- Armor Types --

function mageArmor(mob)
    local lvl = mob:getMainLvl()
    local def = math.floor(lvl * 1.7)
    mob:addMod(dsp.mod.DEF, def)
end

function hybridArmor(mob)


end


function chainArmor(mob)

end


function plateArmor(mob)
    local lvl = mob:getMainLvl()
    local def = math.floor(lvl * 2.2)
    mob:addMod(dsp.mod.DEF, def)
end



function curillaTrustPoints(mob)
--[[

1  Holy Circle dmg taken
2  VIT + 1
3  STR + 1
4  MND + 1
5  Shield Bash Dmg
6  Sword Skill + 1
7  Shield Skill + 1
8  Healing Skill + 1
9  Enhancing SKill +1
10  Sentinel Effect  ]]--
    local player = mob:getMaster()
    local total = player:getVar("[TRUST]CurillaTokensTotal")
    local rank = player:getVar("[TRUST]CurillaRank")
    local subRank = player:getVar("[TRUST]CurillaSubRank")

    local hcdmg = subRank/1 >= 1 and 1 or 0
    local vit = subRank/2 >= 2 and 1 or 0
    local str = subRank/3 >= 3 and 1 or 0
    local mnd = subRank/4 >= 4 and 1 or 0
    local sbd = subRank/5 >= 5 and 1 or 0
    local shield = subRank/6 >= 6 and 1 or 0
    local sword = subRank/7 >= 7 and 1 or 0
    local healing = subRank/8 >= 8 and 1 or 0
    local enhancing = subRank/9 >= 9 and 1 or 0
    local senm = rank

    mob:setLocalVar("HolyCircleDmg", rank + hcdmg)
    mob:addMod(dsp.mod.VIT, rank + vit)
    mob:addMod(dsp.mod.STR, rank + str)
    mob:addMod(dsp.mod.MND, rank + mnd)
    mob:setLocalVar("sentinelEnm", rank + sbd)
    mob:addMod(dsp.mod.SHIELD, rank + shield)
    mob:addMod(dsp.mod.SWORD, rank + sword)
    mob:addMod(dsp.mod.HEALING, rank + healing)
    mob:addMod(dsp.mod.ENHANCE, rank + enhancing)
    mob:setLocalVar("sentinelEnm", senm)

    -- Gifts
    -- Defense Bonus
    if (total >= 180) then
        mob:addMod(dsp.mod.DEF, 38)
    elseif (total >= 5) then
        mob:addMod(dsp.mod.DEF, 15)
    end

    -- Attack Bonus
    if (total >= 210) then
        mob:addMod(dsp.mod.ATT, 14)
    elseif (total >= 10) then
        mob:addMod(dsp.mod.ATT, 6)
    end

    -- Evasion Bonus
    if (total >= 300) then
        mob:addMod(dsp.mod.EVA, 25
        )
    elseif (total >= 20) then
        mob:addMod(dsp.mod.EVA, 15)
    end

    -- Trust Points +
    if (total >= 550) then
        mob:setLocalVar("[TRUST]CURILLA_POINTS_PLUS",26)
    elseif (total >= 475) then
        mob:setLocalVar("[TRUST]CURILLA_POINTS_PLUS",23)
    elseif (total >= 400) then
        mob:setLocalVar("[TRUST]CURILLA_POINTS_PLUS",20)
    elseif (total >= 325) then
        mob:setLocalVar("[TRUST]CURILLA_POINTS_PLUS",17)
    elseif (total >= 250) then
        mob:setLocalVar("[TRUST]CURILLA_POINTS_PLUS",14)
    elseif (total >= 175) then
        mob:setLocalVar("[TRUST]CURILLA_POINTS_PLUS",11)
    elseif (total >= 100) then
        mob:setLocalVar("[TRUST]CURILLA_POINTS_PLUS",8)
    elseif (total >= 25) then
        mob:setLocalVar("[TRUST]CURILLA_POINTS_PLUS",5)
    end

    -- Accuracy Bonus
    if (total >= 410) then
        mob:addMod(dsp.mod.ACC, 25)
    elseif (total >= 30) then
        mob:addMod(dsp.mod.ACC, 15)
    end

    -- Fast Cast
    if (total >= 425) then
       mob:addMod(dsp.mod.FASTCAST, 20)
    elseif (total >= 230) then
        mob:addMod(dsp.mod.FASTCAST, 15)
    elseif (total >= 130) then
        mob:addMod(dsp.mod.FASTCAST, 10)
    elseif (total >= 50) then
        mob:addMod(dsp.mod.FASTCAST, 5)
    end

    -- Job Abilities
    if (total >= 125) then
        mob:setLocalVar("[TRUST]CURILLA_CHIV",1)
    end

    if (total >= 375) then  -- Change to 300 or 400
        mob:setLocalVar("[TRUST]CURILLA_MAJ",1)
    end

    -- HP
    if (total >= 450) then
        mob:addMod(dsp.mod.HP, 120)
    elseif (total >= 80) then
        mob:addMod(dsp.mod.HP,70)
    end

    if (total >= 500) then
        mob:addMod(dsp.mod.MP,80)
    elseif (total >= 110) then
        mob:addMod(dsp.mod.MP,40)
    end

    -- Savage Blade 150
    -- Enmity + 4 at 70
    -- Enmity + 10 at 525
    -- Cure Potency 5% at 350

end

function excenmilleTrustPoints(mob)
--[[


1   Jump Att Bonus
2   STR + 1
3   VIT + 1
4   DEX + 1
5   AGI + 1
6   Polearm SKill + 1
7   Jump Recast - 1
8   High Jump Recast - 1
9   High Jump Enm REduction + 1
10  Super Jump Recast +5  ]]--

    local player = mob:getMaster()
    local total = player:getVar("[TRUST]ExcenmilleTokensTotal")
    local rank = player:getVar("[TRUST]ExcenmilleRank")
    local subRank = player:getVar("[TRUST]ExcenmilleSubRank")

    local r1 = subRank/1 >= 1 and 1 or 0
    local r2 = subRank/2 >= 2 and 1 or 0
    local r3 = subRank/3 >= 3 and 1 or 0
    local r4 = subRank/4 >= 4 and 1 or 0
    local r5 = subRank/5 >= 5 and 1 or 0
    local r6 = subRank/6 >= 6 and 1 or 0
    local r7 = subRank/7 >= 7 and 1 or 0
    local r8 = subRank/8 >= 8 and 1 or 0
    local r9 = subRank/9 >= 9 and 1 or 0
    local r10 = rank * 5


    mob:addMod(dsp.mod.JUMP_ATT_BONUS, rank + r1)
    mob:addMod(dsp.mod.STR, rank + r2)
    mob:addMod(dsp.mod.VIT, rank + r3)
	mob:addMod(dsp.mod.DEX, rank + r4)
    mob:addMod(dsp.mod.AGI, rank + r5)
    mob:addMod(dsp.mod.POLE, rank + r6)
    mob:setLocalVar("JumpRecast", rank + r7)
	mob:setLocalvar("HighJump",rank + r8)
    mob:addMod(dsp.mod.HIGH_JUMP_ENMITY_REDUCTION, rank + r9)
    mob:setLocalVar("SuperJumpRecast",r10)

    -- Gifts


    -- Attack Bonus 5/180
    if (total >= 180) then
        mob:addMod(dsp.mod.ATT, 20)
    elseif (total >= 5) then
        mob:addMod(dsp.mod.ATT, 12)
    end

    -- Acc Bonus 10/210
    if (total >= 210) then
        mob:addMod(dsp.mod.ACC, 22)
    elseif (total >= 10) then
        mob:addMod(dsp.mod.ACC, 11)
    end

    -- Defense Bonus  20/300
    if (total >= 300) then
        mob:addMod(dsp.mod.DEF, 18)
    elseif (total >= 20) then
        mob:addMod(dsp.mod.DEF, 8)
    end

    -- Trust Points +
    if (total >= 550) then
        mob:setLocalVar("[TRUST]EXCENMILLE_POINTS_PLUS",26)
    elseif (total >= 475) then
        mob:setLocalVar("[TRUST]EXCENMILLE_POINTS_PLUS",23)
    elseif (total >= 400) then
        mob:setLocalVar("[TRUST]EXCENMILLE_POINTS_PLUS",20)
    elseif (total >= 325) then
        mob:setLocalVar("[TRUST]EXCENMILLE_POINTS_PLUS",17)
    elseif (total >= 250) then
        mob:setLocalVar("[TRUST]EXCENMILLE_POINTS_PLUS",14)
    elseif (total >= 175) then
        mob:setLocalVar("[TRUST]EXCENMILLE_POINTS_PLUS",11)
    elseif (total >= 100) then
        mob:setLocalVar("[TRUST]EXCENMILLE_POINTS_PLUS",8)
    elseif (total >= 25) then
        mob:setLocalVar("[TRUST]EXCENMILLE_POINTS_PLUS",5)
    end

    -- Evasion Bonus  30/410
    if (total >= 410) then
        mob:addMod(dsp.mod.EVA, 20)
    elseif (total >= 30) then
        mob:addMod(dsp.mod.EVA, 12)
    end


	 -- CRIT bonus  50/230
    if (total >= 230) then
        mob:addMod(dsp.mod.CRITHITRATE,4)
    elseif (total >= 50) then
        mob:addMod(dsp.mod.CRITHITRATE,2)
    end

    -- HP  70/525
    if (total >= 525) then
        mob:addMod(dsp.mod.HP,100)
    elseif (total >= 70) then
        mob:addMod(dsp.mod.HP,50)
    end

	-- 80/450
	if (total >= 450) then
	    mob:addMod(dsp.mod.ENMITY, -4)
    elseif (total >= 80) then
	    mob:addMod(dsp.mod.ENMITY, -2)
    end

   -- JA Haste
    if (total >= 500) then
        mob:addMod(dsp.mod.HASTE_ABILITY, 8)
    elseif (total >= 110) then
	    mob:addMod(dsp.mod.HASTE_ABILITY, 3)
   end


    -- JA/Spell 125
    if (total >= 125) then
        mob:setLocalVar("[TRUST]EXCENMILLE_ANGON",1)
    end

    -- Damage Limit  350
    if (total >= 350) then
        mob:addMod(dsp.mod.DAMAGE_LIMIT,10)
    end


    -- WS 150
	if (total >= 150) then
	    mob:setLocalVar("[TRUST]EXCENMILLE_WS",1)
	end


    -- JA/Spell 375
    if (total >= 375) then
        mob:setLocalVar("[TRUST]EXCENMILLE_ANGON_BONUS",1)
    end


end

function ayameTrustPoints(mob)
--[[


1   Zanshin + 1
2   STR + 1
3   DEX + 1
4   AGI + 1
5   Store TP +2
6   Great Katana + 1
7   Hasso STR + 1
8   Seigan Def + 1
9   Third Eye Anticipation + 1
10  Meditate +5  ]]--

    local player = mob:getMaster()
    local total = player:getVar("[TRUST]AyameTokensTotal")
    local rank = player:getVar("[TRUST]AyameRank")
    local subRank = player:getVar("[TRUST]AyameSubRank")

    local r1 = subRank/1 >= 1 and 1 or 0
    local r2 = subRank/2 >= 2 and 1 or 0
    local r3 = subRank/3 >= 3 and 1 or 0
    local r4 = subRank/4 >= 4 and 1 or 0
    local r5 = subRank/5 >= 5 and 1 or 0
    local r6 = subRank/6 >= 6 and 1 or 0
    local r7 = subRank/7 >= 7 and 1 or 0
    local r8 = subRank/8 >= 8 and 1 or 0
    local r9 = subRank/9 >= 9 and 1 or 0
    local r10 = rank * 5


    mob:addMod(dsp.mod.ZANSHIN, rank + r1)
    mob:addMod(dsp.mod.STR, rank + r2)
    mob:addMod(dsp.mod.DEX, rank + r3)
	mob:addMod(dsp.mod.AGI, rank + r4)
    mob:addMod(dsp.mod.STORETP, rank + r5)
    mob:addMod(dsp.mod.GKATANA, rank + r6)
    mob:setLocalVar("Hasso", rank + r7)
	mob:setLocalVar("Seigan",rank + r8)
    mob:addMod(dsp.mod.THIRD_EYE_ANTICIPATE_RATE, rank + r9)
    mob:setLocalVar("Meditate",r10)

    -- Gifts


    -- Attack Bonus 5/180
    if (total >= 180) then
        mob:addMod(dsp.mod.ATT, 20)
    elseif (total >= 5) then
        mob:addMod(dsp.mod.ATT, 8)
    end

    -- Acc Bonus 10/210
    if (total >= 210) then
        mob:addMod(dsp.mod.ACC, 20)
    elseif (total >= 10) then
        mob:addMod(dsp.mod.ACC, 10)
    end

    -- Defense Bonus  20/300
    if (total >= 300) then
        mob:addMod(dsp.mod.DEF, 22)
    elseif (total >= 20) then
        mob:addMod(dsp.mod.DEF, 15)
    end

    -- Trust Points +
    if (total >= 550) then
        mob:setLocalVar("[TRUST]AYAME_POINTS_PLUS",26)
    elseif (total >= 475) then
        mob:setLocalVar("[TRUST]AYAME_POINTS_PLUS",23)
    elseif (total >= 400) then
        mob:setLocalVar("[TRUST]AYAME_POINTS_PLUS",20)
    elseif (total >= 325) then
        mob:setLocalVar("[TRUST]AYAME_POINTS_PLUS",17)
    elseif (total >= 250) then
        mob:setLocalVar("[TRUST]AYAME_POINTS_PLUS",14)
    elseif (total >= 175) then
        mob:setLocalVar("[TRUST]AYAME_POINTS_PLUS",11)
    elseif (total >= 100) then
        mob:setLocalVar("[TRUST]AYAME_POINTS_PLUS",8)
    elseif (total >= 25) then
        mob:setLocalVar("[TRUST]AYAME_POINTS_PLUS",5)
    end

    -- Evasion Bonus  30/410
    if (total >= 410) then
        mob:addMod(dsp.mod.EVA, 22)
    elseif (total >= 30) then
        mob:addMod(dsp.mod.EVA, 15)
    end


	 -- Skillchain bonus  50/230
    if (total >= 230) then
        mob:addMod(dsp.mod.SKILLCHAINBONUS,4)
    elseif (total >= 50) then
        mob:addMod(dsp.mod.SKILLCHAINBONUS,2)
    end

	-- 70/525
	if (total >= 525) then
	    mob:addMod(dsp.mod.ENMITY, -8)
    elseif (total >= 350) then
	    mob:addMod(dsp.mod.ENMITY, -6)
    elseif (total >= 70) then
	    mob:addMod(dsp.mod.ENMITY, -4)
    end

    -- HP  80/110/450/500
    if (total >= 500) then
        mob:addMod(dsp.mod.HP,900)
    elseif (total >= 450) then
        mob:addMod(dsp.mod.HP, 70)
    elseif (total >= 110) then
        mob:addMod(dsp.mod.HP,50)
    elseif (total >= 80) then
        mob:addMod(dsp.mod.MP,30)
    end


    -- JA/Spell 125
    if (total >= 125) then
        mob:setLocalVar("[TRUST]MEDITATE_RECAST",20)
    end

    -- Damage Limit  130/425
    if (total >= 425) then
        mob:addMod(dsp.mod.DAMAGE_LIMIT,15)
    elseif (total >= 130) then
        mob:addMod(dsp.mod.DAMAGE_LIMIT,5)
    end


    -- WS 150
	if (total >= 150) then
	    mob:setLocalVar("[TRUST]SEKKANOKI_RECAST",30)
	end


    -- JA/Spell 375
    if (total >= 375) then  -- Change to 300 or 400  -- This needs something
        mob:setLocalVar("[TRUST]SHIKIKOYO",1)
    end


end

function nanaaTrustPoints(mob)
--[[


1   STR + 1
2   DEX + 1
3   AGI + 1
4   VIT + 1
5   MND + 1
6   CHR + 1
7   Dagger Skill + 1
8   Sneak Attack Dex + 1
9   Trick Attack AGi + 1
10  Crit Defense Bonus  ]]--

    local player = mob:getMaster()
    local total = player:getVar("[TRUST]NanaaTokensTotal")
    local rank = player:getVar("[TRUST]NanaaRank")
    local subRank = player:getVar("[TRUST]NanaaSubRank")

    local r1 = subRank/1 >= 1 and 1 or 0
    local r2 = subRank/2 >= 2 and 1 or 0
    local r3 = subRank/3 >= 3 and 1 or 0
    local r4 = subRank/4 >= 4 and 1 or 0
    local r5 = subRank/5 >= 5 and 1 or 0
    local r6 = subRank/6 >= 6 and 1 or 0
    local r7 = subRank/7 >= 7 and 1 or 0
    local r8 = subRank/8 >= 8 and 1 or 0
    local r9 = subRank/9 >= 9 and 1 or 0
    local r10 = rank * 5


    mob:addMod(dsp.mod.STR, rank + r1)
    mob:addMod(dsp.mod.DEX, rank + r2)
    mob:addMod(dsp.mod.AGI, rank + r3)
	mob:addMod(dsp.mod.VIT, rank + r4)
    mob:addMod(dsp.mod.MND, rank + r5)
    mob:addMod(dsp.mod.CHR, rank + r6)
    mob:addMod(dsp.mod.DAGGER, rank + r7)
	mob:addMod(dsp.mod.SNEAK_ATK_DEX, rank + r8)
    mob:addMod(dsp.mod.TRICK_ATK_AGI, rank + r9)
    mob:addMod(dsp.mod.CRIT_DEF_BONUS,r10)

    -- Gifts


    -- Attack Bonus 5/180
    if (total >= 180) then
        mob:addMod(dsp.mod.ATT, 25)
    elseif (total >= 5) then
        mob:addMod(dsp.mod.ATT, 12)
    end

    -- Acc Bonus 10/210
    if (total >= 210) then
        mob:addMod(dsp.mod.ACC, 20)
    elseif (total >= 10) then
        mob:addMod(dsp.mod.ACC, 11)
    end

    -- Evasion Bonus  20/300
    if (total >= 300) then
        mob:addMod(dsp.mod.EVA, 20)
    elseif (total >= 20) then
        mob:addMod(dsp.mod.EVA, 10)
    end

    -- Defense Bonus  30/410
    if (total >= 300) then
        mob:addMod(dsp.mod.DEF, 35)
    elseif (total >= 20) then
        mob:addMod(dsp.mod.DEF, 18)
    end

    -- Trust Points +
    if (total >= 550) then
        mob:setLocalVar("[TRUST]NANAA_POINTS_PLUS",26)
    elseif (total >= 475) then
        mob:setLocalVar("[TRUST]NANAA_POINTS_PLUS",23)
    elseif (total >= 400) then
        mob:setLocalVar("[TRUST]NANAA_POINTS_PLUS",20)
    elseif (total >= 325) then
        mob:setLocalVar("[TRUST]NANAA_POINTS_PLUS",17)
    elseif (total >= 250) then
        mob:setLocalVar("[TRUST]NANAA_POINTS_PLUS",14)
    elseif (total >= 175) then
        mob:setLocalVar("[TRUST]NANAA_POINTS_PLUS",11)
    elseif (total >= 100) then
        mob:setLocalVar("[TRUST]NANAA_POINTS_PLUS",8)
    elseif (total >= 25) then
        mob:setLocalVar("[TRUST]NANAA_POINTS_PLUS",5)
    end

	 -- SA Crit Bonus  50/425
    if (total >= 425) then
        mob:addMod(dsp.mod.AUGMENTS_SA, 2)
    elseif (total >= 50) then
        mob:addMod(dsp.mod.AUGMENTS_TA, 1)
    end

	 -- TA Crit Bonus  70/525
    if (total >= 525) then
        mob:addMod(dsp.mod.AUGMENTS_TA,2)
    elseif (total >= 70) then
        mob:addMod(dsp.mod.AUGMENTS_TA,1)
    end


	-- CRIT bonus  80/450
    if (total >= 230) then
        mob:addMod(dsp.mod.CRITHITRATE,7)
    elseif (total >= 50) then
        mob:addMod(dsp.mod.CRITHITRATE,4)
    end

    -- CRIT DMG BONUS 110/500
	if (total >= 500) then
	    mob:addMod(dsp.mod.CRIT_DMG_INCREASE,5)
	elseif (total >= 110) then
	    mob:addMod(dsp.mod.CRIT_DMG_INCREASE, 2)
	end



    -- JA/Spell 125
    if (total >= 125) then
        mob:setLocalVar("[TRUST]NANAA_FEINT",1)
    end

    -- JA/Spell 130
    if (total >= 130) then
        mob:setLocalVar("[TRUST]NANAA_SA_RECAST",5)
    end

    -- WS 150
	if (total >= 150) then
	    mob:setLocalVar("[TRUST]NANAA_WS",1)
	end

    -- JA/Spell 230
    if (total >= 230) then
        mob:setLocalVar("[TRUST]NANAA_TA_RECAST",5)
    end

    -- HP+  350
    if (total >= 350) then
        mob:addMod(dsp.mod.HP,110)
    end

    -- Ability Haste 375
    if (total >= 375) then
        mob:addMod(dsp.mod.HASTE_ABILITY, 500)
    end



end

function kupipiTrustPoints(mob)
--[[


1   MND + 1
2   CHR + 1
3   STR + 1
4   Cure Casting -1%
5   Healing Skill + 1
6   Enhancing Skill + 1
7   Divine Skill + 1
8   Enfeebling
9   Club Skill +1
10  Cure Potency + 1%  ]]--

    local player = mob:getMaster()
    local total = player:getVar("[TRUST]KupipiTokensTotal")
    local rank = player:getVar("[TRUST]KupipiRank")
    local subRank = player:getVar("[TRUST]KupipiSubRank")

    local mnd = subRank/1 >= 1 and 1 or 0
    local chr = subRank/2 >= 2 and 1 or 0
    local str = subRank/3 >= 3 and 1 or 0
    local cc = subRank/4 >= 4 and 1 or 0
    local heal = subRank/5 >= 5 and 1 or 0
    local enh = subRank/6 >= 6 and 1 or 0
    local div = subRank/7 >= 7 and 1 or 0
    local enf = subRank/8 >= 8 and 1 or 0
    local club = subRank/9 >= 9 and 1 or 0
    local curepot = rank


    mob:addMod(dsp.mod.MND, rank + mnd)
    mob:addMod(dsp.mod.CHR, rank + chr)
    mob:addMod(dsp.mod.STR, rank + str)
	mob:addMod(dsp.mod.CURE_CAST_TIME, rank + cc)
    mob:addMod(dsp.mod.HEAL, rank + heal)
    mob:addMod(dsp.mod.ENHANCE, rank + enh)
    mob:addMod(dsp.mod.DIVINE, rank + div)
    mob:addMod(dsp.mod.ENFEEBLE, rank + enf)
    mob:addMod(dsp.mod.CLUB, rank + club)
    mob:addMod(dsp.mod.CURE_POTENCY, curepot)

    -- Gifts


    -- Attack Bonus
    if (total >= 180) then
        mob:addMod(dsp.mod.ATT, 22)
    elseif (total >= 5) then
        mob:addMod(dsp.mod.ATT, 10)
    end

    -- Defense Bonus
    if (total >= 210) then
        mob:addMod(dsp.mod.DEF, 40)
    elseif (total >= 10) then
        mob:addMod(dsp.mod.DEF, 18)
    end

    -- Evasion Bonus
    if (total >= 300) then
        mob:addMod(dsp.mod.EVA, 28)
    elseif (total >= 20) then
        mob:addMod(dsp.mod.EVA, 16)
    end

    -- Trust Points +
    if (total >= 550) then
        mob:setLocalVar("[TRUST]KUPIPI_POINTS_PLUS",26)
    elseif (total >= 475) then
        mob:setLocalVar("[TRUST]KUPIPI_POINTS_PLUS",23)
    elseif (total >= 400) then
        mob:setLocalVar("[TRUST]KUPIPI_POINTS_PLUS",20)
    elseif (total >= 325) then
        mob:setLocalVar("[TRUST]KUPIPI_POINTS_PLUS",17)
    elseif (total >= 250) then
        mob:setLocalVar("[TRUST]KUPIPI_POINTS_PLUS",14)
    elseif (total >= 175) then
        mob:setLocalVar("[TRUST]KUPIPI_POINTS_PLUS",11)
    elseif (total >= 100) then
        mob:setLocalVar("[TRUST]KUPIPI_POINTS_PLUS",8)
    elseif (total >= 25) then
        mob:setLocalVar("[TRUST]KUPIPI_POINTS_PLUS",5)
    end

    -- Accuracy Bonus
    if (total >= 410) then
        mob:addMod(dsp.mod.ACC, 25)
    elseif (total >= 30) then
        mob:addMod(dsp.mod.ACC, 15)
    end

    -- Shell Bonus
    if (total >= 425) then
        mob:setLocalVar("shell",2)
    elseif (total >= 130) then
        mob:setLocalVar("shell",1)
    end

	 -- Protect bonus
    if (total >= 230) then
        mob:setLocalVar("protect",8)
    elseif (total >= 50) then
        mob:setLocalVar("protect",4)
    end


    -- Shell and Pro
    if (total >= 125) then
        mob:setLocalVar("[TRUST]KUPIPI_SHELLPROV",1)
    end

    if (total >= 375) then  -- Change to 300 or 400  -- This needs something
        mob:addMod(dsp.mod.CURE2MP_PERCENT, 5)
    end

    -- MP
    if (total >= 450) then
        mob:addMod(dsp.mod.MP, 130)
    elseif (total >= 80) then
        mob:addMod(dsp.mod.MP,90)
    end

    -- HP
    if (total >= 500) then
        mob:addMod(dsp.mod.HP,80)
    elseif (total >= 110) then
        mob:addMod(dsp.mod.HP,40)
    end

    -- Savage Blade 150
	if (total >= 150) then
	    mob:setLocalVar("[TRUST]KUPIPI_BH",1)
	end

	if (total >= 525) then
	    mob:addMod(dsp.mod.ENMITY, -15)
    elseif (total >= 70) then
	    mob:addMod(dsp.mod.ENMITY, -10)
    end

	if (total >= 350) then
	    mob:addMod(dsp.mod.REGEN_MULTIPLIER, 5)
	end
end

function zeidTrustPoints(mob)
    local player = mob:getMaster()
	local att = player:getVar("TrustAtt_Zeid");
	local acc = player:getVar("TrustAcc_Zeid");
	local oa = player:getVar("TrustOA_Zeid");
	local db = player:getVar("TrustDB_Zeid");

    mob:addMod(dsp.mod.ATT, att)
    mob:addMod(dsp.mod.ACC, acc)
    mob:addMod(dsp.mod.OCCULT_ACUMEN, oa)
    mob:addMod(dsp.mod.DESPERATE_BLOWS,db)

end

function lionTrustPoints(mob)
function lionTrustPoints(mob)
--[[


1   STR + 1
2   DEX + 1
3   AGI + 1
4   VIT + 1
5   MND + 1
6   CHR + 1
7   Dagger Skill + 1
8   Sneak Attack Dex + 1
9   Trick Attack AGi + 1
10  Crit Defense Bonus  ]]--

    local player = mob:getMaster()
    local total = player:getVar("[TRUST]LionTokensTotal")
    local rank = player:getVar("[TRUST]LionRank")
    local subRank = player:getVar("[TRUST]LionSubRank")

    local r1 = subRank/1 >= 1 and 1 or 0
    local r2 = subRank/2 >= 2 and 1 or 0
    local r3 = subRank/3 >= 3 and 1 or 0
    local r4 = subRank/4 >= 4 and 1 or 0
    local r5 = subRank/5 >= 5 and 1 or 0
    local r6 = subRank/6 >= 6 and 1 or 0
    local r7 = subRank/7 >= 7 and 1 or 0
    local r8 = subRank/8 >= 8 and 1 or 0
    local r9 = subRank/9 >= 9 and 1 or 0
    local r10 = rank * 5


    mob:addMod(dsp.mod.STR, rank + r1)
    mob:addMod(dsp.mod.DEX, rank + r2)
    mob:addMod(dsp.mod.AGI, rank + r3)
	mob:addMod(dsp.mod.VIT, rank + r4)
    mob:addMod(dsp.mod.MND, rank + r5)
    mob:addMod(dsp.mod.CHR, rank + r6)
    mob:addMod(dsp.mod.DAGGER, rank + r7)
	mob:addMod(dsp.mod.SNEAK_ATK_DEX, rank + r8)
    mob:addMod(dsp.mod.TRICK_ATK_AGI, rank + r9)
    mob:addMod(dsp.mod.CRIT_DEF_BONUS,r10)

    -- Gifts


    -- Attack Bonus 5/180
    if (total >= 180) then
        mob:addMod(dsp.mod.ATT, 25)
    elseif (total >= 5) then
        mob:addMod(dsp.mod.ATT, 12)
    end

    -- Acc Bonus 10/210
    if (total >= 210) then
        mob:addMod(dsp.mod.ACC, 20)
    elseif (total >= 10) then
        mob:addMod(dsp.mod.ACC, 11)
    end

    -- Evasion Bonus  20/300
    if (total >= 300) then
        mob:addMod(dsp.mod.EVA, 20)
    elseif (total >= 20) then
        mob:addMod(dsp.mod.EVA, 10)
    end

    -- Defense Bonus  30/410
    if (total >= 300) then
        mob:addMod(dsp.mod.DEF, 35)
    elseif (total >= 20) then
        mob:addMod(dsp.mod.DEF, 18)
    end

    -- Trust Points +
    if (total >= 550) then
        mob:setLocalVar("[TRUST]LION_POINTS_PLUS",26)
    elseif (total >= 475) then
        mob:setLocalVar("[TRUST]LION_POINTS_PLUS",23)
    elseif (total >= 400) then
        mob:setLocalVar("[TRUST]LION_POINTS_PLUS",20)
    elseif (total >= 325) then
        mob:setLocalVar("[TRUST]LION_POINTS_PLUS",17)
    elseif (total >= 250) then
        mob:setLocalVar("[TRUST]LION_POINTS_PLUS",14)
    elseif (total >= 175) then
        mob:setLocalVar("[TRUST]LION_POINTS_PLUS",11)
    elseif (total >= 100) then
        mob:setLocalVar("[TRUST]LION_POINTS_PLUS",8)
    elseif (total >= 25) then
        mob:setLocalVar("[TRUST]LION_POINTS_PLUS",5)
    end

	 -- SA Crit Bonus  50/425
    if (total >= 425) then
        mob:addMod(dsp.mod.AUGMENTS_SA, 2)
    elseif (total >= 50) then
        mob:addMod(dsp.mod.AUGMENTS_TA, 1)
    end

	 -- TA Crit Bonus  70/525
    if (total >= 525) then
        mob:addMod(dsp.mod.AUGMENTS_TA,2)
    elseif (total >= 70) then
        mob:addMod(dsp.mod.AUGMENTS_TA,1)
    end


	-- CRIT bonus  80/450
    if (total >= 230) then
        mob:addMod(dsp.mod.CRITHITRATE,7)
    elseif (total >= 50) then
        mob:addMod(dsp.mod.CRITHITRATE,4)
    end

    -- CRIT DMG BONUS 110/500
	if (total >= 500) then
	    mob:addMod(dsp.mod.CRIT_DMG_INCREASE,5)
	elseif (total >= 110) then
	    mob:addMod(dsp.mod.CRIT_DMG_INCREASE, 2)
	end



    -- JA/Spell 125
    if (total >= 125) then
        mob:setLocalVar("[TRUST]LION_AC",1)
    end

    -- JA/Spell 130
    if (total >= 130) then
        mob:setLocalVar("[TRUST]LION_SA_RECAST",5)
    end

    -- WS 150
	if (total >= 150) then
	    mob:addMod(dsp.mod.ALL_WSDMG_ALL_HITS, 7)
	end

    -- JA/Spell 230
    if (total >= 230) then
        mob:setLocalVar("[TRUST]LION_TA_RECAST",5)
    end

    -- HP+  350
    if (total >= 350) then
        mob:addMod(dsp.mod.HP,110)
    end

    -- Ability Haste 375
    if (total >= 375) then
        mob:addMod(dsp.mod.HASTE_ABILITY, 500)
    end


end

end

function adelheidTrustPoints(mob)
    local player = mob:getMaster()
	local matt = player:getVar("TrustMatt_Adel");
	local macc = player:getVar("TrustMacc_Adel");
	local mp = player:getVar("TrustMP_Adel");
	-- local sub = player:getVar("TrustSub_Adel");     // Script Sublimation Adel

    mob:addMod(dsp.mod.MATT, matt)
    mob:addMod(dsp.mod.MACC, macc)
    mob:addMod(dsp.mod.MP, mp)
   -- mob:addMod(dsp.mod.ZANSHIN,zan)

end

function darcTrustPoints(mob)
    local player = mob:getMaster()
	local att = player:getVar("TrustAtt_Darc");
	local acc = player:getVar("TrustAcc_Darc");
	local mp = player:getVar("TrustMP_Darc");
	local macc = player:getVar("TrustMA_Darc");
    -- local att = player:getVar("TrustCA_Darc");       // Script Chain Affinity
    mob:addMod(dsp.mod.ATT, att)
    mob:addMod(dsp.mod.ACC, acc)
    mob:addMod(dsp.mod.MP, mp)
    mob:addMod(dsp.mod.MACC,macc)

end

function najiTrustPoints(mob)
    local player = mob:getMaster()
	local att = player:getVar("TrustAtt_Naji");
	local acc = player:getVar("TrustAcc_Naji");
	local da = player:getVar("TrustDA_Naji");
	    -- int32 berserkNaji = charutils::GetVar(PChar, "TrustBerserk_Naji");	// Script Berserk

    mob:addMod(dsp.mod.ATT, att)
    mob:addMod(dsp.mod.ACC, acc)
    mob:addMod(dsp.mod.DOUBLE_ATTACK, da)

end

function enmityFromCure(caster, final)

    local lvl = caster:getMainLvl()
    local modCure = 0
    local ce = 0
    local ve = 0

    local modifier = caster:getMod(dsp.mod.ENMITY)
    modifier = (1 + (modifier / 100))

    if (lvl <= 10) then
        modCure = lvl + 10
    elseif (lvl <= 50) then
        modCure = 20 + (lvl - 10) / 20
    else
        modCure = 40 + (lvl - 50) * 0.6
    end

    ce = ((40 / modCure) * final) * modifier
    ve = ((240 / modCure) * final) * modifier
    local total = ce + ve
    local nearbyTargets = caster:getTargetsWithinArea(12, 8);
    for i,member in ipairs(nearbyTargets) do
	    if (member:getObjType() == dsp.objType.MOB) then
            local enmitylist = member:getEnmityList()
            for _,enmity in ipairs(enmitylist) do
                if (enmity.active and enmity.entity:getID() == caster:getID()) then
		            local mob = member:getID();
                    GetMobByID(mob):addEnmity(caster, ce, ve)
                    -- printf("Total Cure Enmity is %u", total)
                end
            end
        end
    end
end

function trustGodMode(mob)

    mob:addMod(dsp.mod.REGAIN, 500)
    mob:addMod(dsp.mod.REGEN, 400)




end

function debugEnmity(mob, player, target)

    local trustID = mob:getID()
    local playerID = player:getID()
    local party = player:getPartyWithTrusts()
    local ce = 0
    local ve = 0
    local total = 0

    local cur = 0
    local me = 0


    for i, member in ipairs(party) do
        ce = target:getCE(member)
        ve = target:getVE(member)
        total = ve + ce
        local id = member:getID()
        if (id == trustID) then
            cur = total
        elseif (id == player:getID()) then
            me = total
        end
    end

    -- printf("Trust: %u ------------------- Me: %u",cur,me)
end


function enmityCalc(mob, player, target)

    local trustID = mob:getID()
    local trustEnmity = 0
    local party = player:getPartyWithTrusts()
    local ce = 0
    local ve = 0
    local total = 0
    local highest = 0
    local highestID = 0
    local diff = 0
    local enmityList = {}

    for i, member in ipairs(party) do
        ce = target:getCE(member)
        ve = target:getVE(member)
        total = ve + ce
        local id = member:getID()

        if (total == 0) then
            total = -1 -- No Hate
        end

        if (id == trustID) then
            -- printf("Trust Enmity ID Triggered")
            -- printf("CE is %u \n",ce)
            -- printf("VE is %u \n",ve)
            -- printf("New Total is %u \n",total)
            trustEnmity = total
        end

        table.insert(enmityList, i, {total, id})
    end

    -- printf("Trust Total Enmity is %u \n",trustEnmity)

    for i, v in pairs(enmityList) do
        if (v[1] > highest) then
            highest = v[1]
            highestID = v[2]
        end
    end

    if (trustID ~= highestID) then
        -- printf("Trust Enmity is: %u \n",trustEnmity)
        -- printf("Highest Enmity is: %u \n",highest)
        diff = (highest - trustEnmity)
        -- printf("HATE LEVEL DIFF IS: %u \n",diff)
    else
        diff = 0
        -- printf("Trust Enmity is: %u \n",trustEnmity)
        -- printf("Highest Enmity is: %u \n",highest)
        -- printf("TRUST HAS HATE!! DIFF IS: %u \n",diff)
    end
    return diff
end

function getWeakness(mob, player, target)

    local weak = 0

    local fire = target:getMod(dsp.mod.FIRERES)
    local ice = target:getMod(dsp.mod.ICERES)
    local wind = target:getMod(dsp.mod.WINDRES)
    local earth = target:getMod(dsp.mod.EARTHRES)
    local thunder = target:getMod(dsp.mod.THUNDERRES)
    local water = target:getMod(dsp.mod.WATERRES)
    local light = target:getMod(dsp.mod.LIGHTRES)
    local dark = target:getMod(dsp.mod.DARKRES)

    if (fire > 1000) then
        weak = 1
    elseif (ice > 1000) then
        weak = 5
    elseif (wind > 1000) then
        weak = 2
    elseif (earth > 1000) then
        weak = 6
    elseif (thunder > 1000) then
        weak = 3
    elseif (water > 1000) then
        weak = 7
    elseif (light > 1000) then
        weak = 4
    elseif (dark > 1000) then
        weak = 8
    end

    return weak
end

-- ---------------------------- --
--     Who's in the Party?      --
-- ---------------------------- --


function isCurillaInParty(mob, player, target)
    local curilla = 0
    local party = player:getPartyWithTrusts()
    local id = 0

    for i, member in ipairs(party) do
        if (member:getName() == "Curilla") then
            curilla = 1
            id = mob:getID()

            break
        end
    end

    return curilla, id
end

function isKupipiInParty(mob, player, target)
    local kupipi = 0
    local koru = 0
    local mp = 0
    local maxmp = 0
    local kupmp = 0
    local party = player:getPartyWithTrusts()

    for i, member in ipairs(party) do
        if (member:getName() == "Kupipi" or member:getName() == "Kupipi-W" or member:getName() == "Kupipi-R") then
            kupipi = 1
            mp = member:getMP()
            maxmp = member:getMaxMP()
            kupmp = math.floor((mp / maxmp) * 100)
            break
        end
    end

    return kupipi, kupmp
end

function isKoruInParty(mob, player, target)
    local koru = 0
    local mp = 0
    local maxmp = 0
    local korump = 0
    local party = player:getPartyWithTrusts()

    for i, member in ipairs(party) do
        if (member:getName() == "Koru-Moru") then
            koru = 1
            mp = member:getMP()
            maxmp = member:getMaxMP()
            korump = math.floor((mp / maxmp) * 100)
            break
        end
    end

    return koru, korump
end

function isPrisheInParty(mob, player, target)
    local prishe = 0
    local party = player:getPartyWithTrusts()

    for i, member in ipairs(party) do
        if (member:getName() == "Prishe") then
            lion = 1
            break
        end
    end

    return prishe
end

function isZeidInParty(mob, player, target)
    local zeid = 0
    local party = player:getPartyWithTrusts()

    for i, member in ipairs(party) do
        if (member:getName() == "Zeid-S") then
            zeid = 1
            break
        end
    end

    return zeid
end

function isLionInParty(mob, player, target)
    local lion = 0
    local party = player:getPartyWithTrusts()

    for i, member in ipairs(party) do
        if (member:getName() == "Lion") then
            zeid = 1
            break
        end
    end

    return lion
end

function getLionTPPrishe(mob, player, target)
    local tp = 0
    local party = player:getPartyWithTrusts()

    for i, member in ipairs(party) do
        if (member:getName() == "Lion") then
            tp = member:getTP()
            break
        end
    end
    return tp
end

function getZeidTP(mob, player, target)
    local tp = 0
    local party = player:getPartyWithTrusts()

    for i, member in ipairs(party) do
        if (member:getName() == "Zeid-S") then
            tp = member:getTP()
            break
        end
    end
    return tp
end

function getLionTP(mob, player, target)
    local tp = 0
    local lastWStime = 0
    local lastWS = 0
    local party = player:getPartyWithTrusts()


    for i, member in ipairs(party) do
        if (member:getName() == "Lion") then
            tp = member:getTP()
            lastWStime = member:getLocalVar("lastWSTime")
            lastWS = member:getLocalVar("lastWS")
            break
        end
    end

    return tp,lastWStime,lastWS
end

function getPrisheTP(mob, player, target)
    local tp = 0
    local lastWStime = 0
    local lastWS = 0
    local party = player:getPartyWithTrusts()


    for i, member in ipairs(party) do
        if (member:getName() == "Prishe") then
            tp = member:getTP()
            lastWStime = member:getLocalVar("lastWSTime")
            lastWS = member:getLocalVar("lastWS")
            break
        end
    end

    return tp,lastWStime,lastWS
end

function doRangedAttack(target, mob, numhits, dmg)
    if (mob:getSubJob() == dsp.job.SAM) then
        if (dmg > 0) then
            target:addTP(20 * numhits)
            mob:addTP(245 * numhits)
            if (mob:hasStatsEffect(dsp.effect.BARRAGE)) then
                mob:delStatusEffect(dsp.effect.BARRAGE)
            end
        end
    else
        if (dmg > 0) then
            target:addTP(20 * numhits)
            mob:addTP(200 * numhits)
            if (mob:hasStatusEffect(dsp.effect.BARRAGE)) then
                mob:delStatusEffect(dsp.effect.BARRAGE)
            end
        end
    end
end

function doBarrage(target, mob)
    local racc = mob:getRACC()
    local eva = target:getEVA()
    local lvl = mob:getMainLvl()
    local barrage = 0
    local hits = 0

    -- printf("Ranged Acc is %u",racc)

    if (lvl < 50) then
        barrage = 4
    elseif (lvl < 74) then
        barrage = 5
    else
        barrage = 6
    end

    local hitRate = 75 + math.floor((racc - eva) / 2)
    if (hitRate >= 95) then
        hitRate = 95
    elseif (hitRate <= 20) then
        hitRate = 20
    end

    -- printf("Hit Rate is %u",hitRate)
    for i = 1, barrage, 1 do
        local chance = math.random(1,100)
       -- printf("Chance is %u",chance)

        if (chance > hitRate) then
            break
        else
            hits = hits + 1
        end
    end

    -- printf("Number of hits is %u",hits)
    return hits

end

function calcAngle(mob, target)


end

function getAngle(mob)
    local master = mob:getMaster()
    local angle = math.random(20, 180)
    local party = master:getPartyWithTrusts()
    local trust = 0

    for i,member in ipairs(party) do
        if (member:getObjType() == dsp.objType.TRUST) then
            trust = trust + 1
        end
    end

    if (trust == 1) then
        angle = 85
    elseif (trust == 2) then
        angle = 115
    elseif (trust == 3) then
        angle = 70
    elseif (trust == 4) then
        angle = 130
    elseif (trust == 5) then
        angle = 55
    end

    return angle;
end

function doUtsusemi(mob, player, target)
    local lvl = mob:getMainLvl()
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

    if ((battletime > utsuNi + 45) and lvl >= 74 and (count == nil or count <= 1)) then
        mob:castSpell(339, mob)
        mob:setLocalVar("utsuNiTime",battletime)
    elseif ((battletime > utsuIchi + 30) and lvl >= 24 and (count == nil)) then
        mob:castSpell(338, mob)
        mob:setLocalVar("utsuIchiTime",battletime)
    end
end

-- ------------------------- --
--   Custom movement         --
-------------------------------

function trustSneakAttackMove(mob, player, target)
    local enmity = enmityCalc(mob, player, target)
    local size = target:getModelSize() -- Take size of model to account

    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING and enmity ~= 0) then
        mob:moveToDistance(size + 2, 100, target)
    end
end

function trustTrickAttackMove(mob, player, target, id)

    local size = target:getModelSize() -- Take size of model to account
    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING) then

         mob:moveToDistanceFacing(size + 2.7, target)
    end
end

function trustMeleeMove(mob, player, target, angle)
    local battletime = mob:getBattleTime()
    local enmity = enmityCalc(mob, player, target)
    local distance = mob:checkDistance(target)
    local size = target:getModelSize() -- Take size of model to account
    local test = mob:getAngle(target)
    -- Todo: Maybe put bard closer to the mob, maybe remove size
    -- if (battletime < 10) then
    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING and enmity ~= 0) then

        mob:moveToDistance(size + 2.5, angle, target)
    end
end

function trustRangedMove(mob, player, target, angle)
    local enmity = enmityCalc(mob, player, target)

    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING and enmity ~= 0) then
        mob:moveToDistance(14, angle, target)
    end
end

function trustMageMove(mob, player, target, angle)
    local enmity = enmityCalc(mob, player, target)
    local size = target:getModelSize() -- Take size of model to account

    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING and enmity ~= 0) then
        mob:moveToDistance(size + 15, angle, target)
    end
end

function trustBardMove(mob, player, target, angle)
    local enmity = enmityCalc(mob, player, target)
    local size = target:getModelSize() -- Take size of model to account

    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING and enmity ~= 0) then
        mob:moveToDistance(size + 16, angle, target)
    end
end

function trustTankMove(mob, player, target)
    local size = target:getModelSize()
    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING) then
        mob:moveToDistanceFacing(size + 2, target)
    end
end





function newTrustPull(mob,player,target)
    --first check of trust pull is 1
    local ID = 0
    if (player:getVar("TrustPull") == 1 and mob:getLocalVar("MobFound") == 0) then  -- No Mob Found but player has Trust Pull toggled
        -- cycle thru mobs to get an ID
        mob:setLocalVar("Pull",1)
        local lvl = mob:getMainLvl()
        local nearbyTargets = mob:getTargetsWithinArea(40, 8);  -- Seek out all mobs in the area
        for i,monster in ipairs(nearbyTargets) do

            if (monster:getMainLvl() >= (lvl + 1) and monster:getMainLvl() <= (lvl + 6) and monster:isAlive()) then
                local distance = player:checkDistance(monster)

                ID = monster:getShortID()
                mob:setLocalVar("TargetID",ID)
                mob:setLocalVar("MobFound",1) -- I found a mob
                local name = monster:getName()
                player:PrintToPlayer("(Najelith-N) Pulling a "..name ,0x1C);
                break
            end
        end
    end



end





function weaponSkillEnmityCheck(mob, player, target)
    local party = player:getPartyWithTrusts()
    local enmity = enmityCalc(mob, player, target)
    local tatt = mob:getStat(dsp.mod.ATT)
    local mobdef = mob:getStat(dsp.mod.DEF)
    local pdifs = (tatt / mobdef)
    local tank = 0;
    for i,member in ipairs(party) do
        if (member:getMainJob() == dsp.job.PLD or member:getMainJob() == dsp.job.NIN or member:getMainJob() == dsp.job.RUN) then
            tank = 1; -- tank in party so ease up on WS
            break;
        end
    end

    if (tank == 1) then
        if (enmity > 2500 * pdifs) then
            tank = 0
        end
    end

    -- TODO: put in a stipulation for low HP on the mob
    return tank
end

function doKupipiTrustPoints(mob)
    local player = mob:getMaster()
    local acc = 0
    local att = 0
    local curePot = 0
    local cureTime = 0

    if (player:getVar("KUPIPI_TRIB_FIGHT") == 3) then
        att = player:getVar("TrustAtt_Kup")
        acc = player:getVar("TrustAcc_Kup")
        curePot = player:getVar("TrustCure_Kup")
        cureTime = player:getVar("TrustCast_Kup")

        mob:addMod(dsp.mod.ATT,att)
        mob:addMod(dsp.mod.ACC,acc)
        mob:addMod(dsp.mod.CURE_POTENCY,curePot)
        mob:addMod(dsp.mod.CURE_CAST_TIME,cureTime)
    end
end

function doCurillaTrustPoints(mob)
    local player = mob:getMaster()
    local acc = 0
    local att = 0
    local curePot = 0
    local cureTime = 0

    if (player:getVar("CURILLA_TRIB_FIGHT") == 3) then
        att = player:getVar("TrustAtt_Cur")
        acc = player:getVar("TrustAcc_Cur")
        def = player:getVar("TrustDEF_Cur")
        enmity = player:getVar("TrustENM_Cur")

        mob:addMod(dsp.mod.ATT,att)
        mob:addMod(dsp.mod.ACC,acc)
        mob:addMod(dsp.mod.DEF,def)
        mob:addMod(dsp.mod.ENMITY,enmity)
    end
end

function doNajiTrustPoints(mob)
    local player = mob:getMaster()
    local acc = 0
    local att = 0
    local da = 0
    local berserk = 0


    if (player:getVar("CURILLA_TRIB_FIGHT") == 3) then
        att = player:getVar("TrustAtt_Naji")
        acc = player:getVar("TrustAcc_Naji")
        da = player:getVar("TrustDA_Naji")
        berserk = player:getVar("TrustBerserk_Naji")

        if (att ~= 0) then
            mob:addMod(dsp.mod.ATT,att)
        end
        if (acc ~= 0) then
            mob:addMod(dsp.mod.ACC,acc)
        end
        if (da ~= 0) then
            mob:addMod(dsp.mod.DEF,def)
        end
        if (berserk ~= 0) then
            mob:addMod(dsp.mod.BERSERK_EFFECT,berserk)
        end
    end

end

function doDarrcuilnTrustPoints(mob)
    local level = mob:getMainLvl()





end

function doPrisheTrustPoints(mob)
    local player = mob:getMaster()
    mob:addMod(dsp.mod.CURE_POTENCY,40)  -- Prishe has a custom huge cure potency boost
end

function doDualWield(mob)
    local lvl = mob:getMainLvl()
    local job = mob:getMainJob()
    local sjob = mob:getSubJob()

    -- Setup Dual Wield Delay
    if (sjob == 13) then
        if (lvl >= 50) then
            mob:addMod(dsp.mod.DELAY,-70)
            mob:addMod(dsp.mod.STORETP,-30)
        elseif (lvl >= 20) then
            mob:addMod(dsp.mod.DELAY,-80)
            mob:addMod(dsp.mod.STORETP,-20)
        end
    end

    if (lvl >= 20) then
        if (job == 1) then  -- This is to make the main hand swing twice for normal dual wield and three times for DA on "offhand"
            mob:setMod(dsp.mod.MYTHIC_OCC_ATT_TWICE,90)
            mob:setMod(dsp.mod.MYTHIC_OCC_ATT_THRICE,10)
        elseif (job == 6 and lvl > 54) then  -- This is to make the main hand swing twice for normal dual wield and four times for DA on "offhand" Triple Attack
            mob:setMod(dsp.mod.MYTHIC_OCC_ATT_TWICE,95)
            mob:setMod(dsp.mod.QUAD_ATTACK,5) -- Triple attack on one swing, regular attack on dual wield offhand
        else
            mob:setMod(dsp.mod.MYTHIC_OCC_ATT_TWICE,100)
        end
    end
end

function trustSubQuest(mob, player)
    local sjQuest = player:getVar("TRUST_SJ_QUEST")
    local sjQuestProgress = player:getVar("TRUST_SJ_QUEST_PROGRESS")
    local counter = player:getVar("TRUST_SJ_QUEST_COUNTER")
    local progress = 0

    if (sjQuest == 1) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        progress = 100 - counter
        player:PrintToPlayer("Trust Subjob Quest#1 - Objectives Remaining: "..progress.."/100 ", 0x15);
        if (counter == 101) then
            player:PrintToPlayer("Trust Objective Complete!  Please see Touneaux to finish the quest", 0x15);
        end
    elseif (sjQuest == 2) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        progress = 100 - counter
        player:PrintToPlayer("Trust Subjob Quest#2 - Objectives Remaining: "..progress.."/100 ", 0x15);
        if (counter == 101) then
            player:PrintToPlayer("Trust Objective Complete!  Please see Touneaux to finish the quest", 0x15);
        end
    elseif (sjQuest == 3) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        progress = 100 - counter
        player:PrintToPlayer("Trust Subjob Quest#1 - Objectives Remaining: "..progress.."/100 ", 0x15);
        if (counter == 101) then
            player:PrintToPlayer("Trust Objective Complete!  Please see Touneaux to finish the quest", 0x15);
        end
    end


end


function trustPoints(mob, player)
local trustTokens = player:getVar("TrustTokens");
local tokenCap = 35;

local AdelheidTokens = player:getVar("CurrentTokens_Adelheid");
local AdelheidPoints = player:getVar("CurrentPoints_Adelheid");

local AyameTokens = player:getVar("CurrentTokens_Ayame");
local AyamePoints = player:getVar("CurrentPoints_Ayame");

local CurillaTokens = player:getVar("CurrentTokens_Curilla");
local CurillaPoints = player:getVar("CurrentPoints_Curilla");

local DarcullinTokens = player:getVar("CurrentTokens_Darcullin");
local DarcullinPoints = player:getVar("CurrentPoints_Darcullin");

local ExcenmilleTokens = player:getVar("CurrentTokens_Excenmille");
local ExcenmillePoints = player:getVar("CurrentPoints_Excenmille");

local KupipiTokens = player:getVar("CurrentTokens_Kupipi");
local KupipiPoints = player:getVar("CurrentPoints_Kupipi");

local LionTokens = player:getVar("CurrentTokens_Lion");
local LionPoints = player:getVar("CurrentPoints_Lion");

local NanaaTokens = player:getVar("CurrentTokens_Nanaa");
local NanaaPoints = player:getVar("CurrentPoints_Nanaa");

local NajiTokens = player:getVar("CurrentTokens_Naji");
local NajiPoints = player:getVar("CurrentPoints_Naji");

local ZeidTokens = player:getVar("CurrentTokens_Zeid");
local ZeidPoints = player:getVar("CurrentPoints_Zeid");


local curillaTrib = player:getVar("CURILLA_TRIB_FIGHT");
local excenmilleTrib = player:getVar("EXCEN_TRIB_FIGHT");
local ayameTrib = player:getVar("AYAME_TRIB_FIGHT");
local najiTrib = player:getVar("NAJI_TRIB_FIGHT");

local kupipiTrib = player:getVar("KUPIPI_TRIB_FIGHT");
local nanaaTrib = player:getVar("NANAA_TRIB_FIGHT");


local lionTrib = player:getVar("LION_TRIB_FIGHT");
local darcullinTrib = player:getVar("DARC_TRIB_FIGHT");
local zeidTrib = player:getVar("ZEID_TRIB_FIGHT");
local adelheidTrib = player:getVar("ADEL_TRIB_FIGHT");

local pet;
local trustpoint = mob:getBaseExp()

-- Lets see who is in the party

local kupipi = 0
local ayame = 0
local curilla = 0
local nanaa = 0
local naji = 0
local excenmille = 0
local adelheid = 0
local darrcuiln = 0
local lion = 0
local prishe = 0
local ulmia = 0
local shantotto = 0
local gessho = 0
local zeid = 0
local mihli = 0
local gadalar = 0
local najelith = 0
local rughadjeen = 0
local zazarg = 0
local luzaf = 0

    -- Lets clean this up later with an lua function in the core
    local party = player:getPartyWithTrusts()
    if (party ~= nil) then
        for i, member in ipairs(party) do
            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Kupipi" or member:getName() == "Kupipi-W" or member:getName() == "Kupipi-R")) then
                kupipi = 1
            end
            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Ayame" or member:getName() == "Ayame-W")) then
                ayame = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Curilla")) then
                curilla = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Nanaa Mihgo" or member:getName() == "Nanaa Mihgo-W" or member:getName() == "Nanaa Mihgo-N")) then
                nanaa = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Naji" or member:getName() == "Naji-W" or member:getName() == "Naji-N")) then
                naji = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Excenmille" or member:getName() == "Excenmille-W" or member:getName() == "Excenmille-S")) then
                excenmille = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Adelheid" or member:getName() == "Adelheid-R")) then
                adelheid = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Darrcuiln" or member:getName() == "Darrcuiln-W" or member:getName() == "Darrcuiln-N")) then
                darrcuiln = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Lion-R")) then
                lion = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Prishe")) then
                prishe = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Ulmia")) then
                ulmia = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Shantotto")) then
                shantotto = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Gessho")) then
                gessho = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Zeid" or member:getName() == "Zeid-W" or member:getName() == "Zeid-S")) then
                zeid = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Mihli Alipoh" or member:getName() == "Mihli Alipoh-W" or member:getName() == "Mihli Alipoh-N")) then
                mihli = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Gadalar" or member:getName() == "Gadalar-W" or member:getName() == "Gadalar-S")) then
                gadalar = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Najelith" or member:getName() == "Najelith-W" or member:getName() == "Najelith-N")) then
                najelith = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Rughadjeen" or member:getName() == "Rughadjeen-W" or member:getName() == "Rughadjeen-S")) then
                rughadjeen = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Zazarg" or member:getName() == "Zazarg-W" or member:getName() == "Zazarg-N")) then
                zazarg = 1
            end

            if (member:getObjType() == dsp.objType.TRUST and (member:getName() == "Luzaf")) then
                luzaf = 1
            end
        end
    end


	if (((kupipi == 1 and kupipiTrib == 3) or (ayame == 1 and ayameTrib == 3) or
         (curilla == 1 and curillaTrib == 3) or (nanaa == 1 and nanaaTrib == 3) or
         (naji == 1 and najiTrib == 3) or (excenmille == 1 and excenmilleTrib == 3) or
         (adelheid == 1 and adelheidTrib == 3) or (darrcuiln == 1 and darcullinTrib == 3) or
         (lion == 1 and lionTrib == 3)) and player:getMainLvl() >= 75) then-- Means that they are in the party.  Need to list all because it displays trust points
	        player:PrintToPlayer("You receive "..trustpoint.." Trust Points!!!", 0x15);
            -- Naji
	        if ((naji == 1) and (najiTrib == 3)) then
		        player:setVar("CurrentPoints_Naji", NajiPoints + trustpoint);
			    NajiPoints = player:getVar("CurrentPoints_Naji");
			    if (NajiPoints > 10000) then
			        player:setVar("CurrentTokens_Naji", NajiTokens + 1);
					if (player:getVar("CurrentTokens_Naji", NajiTokens) >= 35) then
					    player:setVar("CurrentTokens_Naji", 35);
					end
				    NajiTokens = player:getVar("CurrentTokens_Naji");
	                player:PrintToPlayer("You obtain "..NajiTokens.." Trust Token(Naji).  Total: ("..NajiTokens.."/"..tokenCap..").", 0x15);
				    player:setVar("CurrentPoints_Naji", NajiPoints - 10000);
	            end
	        end
            -- Kupipi
	        if ((kupipi == 1) and (kupipiTrib == 3)) then
		        player:setVar("CurrentPoints_Kupipi", KupipiPoints + trustpoint);
			    KupipiPoints = player:getVar("CurrentPoints_Kupipi");
			    if (KupipiPoints > 10000) then
					player:setVar("CurrentTokens_Kupipi", KupipiTokens + 1);
					if (player:getVar("CurrentTokens_Kupipi", KupipiTokens) >= 35) then
					    player:setVar("CurrentTokens_Kupipi", 35);
					end
					KupipiTokens = player:getVar("CurrentTokens_Kupipi");
					player:PrintToPlayer("You obtain "..KupipiTokens.." Trust Token(Kupipi).  Total: ("..KupipiTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Kupipi", KupipiPoints - 10000);
				end
			end
			-- Ayame
			if ((ayame == 1) and (ayameTrib == 3)) then
				player:setVar("CurrentPoints_Ayame", AyamePoints + trustpoint);
				AyamePoints = player:getVar("CurrentPoints_Ayame");
				if (AyamePoints > 10000) then
					player:setVar("CurrentTokens_Ayame", AyameTokens + 1);
					if (player:getVar("CurrentTokens_Ayame", AyameTokens) >= 35) then
					    player:setVar("CurrentTokens_Ayame", 35);
					end
					AyameTokens = player:getVar("CurrentTokens_Ayame");
					player:PrintToPlayer("You obtain "..AyameTokens.." Trust Token(Ayame).  Total: ("..AyameTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Ayame", AyamePoints - 10000);
				end
			end
			-- Nanaa
			if ((nanaa == 1) and (nanaaTrib == 3)) then
				player:setVar("CurrentPoints_Nanaa", NanaaPoints + trustpoint);
				NanaaPoints = player:getVar("CurrentPoints_Nanaa");
				if (NanaaPoints > 10000) then
					player:setVar("CurrentTokens_Nanaa", NanaaTokens + 1);
					if (player:getVar("CurrentTokens_Nanaa", NanaaTokens) >= 35) then
					    player:setVar("CurrentTokens_Nanaa", 35);
					end
					NanaaTokens = player:getVar("CurrentTokens_Nanaa");
					player:PrintToPlayer("You obtain "..NanaaTokens.." Trust Token(Nanaa).  Total: ("..NanaaTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Nanaa", NanaaPoints - 10000);
				end
			end
			-- Curilla
			if ((curilla == 1) and (curillaTrib == 3)) then
				player:setVar("CurrentPoints_Curilla", CurillaPoints + trustpoint);
				CurillaPoints = player:getVar("CurrentPoints_Curilla");
				if (CurillaPoints > 10000) then
					player:setVar("CurrentTokens_Curilla", CurillaTokens + 1);
					if (player:getVar("CurrentTokens_Curilla", CurillaTokens) >= 35) then
					    player:setVar("CurrentTokens_Curilla", 35);
					end
					CurillaTokens = player:getVar("CurrentTokens_Curilla");
					player:PrintToPlayer("You obtain "..CurillaTokens.." Trust Token(Curilla).  Total: ("..CurillaTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Curilla", CurillaPoints - 10000);
				end
			end
			-- Excenmille
			if ((excenmille == 1) and (excenmilleTrib == 3)) then
				player:setVar("CurrentPoints_Excenmille", ExcenmillePoints + trustpoint);
				ExcenmillePoints = player:getVar("CurrentPoints_Excenmille");
				if (ExcenmillePoints > 10000) then
					player:setVar("CurrentTokens_Excenmille", ExcenmilleTokens + 1);
					if (player:getVar("CurrentTokens_Excenmille", ExcenmilleTokens) >= 35) then
					    player:setVar("CurrentTokens_Excenmille", 35);
					end
					ExcenmilleTokens = player:getVar("CurrentTokens_Excenmille");
					player:PrintToPlayer("You obtain "..ExcenmilleTokens.." Trust Token(Excenmille).  Total: ("..ExcenmilleTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Excenmille", ExcenmillePoints - 10000);
				end
			end
			-- Darcullin
			if ((darrcuiln == 1) and (darcullinTrib == 3)) then
				player:setVar("CurrentPoints_Darcullin", DarcullinPoints + trustpoint);
				DarcullinPoints = player:getVar("CurrentPoints_Darcullin");
				if (DarcullinPoints > 10000) then
					player:setVar("CurrentTokens_Darcullin", DarcullinTokens + 1);
					if (player:getVar("CurrentTokens_Darcullin", DarcullinTokens) >= 35) then
					    player:setVar("CurrentTokens_Darcullin", 35);
					end
					DarcullinTokens = player:getVar("CurrentTokens_Darcullin");
					player:PrintToPlayer("You obtain "..DarcullinTokens.." Trust Token(Darcullin).  Total: ("..DarcullinTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Darcullin", DarcullinPoints - 10000);
				end
			end
			-- Adelheid
			if ((adelheid == 1) and (adelheidTrib == 3)) then
				player:setVar("CurrentPoints_Adelheid", AdelheidPoints + trustpoint);
				AdelheidPoints = player:getVar("CurrentPoints_Adelheid");
				if (AdelheidPoints > 10000) then
					player:setVar("CurrentTokens_Adelheid", AdelheidTokens + 1);
					if (player:getVar("CurrentTokens_Adelheid", AdelheidTokens) >= 35) then
					    player:setVar("CurrentTokens_Adelheid", 35);
					end
					AdelheidTokens = player:getVar("CurrentTokens_Adelheid");
					player:PrintToPlayer("You obtain "..AdelheidTokens.." Trust Token(Adelheid).  Total: ("..AdelheidTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Adelheid", AdelheidPoints - 10000);
				end
			end
			-- Lion
			if ((lion == 1) and (lionTrib == 3)) then
				player:setVar("CurrentPoints_Lion", LionPoints + trustpoint);
				LionPoints = player:getVar("CurrentPoints_Lion");
				if (LionPoints > 10000) then
					player:setVar("CurrentTokens_Lion", LionTokens + 1);
					if (player:getVar("CurrentTokens_Lion", LionTokens) >= 35) then
					    player:setVar("CurrentTokens_Lion", 35);
					end
					LionTokens = player:getVar("CurrentTokens_Lion");
					player:PrintToPlayer("You obtain "..LionTokens.." Trust Token(Lion).  Total: ("..LionTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Lion", LionPoints - 10000);
				end
			end

			-- Zeid
			if ((zeid == 1) and (zeidTrib == 3)) then
				player:setVar("CurrentPoints_Zeid", ZeidPoints + trustpoint);
				ZeidPoints = player:getVar("CurrentPoints_Zeid");
				if (ZeidPoints > 10000) then
					player:setVar("CurrentTokens_Zeid", ZeidTokens + 1);
					if (player:getVar("CurrentTokens_Zeid", ZeidTokens) >= 35) then
					    player:setVar("CurrentTokens_Zeid", 35);
					end
					ZeidTokens = player:getVar("CurrentTokens_Zeid");
					player:PrintToPlayer("You obtain "..ZeidTokens.." Trust Token(Zeid).  Total: ("..ZeidTokens.."/"..tokenCap..").", 0x15);
					player:setVar("CurrentPoints_Zeid", ZeidPoints - 10000);
				end
			end

		end
end;

function trustSJQuest(mob, player)
    local war = 11988
    local rdm = 11992
    local sam = 11999
    local nin = 12000
    local counter =  player:getVar("TRUST_SJ_QUEST_COUNTER")
    local quest = player:getVar("TRUST_SJ_QUEST")
    local baseExp = mob:getBaseExp()

    local neck = player:getEquipID(dsp.slot.NECK)

    if ((neck == war) and quest < 1 and baseExp > 0) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        if ((counter + 1) == 101) then
            player:PrintToPlayer("You have finished collecting enough energy for your Torque.  Please return to Touneaux for your reward.", 0x15)
        end
    elseif ((neck == rdm) and quest == 1 and baseExp > 0) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        if ((counter + 1) == 101) then
            player:PrintToPlayer("You have finished collecting enough energy for your Torque.  Please return to Touneaux for your reward.", 0x15)
        end
    elseif ((neck == sam) and quest == 2 and baseExp > 0) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        if ((counter + 1) == 101) then
            player:PrintToPlayer("You have finished collecting enough energy for your Torque.  Please return to Touneaux for your reward.", 0x15)
        end
    elseif ((neck == nin) and quest == 3 and baseExp > 0) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        if ((counter + 1) == 101) then
            player:PrintToPlayer("You have finished collecting enough energy for your Torque.  Please return to Touneaux for your reward.", 0x15)
        end
    end



end