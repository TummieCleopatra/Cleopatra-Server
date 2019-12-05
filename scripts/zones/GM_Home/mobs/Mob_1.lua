-----------------------------------
-- Area: GM Home
--  MOB: Test Mob Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------



function onMobFight(mob, target)
    local battletime = mob:getBattleTime();
    local btime = mob:getLocalVar("btime")
    --[[
    local brand = math.random(10,20)
    if (battletime > btime + brand) then
        mob:useMobAbility(416);
        mob:setLocalVar("btime",battletime)
    end]]--
     mob:setDelay(1500)

end

function onMobDeath(mob, player, isKiller)

end;
