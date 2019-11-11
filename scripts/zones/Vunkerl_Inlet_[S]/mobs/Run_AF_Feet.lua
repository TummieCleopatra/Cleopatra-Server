-----------------------------------
-- Area: Vunkerl Inlet (S)
--  MOB: Chess Piece
-----------------------------------
local ID = require("scripts/zones/Vunkerl_Inlet_[S]/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
    player:setVar("RUN_AF_FEET",1)
    player:setVar("RUN_AF_ACCEPTED",0)
    player:setVar("RUN_AF_FIGHT",0)
    player:PrintToPlayer("You have shown courage...return to Fivinne to collect your reward.", 0x1F);
end;