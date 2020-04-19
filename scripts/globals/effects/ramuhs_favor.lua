-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local rac = (power * 1.5);
    local crit = (power / 2) + 3


    target:addMod(dsp.mod.THUNDERACC,bonus); -- +21 @417 SMN Skill
    target:addMod(dsp.mod.THUNDERATT,bonus); -- +21 @417 SMN Skill
    target:addMod(dsp.mod.THUNDERDEF,bonus); -- +21 @417 SMN Skill
    target:addMod(dsp.mod.THUNDERRES,res); -- +48 @417 SMN Skill
    target:addMod(dsp.mod.CRITHITRATE,crit); -- +7 @269 SMN Skill
    target:addMod(dsp.mod.CRIT_DMG_INCREASE,crit);  -- + 11% RACC @417 SMN Skill
	target:addMod(dsp.mod.DEX,bonus); -- +11 @269 SMN Skill
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
            member:addStatusEffect(dsp.effect.RAMUH_S_FAVOR, effect:getPower(), 0, 3);

			end
        end
    end
end

function onEffectLose(target,effect)
    local power = effect:getPower();
	local bonus = power + 2;
	local res = power + 2;
	local rac = (power * 0.25) + 1;
    local crit = (power / 2) + 3

    target:delMod(dsp.mod.THUNDERACC,bonus); -- +21 @417 SMN Skill
    target:delMod(dsp.mod.THUNDERATT,bonus); -- +21 @417 SMN Skill
    target:delMod(dsp.mod.THUNDERDEF,bonus); -- +21 @417 SMN Skill
    target:delMod(dsp.mod.THUNDERRES,res); -- +48 @417 SMN Skill
    target:delMod(dsp.mod.CRITHITRATE,crit); -- +21 @417 SMN Skill
    target:delMod(dsp.mod.CRIT_DMG_INCREASE,crit);   -- + 11% RACC @417 SMN Skill
	target:delMod(dsp.mod.DEX,bonus); -- +21 @417 SMN Skill
end