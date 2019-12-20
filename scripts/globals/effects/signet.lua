-----------------------------------
--
--     dsp.effect.SIGNET
--
--   Signet is a a beneficial Status Effect that allows the acquisition of Conquest Points and Crystals
--   from defeated enemies that grant Experience Points.

--   Increased Healing HP
--   No TP loss while resting
--   Bonus experience earned in smaller parties
--   Increased defense and evasion against attacks from your auto-attack target when even match or lower
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local level = target:getMainLvl()
    local modboost = 0
    local regen = 0
    local regain = 0

    if (level <= 29) then
        target:setVar("SignetBoost",5)
        modboost = 5
    elseif (level <= 49) then
        target:setVar("SignetBoost",10)
        modboost = 10
    else
        target:setVar("SignetBoost",15)
        modboost = 15
    end


    target:addLatent(dsp.latent.SIGNET_BONUS, 0, dsp.mod.DEF, 15)
    target:addLatent(dsp.latent.SIGNET_BONUS, 0, dsp.mod.EVA, 15)
    target:addMod(dsp.mod.REFRESH, 1)
    target:addMod(dsp.mod.REGEN, modboost / 5)
    target:addLatent(dsp.latent.SIGNET_BONUS, 50, dsp.mod.REGAIN, modboost)
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    modboost = target:getVar("SignetBoost")
    target:delLatent(dsp.latent.SIGNET_BONUS, 0, dsp.mod.DEF, 15)
    target:delLatent(dsp.latent.SIGNET_BONUS, 0, dsp.mod.EVA, 15)
    target:delMod(dsp.mod.REFRESH, 1)
    target:delMod(dsp.mod.REGEN, modboost / 5)
    target:delLatent(dsp.latent.SIGNET_BONUS, 50, dsp.mod.REGAIN, modboost)
end