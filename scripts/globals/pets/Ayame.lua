-------------------------------------------------
--  Trust: Ayame
--  Magic: None
--  JA: Sekkanoki, Meditate,
--  WS: All GKT WS
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/pathfind")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local master = mob:getMaster()
    master:setVar("SCProp1",0)
    local lvl = mob:getMainLvl()
    local angle = getAngle(mob)
    local wsCooldown = 4
    mob:setLocalVar("meditateTime",0)
    mob:setLocalVar("meditateCooldown",180)
    mob:setLocalVar("hassoTime",0)
    mob:setLocalVar("hassoCooldown",60)
    mob:setLocalVar("seiganTime",0)
    mob:setLocalVar("seiganCooldown",60)
    mob:setLocalVar("teTime",0)
    mob:setLocalVar("teCooldown",30)
    mob:setLocalVar("sekkaTime",0)
    mob:setLocalVar("sekkaCooldown",300)
    mob:setLocalVar("sekkaType",0) -- 1: self sc, 2: Two Step with player close
    mob:setLocalVar("wsTime",0)
    set2HStats(mob)
    ayameTrustPoints(mob)
    mob:addListener("COMBAT_TICK", "AYAME_DISTANCE_TICK", function(mob, player, target)
        trustMeleeMove(mob, player, target, angle)
    end)

    master:addListener("WEAPONSKILL_USE", "AYAME_SC", function(player, target, skillid)
        local SCProp1, SCProp2, SCProp3 = master:getWSSkillchainProp()
        player:setVar("SCProp1",SCProp1);
    end)

    mob:addListener("COMBAT_TICK", "AYAME_SEKKA_TICK", function(mob, player, target)
        local battletime = os.time()
        local sekkaTime = mob:getLocalVar("sekkaTime")
        local sekkaCooldown = mob:getLocalVar("sekkaCooldown")
        local meditateTime = mob:getLocalVar("meditateTime")
        local meditateCooldown = mob:getLocalVar("meditateCooldown")
        if (lvl >= 40) then
            if ((battletime > sekkaTime + sekkaCooldown) and (mob:getTP() > 800 and player:getTP() >= 900) and (target:getHPP() > 50 and target:getHPP() <= 100) and (battletime > meditateTime + meditateCooldown) and mob:getBattleTime() > player:getVar("TrustWSTime") + 30) then
                printf("Do Sekka Type 2 GROUP PARTICIPATION!!")
                mob:useJobAbility(214, mob)
                mob:useJobAbility(47, mob)
                mob:setLocalVar("sekkaTime",battletime)
                mob:setLocalVar("meditateTime",battletime)
                mob:setLocalVar("sekkaType",2)
            elseif ((battletime > sekkaTime + sekkaCooldown) and (mob:getTP() > 800 and player:getTP() < 300) and (target:getHPP() > 40 and target:getHPP() <= 100) and (battletime > meditateTime + meditateCooldown) and mob:getBattleTime() > player:getVar("TrustWSTime") + 30) then
                printf("Do Sekka TYpe 1 SOLO ROUND!!")
                mob:useJobAbility(214, mob)
                mob:useJobAbility(47, mob)
                mob:setLocalVar("meditateTime",battletime)
                mob:setLocalVar("sekkaTime",battletime)
                mob:setLocalVar("sekkaType",1)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "AYAME_MEDITATE_TICK", function(mob, player, target)
        local battletime = os.time()
        local meditateTime = mob:getLocalVar("meditateTime")
        local meditateCooldown = mob:getLocalVar("meditateCooldown")
        local ayameTP = mob:getTP()
        local pTP = player:getTP()
        if (lvl >= 30) then
            if (battletime > meditateTime + meditateCooldown) then
                if (ayameTP < 300) then
                    mob:useJobAbility(47, mob)
                    mob:setLocalVar("meditateTime",battletime)
                elseif (pTP >= 1000 and ayameTP < 500) then
                    mob:useJobAbility(47, mob)
                    mob:setLocalVar("meditateTime",battletime)
                end
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "AMAYE_COMBAT_TICK", function(mob, player, target)
        local element = player:getVar("SCProp1")
        local sekkaType = mob:getLocalVar("sekkaType")
        local scTimer = mob:getLocalVar("scTimer")
        local battletime = os.time()
        local tp = mob:getTP()
        local canWS = weaponSkillEnmityCheck(mob, player, target)

        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (tp >= 2000 and sekkaType == 1) then
            mob:setLocalVar("sekkaWS",1)
            weaponskill = doAyameSoloSC(mob, player)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill, target)
        elseif (tp >= 1000 and sekkaType == 1 and (battletime > scTimer + 5)) then
            weaponskill = doAyameSoloSC(mob, player)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill, target)
            mob:setLocalVar("sekkaWS",0)
        elseif (tp >= 2000 and sekkaType == 2) then
            printf("Ayame Start Two Step!!!")
            mob:setLocalVar("sekkaWS",1)
            weaponskill = doAyameSoloSC(mob, player)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill, target)
        elseif (tp >= 1000 and sekkaType == 2 and (battletime > scTimer + 5)) then
            weaponskill = doAyameSoloSC(mob, player)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill, target)
            mob:setLocalVar("sekkaWS",0)
        elseif (tp > 1000 and ((element == 0) or (element == 1) or (element == 10)) and sekkaType == 0 and canWS ~= 1 and (battletime > weaponSkillTime + wsCooldown))  then
            weaponskill = doAyameWeaponskill(mob, player)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill, target)
            mob:setLocalVar("wsTime",battletime)
        elseif (tp > 1000 and sekkaType == 0 and canWS ~= 1 and (battletime > weaponSkillTime + wsCooldown)) then
            weaponskill = doAyameOpenWeaponskill(mob, player)
            mob:setLocalVar("WS_TP",mob:getTP())
            mob:useMobAbility(weaponskill, target)
            mob:setLocalVar("wsTime",battletime)
        end
    end)

    mob:addListener("COMBAT_TICK", "AYAME_HASSO_TICK", function(mob, player, target)
        local battletime = os.time()
        local hassoTime = mob:getLocalVar("hassoTime")
        local hassoCooldown = mob:getLocalVar("hassoCooldown")
        if (lvl >= 25) then
            if ((battletime > hassoTime + hassoCooldown) and not mob:hasStatusEffect(dsp.effect.HASSO)) then
                mob:useJobAbility(157, mob)
                mob:setLocalVar("hassoTime",battletime)
            end
        end
    end)

    mob:addListener("COMBAT_TICK", "AYAME_SEIGAN_TICK", function(mob, player, target)
        local battletime = os.time()
        local seiganTime = mob:getLocalVar("seiganTime")
        local seiganCooldown = mob:getLocalVar("seiganCooldown")
        local teTime = mob:getLocalVar("teTime")
        local teCooldown = mob:getLocalVar("teCooldown")
        local hate = enmityCalc(mob, player, target)

        if (hate == 0 and lvl >= 25) then
            if ((battletime > seiganTime + seiganCooldown) and not mob:hasStatusEffect(dsp.effect.SEIGAN)) then
                mob:useJobAbility(158, mob)
                mob:setLocalVar("seiganTime",battletime)
            end

            if ((battletime > teTime + teCooldown) and not mob:hasStatusEffect(dsp.effect.THIRD_EYE)) then
                mob:useJobAbility(46,mob)
                mob:setLocalVar("teTime",battletime)
            end
        end
    end)

