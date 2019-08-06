-----------------------------------
-- Ability: Life Cycle
-- Distributes one fourth of your HP to your luopan.
-- Cleopatra Effect: Adds Stoneskin when over max HP
-- Obtained: Geomancer Level 50
-- Recast Time: 10 Minutes
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
    local hp = player:getHP()
    local pet = player:getPet()
    local pethp = pet:getHP()
    local petmax = pet:getMaxHP()
    local difhp = petmax - pethp
    local transfer = hp * 0.25
    if (difhp < transfer) then
        local stoneskin = transfer - difhp
        pet:addStatusEffect(dsp.effect.STONESKIN,stoneskin,0,25,0,0,15)
    end
    pet:addHP(transfer)
    player:delHP(transfer)



end;