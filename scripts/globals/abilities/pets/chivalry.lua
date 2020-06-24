---------------------------------------------
-- Angon
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
    local tp = pet:getTP()
    -- (TP * .5) + (0.015 * TP * MND) = MP gained
    local amount = (tp * 0.05 + 0.0015 * tp * pet:getStat(dsp.mod.MND))
    target:setTP(0)
    return pet:addMP(amount)
end
