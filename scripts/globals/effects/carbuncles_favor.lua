-----------------------------------
--
--
--
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local reg = (power * 2) + 1;

    target:addMod(dsp.mod.LIGHTACC,bonus);
    target:addMod(dsp.mod.LIGHTATT,bonus);
    target:addMod(dsp.mod.LIGHTDEF,bonus);
    target:addMod(dsp.mod.LIGHTRES,res);
    target:addMod(dsp.mod.REGEN,reg);
	target:addMod(dsp.mod.CHR,bonus);
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
            member:addStatusEffect(dsp.effect.CARBUNCLE_S_FAVOR, effect:getPower(), 0, 3);

			end
        end
    end
end

function onEffectLose(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local reg = (power * 2) + 1;

    target:delMod(dsp.mod.LIGHTACC,bonus);
    target:delMod(dsp.mod.LIGHTATT,bonus);
    target:delMod(dsp.mod.LIGHTDEF,bonus);
    target:delMod(dsp.mod.LIGHTRES,res);
    target:delMod(dsp.mod.REGEN,reg);
	target:delMod(dsp.mod.CHR,bonus);
end