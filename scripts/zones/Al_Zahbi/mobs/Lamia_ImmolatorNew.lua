-----------------------------------
-- Area: West Saurtabaruta (S)
-- Mob: Divine Templar
-- Note: Campaign Mob
-----------------------------------
local ID = require("scripts/zones/Al_Zahbi/IDs")
require("scripts/zones/Al_Zahbi/globals");
require("scripts/globals/mobs")
-- require("scripts/globals/pathfind");
require("scripts/globals/status");
-- require("scripts/globals/campaign_utils");
-----------------------------------

local test1 =
{
	-79, 2, 84,
    -42, 2, 76,
	-40, 0, 56, -- Stairs Left side
	-14, 0, 40,
	20, 0, 40, -- Main area near AC
	39, 0, 60, -- Make left towards AC, stairs are on the lef to go up
	40, 0, 99, -- Main AC area stairs on right
	59, 0, 119, -- in front of Hall of Binding
}


function onMobSpawn(mob)
    mob:setLocalVar("Pathing",1)
    undeadStrength(mob)
    mob:setMobMod(dsp.mobMod.NO_DESPAWN, 1) -- SUPER IMPORTANT!!!!!!
    mob:setMobMod(dsp.mobMod.ROAM_DISTANCE,9999)
    mob:setMobMod(dsp.mobMod.NO_MOVE, 1);
end

function onMobRoam(mob)
    mob:speed(50)
    local paths = mob:getLocalVar("Pathing")
    printf("Look I am roaming")
    if (mob:isFollowingPath() == false) then
        printf("Try Path")

        mob:pathThrough(test1, 1)
        mob:setLocalVar("Pathing",2)

    else
        mobAggroNpc(mob)
        printf("On Path")
    end

end





function onMobFight(mob,target)

end

function onMobDisengage(mob)
    mob:clearTargID()
    mob:resetAI()
end

function onPath(mob)

end;

function onMobDeath(mob, player, isKiller)

end