end

function doAyameWeaponskill(mob)
    local wsList = {{70,152}, {65,151}, {60,150}, {55,149}, {49,148}, {33,147}, {23,146}, {9,145}, {1,144}}
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

function doAyameOpenWeaponskill(mob, player)
    local element = player:getVar("SCProp1");
    local wsList = {}

    if (element == 0) then
        printf("No Elemental WS performed by player yet...pick random")
        element = math.random(2,12)
    end

    if (element == 2) then -- Compression
        wsList = {{60,150}, {1,144}}
    elseif (element == 3) then -- Liquefication
        wsList = {{1,144}}
    elseif (element == 4) then -- Scission
        wsList = {{1,144}}
    elseif (element == 5) then -- Reverberation
        wsList = {{60,150}, {49,148}, {1,144}}
    elseif (element == 6) then -- Detonation
        wsList = {{55,149}, {1,144}}
    elseif (element == 7) then -- Induration
        wsList = {{55,149}, {1,144}} -- Default to Enpi if level isn't high enough
    elseif (element == 8) then -- Impaction
        wsList = {{33,147}, {23,146}}
    elseif (element == 9) then -- Gravitation
        wsList = {{70,152}, {65,151}}
    elseif (element == 11) then -- Fusion
        wsList = {{65,151}}
    elseif (element == 12) then -- Fragmentation
        wsList = {{70,152}}
    end




    local lvl = mob:getMainLvl()
    local finalWS = 0

    for i = 1, #wsList do
        if (lvl >= wsList[i][1]) then
            finalWS = wsList[i][2]
        end
    end


    return finalWS
