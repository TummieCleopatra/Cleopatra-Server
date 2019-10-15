



require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(pet,target,ability)

end;


-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(pet, target, skill, action)

    pet:delStatusEffectSilent(dsp.effect.LIGHT_ARTS)
    pet:delStatusEffectSilent(dsp.effect.ADDENDUM_WHITE)
    pet:delStatusEffectSilent(dsp.effect.DARK_ARTS)

    local skillbonus = pet:getMod(dsp.mod.DARK_ARTS_SKILL)
    local effectbonus = pet:getMod(dsp.mod.DARK_ARTS_EFFECT)
    local helixbonus = 0
    if (pet:getMainJob() == dsp.job.SCH and pet:getMainLvl() >= 20) then
        helixbonus = math.floor(pet:getMainLvl() / 4)
    end

    pet:addStatusEffectEx(dsp.effect.ADDENDUM_BLACK,dsp.effect.ADDENDUM_BLACK,effectbonus,0,7200,0,helixbonus,true)

end