-----------------------------------
-- Area: BCNM
--  MOB: Cobra Mercenary
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/instance_utils");
require("scripts/globals/pathfind");
-----------------------------------
local ID = require("scripts/zones/Ghoyus_Reverie/IDs")

local run =
{
   -356,0,1,
   -356,0,26,
   -340,0,38,
}

function onMobSpawn(mob)
    mob:setLocalVar("Path",1);
    mob:setMobMod(dsp.mobMod.NO_DESPAWN, 1) -- SUPER IMPORTANT!!!!!!
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,15)
    mob:setMobMod(dsp.mobMod.NO_MOVE,1)
    mob:setLocalVar("Move",0)
    mob:setSpawn(-384,0,40)
    mob:SetMagicCastingEnabled(false)  -- No casting allowed until near belfry
end


function onMobRoam(mob)
    local pathing = mob:getLocalVar("Path");
    local move = mob:getLocalVar("Move")
    local instance = mob:getInstance();
    local mobid = mob:getID()

    if (instance:getProgress() == 1) then
        mob:setLocalVar("Move",1)
    end
    if (move == 1 and mob:isFollowingPath() == false and pathing == 1) then
        mob:speed(35)
        mob:pathThrough(run, 1)
        mob:setLocalVar("Path",0);
        mob:setLocalVar("PathType",1)
    end
    local randomfight = math.random(1,100)
    local mobs = mob:getInstance():getMobs();

    if (mob:atPoint(dsp.path.get(run,3))) then
        mob:SetMagicCastingEnabled(true)   -- Enable casting
        for i,npc in pairs(mobs) do
            if (npc:getID() >= 17305683 and npc:getID() <= 17305692) then
                local act = mob:getCurrentAction()
                local npcID = npc:getID()
                if (mob:checkDistance(npc) < 15) then
                    if (randomfight < 10 and npc:isAlive() and act ~= dsp.act.ATTACK) then
	                    mob:addEnmity(npc,0,1);
				        break;

                    end
                end
            end
        end
    end


end


function onMobDeath(mob, player, isKiller)


end