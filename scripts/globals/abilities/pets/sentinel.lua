---------------------------------------------
-- Trust - Sentinel
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
    local power = 90

    local enm = pet:getLocalVar("sentinelEnm") * 4

   -- Sent as positive power because UINTs, man.
   pet:addStatusEffect(dsp.effect.SENTINEL,power,3,30,0,enm)
end