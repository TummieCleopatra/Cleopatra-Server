-----------------------------------
-- Ability: Dematerialize
-- Prevents your luopan from receiving damage.
-- Obtained: Geomancer Level 70
-- Recast Time: 10 minutes
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg")

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil or not player:getPetID() == 75) then
        return player:messageBasic(dsp.msg.basic.REQUIRES_A_LUOPAN, 0);
    else
        return 0, 0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet()
    local regen = pet:getMod(dsp.mod.REGEN_DOWN)
    pet:addStatusEffect(dsp.effect.REGEN, regen, 3, 60)
    pet:addStatusEffect(dsp.effect.PHYSICAL_SHIELD, 0, 0, 60)
    pet:addStatusEffect(dsp.effect.MAGIC_SHIELD, 0, 0, 60)
end;