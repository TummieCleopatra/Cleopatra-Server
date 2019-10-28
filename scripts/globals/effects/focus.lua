-----------------------------------
--
--     dsp.effect.FOCUS
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ACC,effect:getPower())
    local activeboost = target:getVar("MNKBoostNumberFocus")
    local lvl = target:getVar("MNKFocusLevel")

    local maboost = math.floor((lvl / 3) + 5)
    local critboost = math.floor(lvl / 12.5)
    if (activeboost >= 1) then
        maboost = maboost + (activeboost * 10)
        critboost = critboost + (activeboost * 3)
	end
    printf("Add Focus")
    target:addMod(dsp.mod.MARTIAL_ARTS,maboost)
    target:addMod(dsp.mod.CRITHITRATE,critboost)

end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ACC,effect:getPower())
    local activeboost = target:getVar("MNKBoostNumberFocus")
    local lvl = target:getVar("MNKFocusLevel")

    local maboost = math.floor((lvl / 3) + 5)
    local critboost = math.floor(lvl / 12.5)
    if (activeboost >= 1) then
        maboost = maboost + (activeboost * 10)
        critboost = critboost + (activeboost * 3)
	end

    target:delMod(dsp.mod.MARTIAL_ARTS,maboost)
    target:delMod(dsp.mod.CRITHITRATE,critboost)
end