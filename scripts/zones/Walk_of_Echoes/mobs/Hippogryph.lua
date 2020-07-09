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
    local eva = 6 * buff
    mob:addMod(dsp.mod.EVA, eva)
    printf("Evasion Bonus is %u",eva)

end;

function onMobDeath(mob, player, isKiller)

    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);

end;

function onMobFight(mob, target)


end

function onMobDespawn(mob)
    --[[
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
    ]]
end;