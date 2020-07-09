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
    local regain = 25 * buff
    mob:addMod(dsp.mod.REGAIN, regain)
    print(regain)
    local lvl = mob:getMainLvl()
    printf("Mob Level is %u", lvl)
    local acc = mob:getACC()
    local eva = mob:getEVA()
    local hp = mob:getHP()
    printf("Mob Accuracy is %u",acc)
    printf("Mob Evasion is %u",eva)
    printf("Mob HP is %u",hp)

end;

function onMobRoam(mob)



end

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