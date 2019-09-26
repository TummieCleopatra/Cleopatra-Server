-----------------------------------
-- Ability: Double Up
-- Enhances an active Phantom Roll effect that is eligible for Double-Up.
-- Obtained: Corsair Level 5
-- Recast Time: 8 seconds
-- Duration: Instant
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/ability")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0
end

function onUseAbility(caster,target,ability,action)


    if (caster:getID() == target:getID()) then
        if (caster:hasStatusEffect(dsp.effect.DOUBLE_UP_CHANCE)) then
            printf("Double UP Chance is up")
        else
            printf("Double Up Chance is Down!!!")
        end
        local du_effect = caster:getStatusEffect(dsp.effect.DOUBLE_UP_CHANCE)
        local prev_roll = caster:getStatusEffect(du_effect:getSubPower())
        local roll = prev_roll:getSubPower()
        local job = du_effect:getTier()
        local duroll = caster:getLocalVar("duRoll")
        caster:setLocalVar("corsairActiveRoll", du_effect:getSubType())

        roll = roll + duroll
        if (roll > 12) then
            roll = 12
            caster:delStatusEffectSilent(dsp.effect.DOUBLE_UP_CHANCE)
        end
        caster:setLocalVar("corsairRollTotal", roll)
        action:speceffect(caster:getID(),roll-prev_roll:getSubPower())
        checkForJobBonus(caster, job)
    end
    local total = caster:getLocalVar("corsairRollTotal")
    local prev_ability = getAbility(caster:getLocalVar("corsairActiveRoll"))
    if (prev_ability) then
        action:animation(target:getID(),prev_ability:getAnimation())
        action:actionID(prev_ability:getID()+16)
        dofile("scripts/globals/abilities/pets/"..prev_ability:getName()..".lua")
        local total = applyRoll(caster,target,ability,action,total)
        local msg = ability:getMsg()
        if msg == 420 then
            ability:setMsg(dsp.msg.basic.DOUBLEUP)
        elseif msg == 422 then
            ability:setMsg(dsp.msg.basic.DOUBLEUP_FAIL)
        end
        return total
    end
end
