-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect) --power=30 initially, subpower=20 for enmity
    target:addMod(dsp.mod.EVA,-effect:getPower())
    target:addMod(dsp.mod.ENMITY,-effect:getSubPower())
    target:addMod(dsp.mod.MAG_BURST_BONUS, target:getMerit(dsp.merit.YONIN_EFFECT))
    target:addMod(dsp.mod.SKILLCHAINDMG, target:getMerit(dsp.merit.YONIN_EFFECT))
end

function onEffectTick(target,effect)
    --tick down the effect and reduce the overall power
    effect:setPower(effect:getPower()-1)
    target:delMod(dsp.mod.EVA,-1)
    if (effect:getPower() % 2 == 0) then -- enmity- decays from -20 to -10, so half as often as the rest.
        effect:setSubPower(effect:getSubPower()-1)
        target:delMod(dsp.mod.ENMITY,-1)
    end
end

function onEffectLose(target,effect)
    --remove the remaining power
    target:delMod(dsp.mod.EVA,-effect:getPower())
    target:delMod(dsp.mod.ENMITY,-effect:getSubPower())
    target:delMod(dsp.mod.MAG_BURST_BONUS, target:getMerit(dsp.merit.YONIN_EFFECT))
    target:delMod(dsp.mod.SKILLCHAINDMG, target:getMerit(dsp.merit.YONIN_EFFECT))
end