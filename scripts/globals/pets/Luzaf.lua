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
	local phantomRollCooldownOne = 0
	local phantomRollCooldownTwo = 61
    local daCooldown = 6
    local angle = getAngle(mob)
    local wsCooldown = 4
    local phantomRoll = 0
    local fireShotCooldown = 200
    local iceShotCooldown = 200
    local windShotCooldown = 200
    local earthShotCooldown = 200
    local thunderShotCooldown = 200
    local waterShotCooldown = 200
    local lightShotCooldown = 200
    local darkShotCooldown = 200
    local quickDrawCooldown = 30
    mob:setLocalVar("wsTime",0)
    mob:setLocalVar("prTimeOne",0)
    mob:setLocalVar("prTimeTwo",0)
    mob:setLocalVar("daTime",0)
    mob:setLocalVar("corsairRollTotal",0)
	mob:setLocalVar("qdTime",0)
	mob:setLocalVar("fireShotTime",0)
	mob:setLocalVar("iceShotTime",0)
	mob:setLocalVar("windShotTime",0)
	mob:setLocalVar("earthShotTime",0)
	mob:setLocalVar("thunderShotTime",0)
	mob:setLocalVar("waterShotTime",0)
	mob:setLocalVar("lightShotTime",0)
	mob:setLocalVar("darkShotTime",0)

    mob:setMobMod(dsp.mobMod.DUAL_WIELD, 1)
    mob:addMod(dsp.mod.HASTE_ABILITY, 3500)

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

	mob:addListener("COMBAT_TICK", "LUZAF_QD_TICK", function(mob, player, target)
	    local battletime = os.time()
		local fireShotTime = mob:getLocalVar("fireShotTime")
		local iceShotTime = mob:getLocalVar("iceShotTime")
		local windShotTime = mob:getLocalVar("windShotTime")
		local earthShotTime = mob:getLocalVar("earthShotTime")
		local thunderShotTime = mob:getLocalVar("thunderShotTime")
		local waterShotTime = mob:getLocalVar("waterShotTime")
		local lightShotTime = mob:getLocalVar("lightShotTime")
		local darkShotTime = mob:getLocalVar("darkShotTime")
        local quickDrawTime = mob:getLocalVar("qdTime")
        if (battletime > quickDrawTime + quickDrawCooldown) then
		    if ((battletime > fireShotTime + fireShotCooldown) and target:hasStatusEffect(dsp.effect.BURN)) then
		        mob:useJobAbility(109, target)
		        mob:setLocalVar("fireShotTime",battletime)
				mob:setLocalVar("qdTime",battletime)
		    elseif ((battletime > iceShotTime + iceShotCooldown) and target:hasStatusEffect(dsp.effect.PARALYSIS)) then
		        mob:useJobAbility(110, target)
		        mob:setLocalVar("iceShotTime",battletime)
				mob:setLocalVar("qdTime",battletime)
		    elseif ((battletime > windShotTime + windShotCooldown) and target:hasStatusEffect(dsp.effect.SILENCE)) then
		        mob:useJobAbility(111, target)
		        mob:setLocalVar("windShotTime",battletime)
				mob:setLocalVar("qdTime",battletime)
		    elseif ((battletime > earthShotTime + earthShotCooldown) and target:hasStatusEffect(dsp.effect.SLOW)) then
		        mob:useJobAbility(112, target)
		        mob:setLocalVar("earthShotTime",battletime)
				mob:setLocalVar("qdTime",battletime)
		    elseif ((battletime > waterShotTime + waterShotCooldown) and target:hasStatusEffect(dsp.effect.POISON)) then
		        mob:useJobAbility(113, target)
		        mob:setLocalVar("waterShotTime",battletime)
				mob:setLocalVar("qdTime",battletime)
		    elseif ((battletime > thunderShotTime + thunderShotCooldown) and target:hasStatusEffect(dsp.effect.SHOCK)) then
		        mob:useJobAbility(114, target)
		        mob:setLocalVar("thunderShotTime",battletime)
				mob:setLocalVar("qdTime",battletime)
		    elseif ((battletime > lightShotTime + lightShotCooldown) and target:hasStatusEffect(dsp.effect.DIA)) then
		        mob:useJobAbility(115, target)
		        mob:setLocalVar("lightShotTime",battletime)
				mob:setLocalVar("qdTime",battletime)
		    elseif ((battletime > darkShotTime + darkShotCooldown) and target:hasStatusEffect(dsp.effect.BIO)) then
		        mob:useJobAbility(116, target)
		        mob:setLocalVar("darkShotTime",battletime)
				mob:setLocalVar("qdTime",battletime)
            end
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