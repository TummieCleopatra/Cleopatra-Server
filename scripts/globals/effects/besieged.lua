-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/besieged_points");

function onEffectGain(target,effect)
    -- Apply Buffs
    local wins = GetServerVariable("Consecutive_BWins");
    if (wins > 10) then
        wins = 10
    end

    local acc = wins * 3
    local att = wins * 3
    local macc = wins * 3
    local mab = wins * 3

    if (target:getObjType() == dsp.objType.PC) then
        target:setVar("BesiegedBuffMult",wins * 3)

        target:addMod(dsp.mod.ACC, acc)
        target:addMod(dsp.mod.ATT, att)
        target:addMod(dsp.mod.MACC, acc)
        target:addMod(dsp.mod.MATT, att)
    end
end

function onEffectTick(target,effect)
    local tick = effect:getLastTick()
    local rate = EVALUATIOIN_RATE / 3





    if (tick == rate or tick == (rate * 2) or tick == (rate * 3) or tick == (rate * 4) or tick == (rate * 5) or
        tick == (rate * 6) or tick == (rate * 7) or tick == (rate * 8) or tick == (rate * 9) or tick == (rate * 10) or
        tick == (rate * 11) or tick == (rate * 12) or tick == (rate * 13) or tick == (rate * 14) or tick == (rate * 15) or
        tick == (rate * 16) or tick == (rate * 17) or tick == (rate * 18) or tick == (rate * 19)) then
         
        evaluatePoints(target)
    end
end

function onEffectLose(target,effect)
    if (target:getObjType() == dsp.objType.PC) then
        local removeBuff = target:getVar("BesiegedBuffMult")

        target:addMod(dsp.mod.ACC, removeBuff)
        target:addMod(dsp.mod.ATT, removeBuff)
        target:addMod(dsp.mod.MACC, removeBuff)
        target:addMod(dsp.mod.MATT, removeBuff)
    end
end