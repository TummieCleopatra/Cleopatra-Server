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
	local ref = (power / 2);

    target:addMod(dsp.mod.DARKACC,bonus);
    target:addMod(dsp.mod.DARKATT,bonus);
    target:addMod(dsp.mod.DARKDEF,bonus);
    target:addMod(dsp.mod.DARKRES,res);
    target:addMod(dsp.mod.REFRESH,ref);

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
            member:addStatusEffect(dsp.effect.DIABOLOS_S_FAVOR, effect:getPower(), 0, 3);

			end
        end
    end
end

function onEffectLose(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local ref = (power / 2);

    target:delMod(dsp.mod.DARKACC,bonus);
    target:delMod(dsp.mod.DARKATT,bonus);
    target:delMod(dsp.mod.DARKDEF,bonus);
    target:delMod(dsp.mod.DARKRES,res);
    target:delMod(dsp.mod.REFRESH,ref);

end