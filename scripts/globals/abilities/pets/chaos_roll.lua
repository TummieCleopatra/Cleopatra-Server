---------------------------------------------
-- Trust: Chain Affinity
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
require("scripts/globals/ability")
---------------------------------------------

function onAbilityCheck(player,target,ability)
    return 0
end

function onUseAbility(caster,target,ability,action)
    trustCorsairSetup(caster, ability, action, dsp.effect.CHAOS_ROLL, dsp.job.DRK)
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end


function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(dsp.merit.WINNING_STREAK) + caster:getMod(dsp.mod.PHANTOM_DURATION)
    local effectpowers = {6, 8, 9, 25, 11, 13, 16, 3, 17, 19, 31, 10}
    local effectpower = effectpowers[total]
    if (caster:getLocalVar("corsairRollBonus") == 1 and total < 12) then
        effectpower = effectpower + 10
    end
-- Apply Additional Phantom Roll+ Buff
    local phantomBase = 3 -- Base increment buff
    local effectpower = effectpower + (phantomBase * phantombuffMultiple(caster))
-- Check if COR Main or Sub
    if (caster:getMainJob() == dsp.job.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl())
    elseif (caster:getSubJob() == dsp.job.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl())
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(dsp.merit.BUST_DURATION), dsp.effect.CHAOS_ROLL, effectpower, 0, duration, caster:getID(), total, dsp.mod.ATTP) == false) then
        ability:setMsg(dsp.msg.basic.ROLL_MAIN_FAIL)
    elseif total > 11 then
        ability:setMsg(dsp.msg.basic.DOUBLEUP_BUST)
    end
    return total
end
