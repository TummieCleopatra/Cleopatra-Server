---------------------------------------------
-- Healing Breath I
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onUseAbility(pet, target, skill, action)
    local amount = 12
    if (pet:getMainJob() == dsp.job.SAM) then
        amount = 20
    end

    pet:addStatusEffectEx(dsp.effect.MEDITATE,0,amount,3,15)
end
