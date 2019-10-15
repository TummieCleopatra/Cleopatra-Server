



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
    pet:delStatusEffect(dsp.effect.ADDENDUM_WHITE)
    pet:delStatusEffect(dsp.effect.PENURY)
    pet:delStatusEffect(dsp.effect.CELERITY)
    pet:delStatusEffect(dsp.effect.ACCESSION)
    pet:delStatusEffect(dsp.effect.RAPTURE)
    pet:delStatusEffect(dsp.effect.ALTRUISM)
    pet:delStatusEffect(dsp.effect.TRANQUILITY)
    pet:delStatusEffect(dsp.effect.PERPETUANCE)

    local helixbonus = 0
    if (pet:getMainJob() == dsp.job.SCH and pet:getMainLvl() >= 20) then
        helixbonus = math.floor(pet:getMainLvl() / 4)
    end

    pet:addStatusEffect(dsp.effect.DARK_ARTS,1,0,7200,0,helixbonus)

end