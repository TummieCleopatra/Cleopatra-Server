-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local curepot = (power + 3);

    target:addMod(dsp.mod.WATERACC,bonus);
    target:addMod(dsp.mod.WATERATT,bonus);
    target:addMod(dsp.mod.WATERDEF,bonus);
    target:addMod(dsp.mod.WATERRES,res);
    target:addMod(dsp.mod.CURE_POTENCY,curepot);
	target:addMod(dsp.mod.MND,bonus);
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
            member:addStatusEffect(dsp.effect.LEVIATHAN_S_FAVOR, effect:getPower(), 0, 3);

			end
        end
    end
end

function onEffectLose(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local curepot = (power + 3);

    target:delMod(dsp.mod.WATERACC,bonus);
    target:delMod(dsp.mod.WATERATT,bonus);
    target:delMod(dsp.mod.WATERDEF,bonus);
    target:delMod(dsp.mod.WATERRES,res);
    target:delMod(dsp.mod.CURE_POTENCY,curepot);
	target:delMod(dsp.mod.MND,bonus);
end