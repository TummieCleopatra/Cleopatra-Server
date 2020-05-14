-----------------------------------
-- Area: Jugner Forest
--  MOB: Cernunnos
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:setVar("DaughterOfaKnight",5)
end;
