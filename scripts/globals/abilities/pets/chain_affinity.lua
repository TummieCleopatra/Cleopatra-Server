---------------------------------------------
-- Trust: Chain Affinity
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
    pet:addStatusEffect(dsp.effect.CHAIN_AFFINITY,1,0,30)
    printf("Chain affinity start")
end
