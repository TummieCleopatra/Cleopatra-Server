-----------------------------------
--
-- dsp.effect.TRICK_ATTACK
--
-----------------------------------

function onEffectGain(target,effect)
    if (target:getObjType() == dsp.objType.TRUST) then
        local agi = target:getMainLvl()
        target:addMod(dsp.mod.AGI, math.floor((agi/4) * 3))
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    if (target:getObjType() == dsp.objType.TRUST) then
        local agi = target:getMainLvl()
        target:delMod(dsp.mod.AGI, math.floor((agi/4) * 3))
        printf("TA Wore off")
    end
end