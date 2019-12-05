-----------------------------------
-- Area: GM Home
--  MOB: Test Mob Leech
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------



function onMobFight(mob, target)
    local battletime = mob:getBattleTime();
    local btime = mob:getLocalVar("btime")
    local mp = mob:getMP()

    local brand = math.random(30,40)
    if (battletime > btime + brand) then
        -- mob:castSpell(273, target)
        mob:setLocalVar("btime",battletime)
    end


end

function onMobDeath(mob, player, isKiller)

end;
