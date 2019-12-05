-----------------------------------
-- Area: West Saurtabaruta (S)
-- Mob: Divine Templar
-- Note: Campaign Mob
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs")
require("scripts/zones/West_Sarutabaruta_[S]/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
require("scripts/globals/campaign_utils");
-----------------------------------

function onMobSpawn(mob)

    mob:setLocalVar("Path",1);
    local randPath = math.random(1,6)
    if (randPath == 1) then
        mob:setSpawn(-10,-13,302,180)
    elseif (randPath == 2) then
        mob:setSpawn(-7,-12,290,180)
    elseif (randPath == 2) then
        mob:setSpawn(7,-13,297,180)
    elseif (randPath == 2) then
        mob:setSpawn(1,-12,327,180)
    elseif (randPath == 2) then
        mob:setSpawn(4,-13,334,180)
    elseif (randPath == 2) then
        mob:setSpawn(9,-13,332,180)
    end

    mob:setLocalVar("RandPath",randPath)
    mob:setMobMod(dsp.mobMod.NO_DESPAWN, 1) -- SUPER IMPORTANT!!!!!!
   -- mob:setMobMod(dsp.mobMod.ROAM_DISTANCE, )
end

function onMobRoam(mob)
    local yag = mob:getID()
    local randPath = mob:getLocalVar("RandPath")
    local pathing = mob:getLocalVar("Path");
    if (mob:isFollowingPath() == false and pathing == 1) then
        mob:speed(30)
        printf("Not Following Path set speed and start pathing for %u",yag)
        mob:pathThrough(WEST_SARUTABARUTA.mobPath[randPath], 9)
        mob:setLocalVar("Path",0);
    end
	local randomfight = math.random(1,10) -- Will randomly agro an NPC if it is fighting
    -- See which NPC's are up before deciding how it will look for the specific NPC
    --[[
    for id = ID.campaign.NPCS[1].npc_start,ID.campaign.NPCS[1].npc_end do
		-- make random hrre to see if it will attack an npc that is already fighting
        -- if (GetMobAction(id) ~= ACTION_NONE) then  -- ID is up
			if (mob:checkDistance(GetMobByID(id)) < 20) then
				if ((GetMobAction(id) == 1) and (randomfight < 1)) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            elseif (GetMobAction(id) ~= 1) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            end
            end
		-- end
	end
    --]]
    for id = ID.campaign.NPCS[2].npc_start,ID.campaign.NPCS[2].npc_end do
		-- make random hrre to see if it will attack an npc that is already fighting
        -- if (GetMobAction(id) ~= ACTION_NONE) then  -- ID is up
			if (mob:checkDistance(GetMobByID(id)) < 20) then
				if ((GetMobAction(id) == 1) and (randomfight < 1)) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            elseif (GetMobAction(id) ~= 1) then
	                mob:addEnmity(GetMobByID(id),0,1);
					break;
	            end
            end
		-- end
	end
end

function onPath(mob)

    local randPath = mob:getLocalVar("RandPath")
    if (mob:isFollowingPath()) then
        if (mob:atPoint(dsp.path.get(WEST_SARUTABARUTA.mobPath[randPath],6))) then
            printf("Done")
            mob:clearPath();
            mob:setStatus(0)
         end
    end
end;

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
end
