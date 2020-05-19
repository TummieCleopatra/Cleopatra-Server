-----------------------------------
-- Area: BCNM
--  MOB: Cobra Mercenary
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/instance_utils");
require("scripts/globals/pathfind");
require("scripts/globals/allyassist")
-----------------------------------




function onMobSpawn(mob)
    mob:setLocalVar("Path",1);
    mob:setMobMod(dsp.mobMod.NO_DESPAWN, 1) -- SUPER IMPORTANT!!!!!!
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,25)
    mob:setMobMod(dsp.mobMod.NO_MOVE,1)
    mob:setLocalVar("Move",0)
    mob:setSpawn(-384,0,40)
    mob:setLocalVar("Ready",0)
end



function onMobRoam(mob)
    local pathing = mob:getLocalVar("Path");
    local move = mob:getLocalVar("Move")
    local instance = mob:getInstance();
    local mobs = mob:getInstance():getMobs();

    if (instance:getProgress() >= 1) then
        feastNpcUnitsRoam(mob)
        feastNpcAggro(mob)
        --[[
        if not(mob:getTarget()) then
            local pos = mob:getPos()
            if (pos.x > -368) then
                dsp.ally.startAssist(mob, dsp.ally.ASSIST_RANDOM);
            end

        end]]--
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