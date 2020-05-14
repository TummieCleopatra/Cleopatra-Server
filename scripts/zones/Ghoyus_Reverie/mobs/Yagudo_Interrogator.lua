-----------------------------------
-- Area: BCNM
--  MOB: Yagudo Herald
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/instance_utils");
require("scripts/globals/pathfind");
-----------------------------------
function onMobSpawn(mob)
    mob:setLocalVar("Path",1);
    mob:setMobMod(dsp.mobMod.NO_DESPAWN, 1) -- SUPER IMPORTANT!!!!!!
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,15)
    mob:setMobMod(dsp.mobMod.NO_MOVE,1)
    mob:setLocalVar("Move",0)
    mob:setSpawn(-151,0,180)
    mob:setMod(dsp.mod.ATTP, -70)

end

function onMobRoam(mob)
    local move = mob:getLocalVar("Move")
    local instance = mob:getInstance();
    if (instance:getProgress() < 13) then
        if (move == 0 and mob:getID() == 17305653) then
            local nearbyTargets = mob:getTargetsWithinArea(40, 1);
            for i,member in ipairs(nearbyTargets) do
                if (member:getObjType() == dsp.objType.PC) then
                    instance:setProgress(1);
                    break
                end
            end
            if (instance:getProgress() == 1) then
                mob:setLocalVar("Move",1)
            end
        elseif (move == 0 and instance:getProgress() == 1) then
            mob:setLocalVar("Move",1)
        elseif (mob:getLocalVar("PathDone") == 1 and move == 1) then
            mob:setMobMod(dsp.mobMod.NO_MOVE,0)
            mob:clearPath()
            mob:setLocalVar("Move",2)
        elseif (move == 1) then
            enemyRoamManifest(mob)
        end
    else
        mob:setMobMod(dsp.mobMod.NO_MOVE,0)
    end
end

function onPath(mob)
    local instance = mob:getInstance();
    if (instance:getProgress() < 13) then
        enemyPath(mob)
    end
end;

function onMobDeath(mob, player, isKiller)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 1);
    local rand = math.random(1,100)
    if (rand < 30) then
        local amt = player:getMaxMP() - player:getMP()
        player:restoreMP(amt)
        player:messageBasic(dsp.msg.basic.RECOVERS_MP, 0, amt)
        local amt = player:getMaxHP() - player:getHP()
        player:restoreHP(amt)
        player:messageBasic(dsp.msg.basic.RECOVERS_HP, 0, amt)
    end
end;