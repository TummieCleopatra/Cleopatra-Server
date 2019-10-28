-----------------------------------
--
--     dsp.effect.DODGE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.EVA,effect:getPower())
    local activeboost = target:getVar("MNKBoostNumberDodge")
    local gboost = 6
    local cboost = 6
    if (activeboost >= 1) then
        local gboost = gboost + (activeboost * 3)
        local cboost = cboost + (activeboost * 3)
	end

	target:addMod(dsp.mod.COUNTER,cboost)
	target:addMod(dsp.mod.GUARD,gboost)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.EVA,effect:getPower())
    local activeboost = target:getVar("MNKBoostNumberDodge")
    local gboost = 6
    local cboost = 6
    if (activeboost >= 1) then
        local gboost = gboost + (activeboost * 3)
        local cboost = cboost + (activeboost * 3)
	end

	target:delMod(dsp.mod.COUNTER,cboost)
	target:delMod(dsp.mod.GUARD,gboost)
end