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
    local typeEffect = dsp.effect.DEFENSE_DOWN
    local duration = math.random(15,20)
    if (target:addStatusEffect(typeEffect,20,0,duration) == false) then
        ability:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end


    return typeEffect
end
