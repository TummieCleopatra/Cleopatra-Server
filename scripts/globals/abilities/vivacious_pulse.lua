-----------------------------------
-- Ability: Vivacious Pulse
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/job_util")

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
    local hp, mp = doVivaciousPulse(player, ability)
    local tenebrae = player:countEffect(dsp.effect.TENEBRAE)
    if (tenebrae == 0) then
        player:addHP(hp)
        player:messageBasic(dsp.msg.basic.RECOVERS_HP,0,hp)
    else
        mp = math.floor(divine / 10) * tenebrae
        player:addHP(hp)
        player:addMP(mp)
        player:messageBasic(dsp.msg.basic.RECOVERS_HP,0,hp)
        player:messageBasic(dsp.msg.basic.RECOVERS_MP,0,mp)
    end
end;