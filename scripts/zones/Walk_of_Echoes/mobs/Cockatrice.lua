-----------------------------------
-- Area: Walk of Echoes
--  MOB: Barbaric bird
-- Gains stronger Regain the more mobs defeated
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/sojourn");
local ID = require("scripts/zones/Walk_of_Echoes/IDs")
-----------------------------------
function onMobSpawn(mob)
    t1Difficulty(mob)
end

function onMobEngaged(mob,target)
    local instance = mob:getInstance();
    local buff = instance:getProgress()
    local haste = 200 * buff
    mob:addMod(dsp.mod.HASTE_ABILITY, haste)
    mob:addMod(dsp.mod.HASTE_MAGIC, haste)

end;

function onMobDeath(mob, player, isKiller)

    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);

end;

function onMobDespawn(mob)
    --[[
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
    ]]
end;