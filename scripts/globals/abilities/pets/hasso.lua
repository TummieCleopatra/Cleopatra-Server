---------------------------------------------
-- Trust: Hasso
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
    local strboost = pet:getMainLvl()/7
    if (pet:getMainJob()~=12) then --sjob sam, use sub level
        strboost = pet:getSubLvl()/7
    end
    pet:delStatusEffect(dsp.effect.HASSO)
    pet:delStatusEffect(dsp.effect.SEIGAN)
    pet:addStatusEffect(dsp.effect.HASSO,strboost,0,300)
end
