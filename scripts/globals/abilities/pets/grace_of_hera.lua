---------------------------------------------
-- Grace of Hera
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill, master)

    target:eraseAllStatusEffect();
    local reghp = master:getSkillLevel(dsp.skill.SUMMONING_MAGIC);
	local regen = (reghp / 10);
	local regain = (reghp / 69) + 1;
    local base = target:getMaxHP() - target:getHP();

    target:addHP(base);
    target:wakeUp();

    skill:setMsg(dsp.msg.basic.SELF_HEAL);
    target:addStatusEffect(dsp.effect.REGEN, regen, 3, 60);
	target:addStatusEffect(dsp.effect.REGAIN, regain, 3, 60);
   -- master:delMod(MOD_UFASTCAST, -300);
	master:addStatusEffect(dsp.effect.WEAKNESS,1,0,180);
	master:delStatusEffect(dep.effect.ASTRAL_FLOW);


    return base;

end
