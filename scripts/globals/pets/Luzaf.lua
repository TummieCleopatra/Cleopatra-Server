-------------------------------------------------
--  TRUST: Luzaf
--  Magic: None
--  JA: Phantom Roll
--  WS: Double Thrust, Leg Sweep, Penta Thrust
--  Source: http://bg-wiki.com/bg/Category:Trust
-------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/trust_utils")

function onMobSpawn(mob)
    local lvl = mob:getMainLvl()
    local hpp = mob:getHPP()
    local weaponskill = 0
	local jumpCooldown = 60
	local phantomRollCooldownOne = 0
	local phantomRollCooldownTwo = 61
    local daCooldown = 6
    local angle = getAngle(mob)
    local wsCooldown = 4
    local phantomRoll = 0
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("prTimeOne",0)
    mob:setLocalVar("prTimeTwo",0)
    mob:setLocalVar("daTime",0)
    mob:setLocalVar("corsairRollTotal",0)
    mob:addMod(dsp.mod.REGAIN, 100)

	mob:addListener("COMBAT_TICK", "LUZAF_COMBAT_TICK", function(mob, player, target)
	    trustMeleeMove(mob, player, target, angle)
	    local battletime = os.time()
        local weaponSkillTime = mob:getLocalVar("wsTime")
        if (mob:getTP() >= 1000 and (battletime > weaponSkillTime + wsCooldown)) then
		    weaponskill = doLuzafWeaponskill(mob)
			mob:useMobAbility(weaponskill)
            mob:setLocalVar("wsTime",battletime)
		end
	end)

    mob:addListener("COMBAT_TICK", "LUZAF_PR_ONE_TICK", function(mob, player, target)
        local battletime = os.time()
        local phantomOne = mob:getLocalVar("prTimeOne")

        -- decide based on acc levels
        local acc = mob:getACC()
        local eva = target:getEVA()
        local hitrate = 75 + math.floor((acc - eva) / 2)
        if (lvl >= 11 and hitrate < 80 and not mob:hasStatusEffect(dsp.effect.HUNTERS_ROLL) and battletime > phantomOne + phantomRollCooldownOne) then
            local roll = math.random(1,6)
            mob:setLocalVar("trustRoll",roll)
            mob:setLocalVar("prTimeOne",battletime)
            mob:setLocalVar("prTimeTwo",battletime)
            phantomRollCooldownOne = 300
            phantomRollCooldownTwo = 60
            phantomRoll = 1
            mob:setLocalVar("daTime",battletime)
            mob:useJobAbility(92, mob)
        elseif (lvl >= 49 and not mob:hasStatusEffect(dsp.effect.FIGHTERS_ROLL) and battletime > phantomOne + phantomRollCooldownOne) then
            local roll = math.random(1,6)
            mob:setLocalVar("trustRoll",roll)
            mob:setLocalVar("prTimeOne",battletime)
            mob:setLocalVar("prTimeTwo",battletime)
            phantomRollCooldownOne = 300
            phantomRollCooldownTwo = 60
            phantomRoll = 1
            mob:setLocalVar("daTime",battletime)
            mob:useJobAbility(82, mob)
        elseif (lvl >= 5 and not mob:hasStatusEffect(dsp.effect.CORSAIRS_ROLL) and battletime > phantomOne + phantomRollCooldownOne) then
            local roll = math.random(1,6)
            mob:setLocalVar("trustRoll",roll)
            mob:setLocalVar("prTimeOne",battletime)
            mob:setLocalVar("prTimeTwo",battletime)
            phantomRollCooldownOne = 300
            phantomRollCooldownTwo = 60
            phantomRoll = 0
            mob:setLocalVar("daTime",battletime)
            mob:useJobAbility(98, mob)
        end
    end)



    mob:addListener("COMBAT_TICK", "LUZAF_PR_TWO_TICK", function(mob, player, target)
        local battletime = os.time()
        local phantomTwo = mob:getLocalVar("prTimeTwo")
        -- decide based on att pdif
        local att = mob:getStat(dsp.mod.ATT)
        local def = target:getStat(dsp.mod.DEF)
        local pdif = (att / def)
        if (not mob:hasStatusEffect(dsp.effect.DOUBLE_UP_CHANCE)) then
        if (lvl >= 14 and pdif < 1.75 and not mob:hasStatusEffect(dsp.effect.CHAOS_ROLL) and battletime > phantomTwo + phantomRollCooldownTwo) then
            local roll = math.random(1,6)
            mob:setLocalVar("trustRoll",roll)
            mob:setLocalVar("prTimeTwo",battletime)
            phantomRollCooldownTwo = 300
            phantomRoll = 2
            mob:setLocalVar("daTime",battletime)
            mob:useJobAbility(89, mob)
        elseif (lvl >= 43 and not mob:hasStatusEffect(dsp.effect.ROGUES_ROLL) and battletime > phantomTwo + phantomRollCooldownTwo) then
            local roll = math.random(1,6)
            mob:setLocalVar("trustRoll",roll)
            mob:setLocalVar("prTimeTwo",battletime)
            phantomRollCooldownTwo = 300
            phantomRoll = 2
            mob:setLocalVar("daTime",battletime)
            mob:useJobAbility(87, mob)
        elseif (lvl >= 5 and not mob:hasStatusEffect(dsp.effect.CORSAIRS_ROLL) and battletime > phantomTwo + phantomRollCooldownTwo) then
            local roll = math.random(1,6)
            mob:setLocalVar("trustRoll",roll)
            mob:setLocalVar("prTimeTwo",battletime)
            phantomRollCooldownTwo = 300
            phantomRoll = 2
            mob:setLocalVar("daTime",battletime)
            mob:useJobAbility(98, mob)
        else
            mob:setLocalVar("prTimeTwo",battletime)
            phantomRollCooldownTwo = 10
            phantomRoll = 0
            mob:setLocalVar("daTime",battletime)
        end
        end
    end)

    mob:addListener("COMBAT_TICK", "LUZAF_DU_TICK", function(mob, player, target)
        local battletime = os.time()
        local daTime = mob:getLocalVar("daTime")
        if (battletime > daTime + daCooldown) then
            if (phantomRoll == 1) then
                if (mob:hasStatusEffect(dsp.effect.HUNTERS_ROLL)) then
                    local roll = mob:getLocalVar("corsairRollTotal")
                    if (roll <= 3 or roll == 5) then
                        local duroll = math.random(1,6)
                        mob:setLocalVar("duRoll",duroll)
                        mob:useJobAbility(107, mob)
                        mob:setLocalVar("daTime",battletime)
                    end
                elseif (mob:hasStatusEffect(dsp.effect.FIGHTERS_ROLL)) then
                    local roll = mob:getLocalVar("corsairRollTotal")
                    if (roll <= 4 or roll == 6) then
                        local duroll = math.random(1,6)
                        mob:setLocalVar("duRoll",duroll)
                        mob:useJobAbility(107, mob)
                        mob:setLocalVar("daTime",battletime)
                    end
                elseif (mob:hasStatusEffect(dsp.effect.CORSAIRS_ROLL)) then
                    local roll = mob:getLocalVar("corsairRollTotal")
                    if (roll <= 4 or roll == 6) then
                        local duroll = math.random(1,6)
                        mob:setLocalVar("duRoll",duroll)
                        mob:useJobAbility(107, mob)
                        mob:setLocalVar("daTime",battletime)
                    end
                end
            elseif (phantomRoll == 2) then
                if (mob:hasStatusEffect(dsp.effect.CHAOS_ROLL)) then
                    local roll = mob:getLocalVar("corsairRollTotal")
                    if (roll <= 3) then
                        local duroll = math.random(1,6)
                        mob:setLocalVar("duRoll",duroll)
                        mob:useJobAbility(107, mob)
                        mob:setLocalVar("daTime",battletime)
                    end
                elseif (mob:hasStatusEffect(dsp.effect.ROGUES_ROLL)) then
                    local roll = mob:getLocalVar("corsairRollTotal")
                    if (roll <= 3 or roll == 5) then
                        local duroll = math.random(1,6)
                        mob:setLocalVar("duRoll",duroll)
                        mob:useJobAbility(107, mob)
                        mob:setLocalVar("daTime",battletime)
                    end
                end
            end
        end
    end)


end


function doLuzafWeaponskill(mob)
    local wsList = {{75,3255},{75,3253},{55,3254}, {30,3252}, {1,208}}
    local newWsList = {}
	local maxws = 2 -- Maximum number of weaponskills to choose from randomly
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