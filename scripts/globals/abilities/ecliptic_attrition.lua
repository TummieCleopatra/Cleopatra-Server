---------------------------------------------------
-- Ability: Ecliptic Attrition
-- Enhances the effects of your luopan. Increases
-- the rate at which your luopan consumes its HP.
-- Obtained: Geomancer Level 25
-- Recast Time: 5:00
-- Duration: Instant
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("scripts/globals/msg");

---------------------------------------------------

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil or not player:getPetID() == 75) then
        return player:messageBasic(dsp.msg.basic.REQUIRES_A_LUOPAN, 0;
    else
        return 0, 0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local pet = player:getPet();
    local hploss = math.floor((player:getMainLvl()/4) * 1.25);
	pet:delMod(dsp.mod.REGEN_DOWN)
	pet:addMod(dsp.mod.REGEN_DOWN, hploss)
    pet:setLocalVar("potboost",1.25)
    player:messageBastic(dsp.msg.basic.LUOPAN_CONSUMPTION_INCREASED)
end;