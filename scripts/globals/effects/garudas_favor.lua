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
	local rac = (power * 1.5);

    target:addMod(dsp.mod.WINDACC,bonus); -- +21 @417 SMN Skill
    target:addMod(dsp.mod.WINDATT,bonus); -- +21 @417 SMN Skill
    target:addMod(dsp.mod.WINDDEF,bonus); -- +21 @417 SMN Skill
    target:addMod(dsp.mod.WINDRES,res); -- +48 @417 SMN Skill
    target:addMod(dsp.mod.EVA,bonus); -- +21 @417 SMN Skill
    target:addMod(dsp.mod.RACC,rac);  -- + 11% RACC @417 SMN Skill
	target:addMod(dsp.mod.AGI,bonus); -- +21 @417 SMN Skill
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
            member:addStatusEffect(dsp.effect.GARUDA_S_FAVOR, effect:getPower(), 0, 3);

			end
        end
    end
end

function onEffectLose(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local rac = (power * 0.25) + 1;

    target:delMod(dsp.mod.WINDACC,bonus); -- +21 @417 SMN Skill
    target:delMod(dsp.mod.WINDATT,bonus); -- +21 @417 SMN Skill
    target:delMod(dsp.mod.WINDDEF,bonus); -- +21 @417 SMN Skill
    target:delMod(dsp.mod.WINDRES,res); -- +48 @417 SMN Skill
    target:delMod(dsp.mod.EVA,bonus); -- +21 @417 SMN Skill
    target:delMod(dsp.mod.RACC,rac);  -- + 11% RACC @417 SMN Skill
	target:delMod(dsp.mod.AGI,bonus); -- +21 @417 SMN Skill
end