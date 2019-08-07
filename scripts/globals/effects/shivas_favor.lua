-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local mab = (power * 2) + 4;

    target:addMod(dsp.mod.ICEACC,bonus);
    target:addMod(dsp.mod.ICEATT,bonus);
    target:addMod(dsp.mod.ICEDEF,bonus);
    target:addMod(dsp.mod.ICERES,res);
    target:addMod(dsp.mod.MATT,mab);
	target:addMod(dsp.mod.INT,bonus);
end

function onEffectTick(target,effect)
    if (not target:isPet()) then
        return;
    end
    local owner = target:getMaster();

    local party = owner:getParty();
	local pet = owner:getPet();
    if (party ~= nil) then
        for i,member in ipairs(party) do
		    if (member:checkDistance(pet) < 10) then
            member:addStatusEffect(dsp.effect.SHIVA_S_FAVOR, effect:getPower(), 0, 3);

			end
        end
    end
end

function onEffectLose(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local mab = (power * 2) + 4;

    target:delMod(dsp.mod.ICEACC,bonus);
    target:delMod(dsp.mod.ICEATT,bonus);
    target:delMod(dsp.mod.ICEDEF,bonus);
    target:delMod(dsp.mod.ICERES,res);
    target:delMod(dsp.mod.MATT,mab);
	target:delMod(dsp.mod.INT,bonus);
end