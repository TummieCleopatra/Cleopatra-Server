-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
-----------------------------------

function enmityFromCure(caster, final)

    local lvl = caster:getMainLvl()
    local modCure = 0
    local ce = 0
    local ve = 0

    print(final)

    if (lvl <= 10) then
        modCure = lvl + 10
    elseif (lvl <= 50) then
        modCure = 20 + (lvl - 10) / 20
    else
        modCure = 40 + (lvl - 50) * 0.6
    end

    ce = (40 / modCure) * final
    ve = (240 / modCure) * final

    return ce,ve
end


function enmityCalc(mob, player, target)

    local trustID = mob:getID()
    local trustEnmity = 0
    local party = player:getParty()
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

function isPrisheInParty(mob, player, target)
    local prishe = 0
    local party = player:getParty()

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
    local party = player:getParty()

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
    local party = player:getParty()

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
    local party = player:getParty()

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
    local party = player:getParty()

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
    local party = player:getParty()


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
    local party = player:getParty()


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
            mob:addTP(175 * numhits)
            if (mob:hasStatsEffect(dsp.effect.BARRAGE)) then
                mob:delStatusEffect(dsp.effect.BARRAGE)
            end
        end
    else
        if (dmg > 0) then
            target:addTP(20 * numhits)
            mob:addTP(150 * numhits)
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

    printf("Ranged Acc is %u",racc)

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

    printf("Hit Rate is %u",hitRate)
    for i = 1, barrage, 1 do
        local chance = math.random(1,100)
        printf("Chance is %u",chance)

        if (chance > hitRate) then
            break
        else
            hits = hits + 1
        end
    end

    printf("Number of hits is %u",hits)
    return hits

end

function getAngle(mob)
    local master = mob:getMaster()
    local angle = math.random(20, 180)
    local party = master:getParty()
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

function trustSneakAttackMove(mob, player, target)
    local enmity = enmityCalc(mob, player, target)
    local size = target:getModelSize() -- Take size of model to account

    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING and enmity ~= 0) then
        mob:moveToDistance(size + 3, 100, target)
    end
end

function trustMeleeMove(mob, player, target, angle)
    local enmity = enmityCalc(mob, player, target)
    local size = target:getModelSize() -- Take size of model to account
    -- Todo: Maybe put bard closer to the mob, maybe remove size
    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING and enmity ~= 0) then
        mob:moveToDistance(size + 2.5, angle, target)
    end
end

function trustMageMove(mob, player, target)
    local enmity = enmityCalc(mob, player, target)
    local size = target:getModelSize() -- Take size of model to account

    if (mob:getCurrentAction() ~= dsp.act.MAGIC_CASTING and enmity ~= 0) then
        mob:moveToDistance(size + 10,target)
    end
end

function trustTankMove(mob, player, target)
    local size = target:getModelSize()
    mob:moveToDistanceFacing(size + 2, target)
end

function weaponSkillEnmityCheck(mob, player, target)
    local party = player:getParty()
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
        elseif (job == 6 and level > 54) then  -- This is to make the main hand swing twice for normal dual wield and four times for DA on "offhand" Triple Attack
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
    local party = player:getParty()
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

function trustSJQuest(player, mob)
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
            player:PrintToPlayer("You have finished collecting enough energy for your Torque.  Please erturn to Touneaux for your reward.", 0x15)
        end
    elseif ((neck == rdm) and quest == 1 and baseExp > 0) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        if ((counter + 1) == 101) then
            player:PrintToPlayer("You have finished collecting enough energy for your Torque.  Please erturn to Touneaux for your reward.", 0x15)
        end
    elseif ((neck == sam) and quest == 2 and baseExp > 0) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        if ((counter + 1) == 101) then
            player:PrintToPlayer("You have finished collecting enough energy for your Torque.  Please erturn to Touneaux for your reward.", 0x15)
        end
    elseif ((neck == nin) and quest == 3 and baseExp > 0) then
        player:setVar("TRUST_SJ_QUEST_COUNTER",counter + 1)
        if ((counter + 1) == 101) then
            player:PrintToPlayer("You have finished collecting enough energy for your Torque.  Please erturn to Touneaux for your reward.", 0x15)
        end
    end



end