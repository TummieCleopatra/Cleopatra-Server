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
	local def = (power * 4);

    target:addMod(dsp.mod.EARTHACC,bonus);
    target:addMod(dsp.mod.EARTHATT,bonus);
    target:addMod(dsp.mod.EARTHDEF,bonus);
    target:addMod(dsp.mod.EARTHRES,res);
    target:addMod(dsp.mod.DEF,def);
	target:addMod(dsp.mod.VIT,bonus);
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
            member:addStatusEffect(dsp.effect.TITAN_S_FAVOR, effect:getPower(), 0, 3);

			end
        end
    end
end

function onEffectLose(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local def = (power * 4);

    target:delMod(dsp.mod.EARTHACC,bonus);
    target:delMod(dsp.mod.EARTHATT,bonus);
    target:delMod(dsp.mod.EARTHDEF,bonus);
    target:delMod(dsp.mod.EARTHRES,res);
    target:delMod(dsp.mod.DEF,def);
	target:delMod(dsp.mod.VIT,bonus);
end