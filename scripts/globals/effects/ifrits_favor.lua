-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local att = (power * 1.6) + 1;

    target:addMod(dsp.mod.FIREACC,bonus);
    target:addMod(dsp.mod.FIREATT,bonus);
    target:addMod(dsp.mod.FIREDEF,bonus);
    target:addMod(dsp.mod.FIRERES,res);
    target:addMod(dsp.mod.ATT,att);
	target:addMod(dsp.mod.STR,bonus);
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
            member:addStatusEffect(dsp.effect.IFRIT_S_FAVOR, effect:getPower(), 0, 3);

			end
        end
    end
end

function onEffectLose(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local att = (power * 1.6) + 1;

    target:delMod(dsp.mod.FIREACC,bonus);
    target:delMod(dsp.mod.FIREATT,bonus);
    target:delMod(dsp.mod.FIREDEF,bonus);
    target:delMod(dsp.mod.FIRERES,res);
    target:delMod(dsp.mod.ATT,att);
	target:delMod(dsp.mod.STR,bonus);
end