-----------------------------------
-- Area: BCNM
--  MOB: Cobra Mercenary
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/instance_utils");
require("scripts/globals/pathfind");
-----------------------------------
local ID = require("scripts/zones/Ghoyus_Reverie/IDs")

function onMobSpawn(mob)
    mob:setMobMod(dsp.mobMod.NO_MOVE, 1)
    mob:SetAutoAttackEnabled(false)
    mob:SetMagicCastingEnabled(false)
    mob:setLocalVar("Spawn",0)
end

function onMobFight(mob)
    mob:setMobMod(dsp.mobMod.NO_MOVE, 1)
    local spawn = mob:getLocalVar("Spawn")
    local posx = mob:getXPos();
    local posy = mob:getYPos();
    local posz = mob:getZPos();
    local instance = mob:getInstance();

    if (mob:getHPP() < 95 and spawn == 0) then
        instance:setProgress(3);
        mob:setLocalVar("Spawn",1)
    elseif (mob:getHPP() < 60 and spawn == 1) then
        instance:setProgress(3);
        mob:setLocalVar("Spawn",2)
    end



end

function onMobDeath(mob)
    local instance = mob:getInstance();
    instance:complete();
    for i,v in pairs(ID.mob[3]) do
        DespawnMob(v, instance);
    end

    for i,v in pairs(ID.mob[4]) do
        DespawnMob(v, instance);
    end



end
