-----------------------------------
-- Area: BCNM
--  MOB: Romaa Mihgo
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/instance_utils");
require("scripts/globals/pathfind");
require("scripts/globals/allyassist")
-----------------------------------



function onMobSpawn(mob)
    mob:setLocalVar("Path",1);
    mob:setLocalVar("Ready",0)
   -- mob:setMobMod(dsp.mobMod.NO_DESPAWN, 1) -- SUPER IMPORTANT!!!!!!
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,15)
    -- mob:setMobMod(dsp.mobMod.NO_MOVE,1)
    mob:setLocalVar("Move",0)
    mob:setSpawn(-384,0,40)
    mob:setModelId(1801);


end

function onMobRoam(mob)

    local pathing = mob:getLocalVar("Path");
    local move = mob:getLocalVar("Move")
    local instance = mob:getInstance();
    local mobs = mob:getInstance():getMobs();

    if (instance:getProgress() >= 1) then
        feastNpcRoam(mob)
        if not(mob:getTarget()) then
            dsp.ally.startAssist(mob, dsp.ally.ASSIST_RANDOM);
        end
    end

    if (move == 0) then
        local nearbyTargets = mob:getTargetsWithinArea(35, 1);
        for i,member in ipairs(nearbyTargets) do
            if (member:getObjType() == dsp.objType.PC) then
                instance:setProgress(1);
                -- mob:setMobMod(dsp.mobMod.NO_MOVE,0)
                mob:SetAutoAttackEnabled(true)
                feastNpcRoam(mob)
                mob:setAggressive(1)
                mob:setLocalVar("Move",1)

                break
            end
        end
    end

end

function onMobEngage(mob, target)
    -- This is a hack to force reload the model
    local modelID = mob:getModelId();
    mob:setModelId(1000)
    mob:setModelId(modelID);

end

function onMobFight(mob, target)


end

function onPath(mob)
--[[
    local instance = mob:getInstance();
    if (instance:getProgress() < 1) then
        enemyPath(mob)
    end ]]--
end;

function onMobDeath(mob, player, isKiller)

end;