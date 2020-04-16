---------------------------------------------------
-- Light Shot
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/ability")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(pet, target, skill, action)
    local lvl = pet:getMainLvl()
    local agi = pet:getStat(dsp.mod.AGI)
	local tagi = target:getStat(dsp.mod.AGI)
	local delta = tagi - agi
	local base = mob:getWeaponDmg() * 4

    -- TODO: Add In MAB Later
    local dmg = base * 2
	local acc = 0

    -- Determine Acc using this equation for now
	if (delta < 10) then
	    acc = 95
	else
	    acc = 100 - (delta / 2)
    end

	local randacc = math.random(1,100)

	if (randacc < acc) then
	    dmg = dmg
	else
	    local resist = math.random(1,4)
	    if (resist == 1) then
	        dmg = dmg * 0.25
	    else
		    dmg = dmg * 0.50
		end
	end

    local effects = {}
    local dia = target:getStatusEffect(dsp.effect.DIA)
    if dia ~= nil then
        table.insert(effects, dia)
    end
    local threnody = target:getStatusEffect(dsp.effect.THRENODY)
    if threnody ~= nil and threnody:getSubPower() == dsp.mod.DARKRES then
        table.insert(effects, threnody)
    end

    if #effects > 0 then
        local effect = effects[math.random(#effects)]
        local duration = effect:getDuration()
        local startTime = effect:getStartTime()
        local tick = effect:getTick()
        local power = effect:getPower()
        local subpower = effect:getSubPower()
        local tier = effect:getTier()
        local effectId = effect:getType()
        local subId = effect:getSubType()
        power = power * 1.5
        subpower = subpower * 1.5
        target:delStatusEffectSilent(effectId)
        target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier)
        local newEffect = target:getStatusEffect(effectId)
        newEffect:setStartTime(startTime)
    end

    return 0
end