end

function doAyameSoloSC(mob, player)
    printf("Do Ayame SkillchainSolo");
    local lvl = mob:getMainLvl()
    local sekkaWS = mob:getLocalVar("sekkaWS")
    local sekkaType = mob:getLocalVar("sekkaType")
    local scCombo = {{70,151,152}, {65,150,151}, {1,144,144}};
    local finalWS = 0
    local element = player:getVar("SCProp1");
    local wsList = {}

    printf("Element is %u",element)
    if (element == nil) then
        element = 1
    end


    if (element == 2) then -- Compression - SSC Detonation REsult Grav
        wsList = {{72,152,150},{50,148,148},{1,144,144}}
    elseif (element == 3) then -- Liquefication - SSC Scicion result Liquefecation
        wsList = {{60,150,144},{50,147,148},{1,144,144}}
    elseif (element == 4) then -- Scission - SSC Transfixion Result Distortion
        wsList = {{72,152,144},{1,144,144}}
    elseif (element == 5) then -- Reverberation - SSC Induration result Frag
        wsList = {{65,151,150},{60,149,150}, {55,149,145}, {1,144,144}}
    elseif (element == 6) then -- Detonation - SSC IMpation result Detonation
        wsList = {{55,149, 149}, {1,144,144}}
    elseif (element == 7) then -- Induration - SSC Reverb result Induration
        wsList = {{65,114,151},{55,144,149}} -- Default to Enpi if level isn't high enough
    elseif (element == 8) then -- Impaction - SSC Liquefication result Fusion
        wsList = {{33,144,147}}
    elseif (element == 9) then -- Gravitation - SSC Fusion result Grav
        wsList = {{70,151,152},{33,147,146}}
    elseif (element == 11) then -- Fusion - SSC Frag result Light*
        wsList = {{65,150,151},{60,150,149},{55,145,149}} -- Y:G, Y:Kok,Hob:Kok
    elseif (element == 12) then -- Fragmentation - SSC Fusion result Light
        wsList = {{70,151,152},{33,147,146}}
    else
        wsList = {{65,150,151},{60,150,149},{55,145,149},{1,144,144}}
        printf("No Elemental WS performed by player yet...Y:H Y:Kok, Hob:kok, Enpi:enpi")
    end

    if (sekkaType == 1) then
        for i = 1, #scCombo do
            if (sekkaWS == 1) then
                if (lvl >= scCombo[i][1]) then
                    finalWS = scCombo[i][2]
                    mob:setLocalVar("sekkaWS",2)
                    mob:setLocalVar("scTimer",os.time())
                    printf("DEBUG: Ayame First WS Now!")
                    break
                end
            elseif (sekkaWS == 2) then
                if (lvl >= scCombo[i][1]) then
                    finalWS = scCombo[i][3]
                    printf("DEBUG: Ayame Second WS Now!")
                    break
                end
            end
        end
    elseif (sekkaType == 2) then
        printf("Group Skillchain with Player Now")
        for i = 1, #wsList do
            if (sekkaWS == 1) then
                if (lvl >= wsList[i][1]) then
                    finalWS = wsList[i][2]
                    mob:setLocalVar("sekkaWS",2)
                    mob:setLocalVar("scTimer",os.time())
                    printf("DEBUG: Ayame First WS Now: %u! \n", finalWS)
                    break
                end
            elseif (sekkaWS == 2) then
                printf("Sekka is 2");
                if (lvl >= wsList[i][1]) then
                    finalWS = wsList[i][3]
                    printf("DEBUG: Ayame Second WS Now: %u! \n", finalWS)
                    break
                end
            end
        end
    end

    return finalWS
end