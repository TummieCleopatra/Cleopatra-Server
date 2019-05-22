-----------------------------------
--
-- dsp.effect.SWORDPLAY
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/job_util");



-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.ACC,effect:getPower())
    target:addMod(dsp.mod.EVA,effect:getPower())
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
    local lvl = target:getMainLvl()
    local power = effect:getPower()
    local increaseby = 0
    if (power < lvl) then
        if (target:getMainJob() == dsp.job.RUN) then
            increaseby = 6
        else
            increaseby = 3
        end
        effect:setPower(power+increaseby)
        target:addMod(dsp.mod.ACC,increaseby)
        target:addMod(dsp.mod.EVA,increaseby)
        local accmod = target:getMod(dsp.mod.ACC)
        printf("New Acc is %u \n",accmod)
        printf("Tick is %u \n",increaseby)
    end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    target:delMod(dsp.mod.ACC,effect:getPower())
    target:delMod(dsp.mod.EVA,effect:getPower())
end;