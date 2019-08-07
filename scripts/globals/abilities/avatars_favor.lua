-----------------------------------
-- Ability: Avatar's Favor
-- Enhances Avatar's Attack Power at the cost of avatar perpetuation

-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local skill = player:getSkillLevel(dsp.skill.SUMMONING_MAGIC);
    local pet = caster:getPet();
    local attBuff = (skill / 250) + 3;
    local accBuff = (skill / 10) + 1;
    local mabBuff = (skill / 6) + 1;
    local tpBonus = (skill / 0.6);

    pet:addMod(dsp.mod.ATTP, attBuff)
    pet:addMod(dsp.mod.ACC, accBuff)
    pet:addMod(dsp.mod.MAB, mabBuff)
    pet:addMod(dsp.mod.TP_BONUS, tpBonus)

end;