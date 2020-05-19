local ID = require("scripts/zones/Ghoyus_Reverie/IDs")



function enemyRoamManifest(mob)
    local pathing = mob:getLocalVar("Path");
    local mobid = mob:getID()
    local instance = mob:getInstance();
    if (mob:isFollowingPath() == false and pathing == 1 and instance:getProgress() < 13) then
        mob:speed(30)
        if (mobid == 17305653) then
            mob:pathThrough(ID.mobPath[1], 1)
            mob:setLocalVar("Path",0)
            mob:setLocalVar("PathType",1)
        elseif (mobid == 17305650) then
            mob:pathThrough(ID.mobPath[2], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",2)
        elseif (mobid == 17305656) then
            mob:pathThrough(ID.mobPath[3], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",3)
        elseif (mobid == 17305647) then
            mob:pathThrough(ID.mobPath[4], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",4)
        elseif (mobid == 17305648) then
            mob:pathThrough(ID.mobPath[5], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",5)
        elseif (mobid == 17305659) then
            mob:pathThrough(ID.mobPath[6], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",6)
        elseif (mobid == 17305651) then
            mob:pathThrough(ID.mobPath[7], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",7)
        elseif (mobid == 17305657) then
            mob:pathThrough(ID.mobPath[8], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",8)
        elseif (mobid == 17305660) then
            mob:pathThrough(ID.mobPath[9], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",9)
        elseif (mobid == 17305658) then
            mob:pathThrough(ID.mobPath[10], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",10)
        elseif (mobid == 17305649) then
            mob:pathThrough(ID.mobPath[11], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",11)
        elseif (mobid == 17305652) then
            mob:pathThrough(ID.mobPath[12], 1)
            mob:setLocalVar("Path",0);
            mob:setLocalVar("PathType",12)
        end


    end
end

function enemyPath(mob)
    local instance = mob:getInstance();
    local mobid = mob:getID()
    local stop = 0;
    local posPoint = {}
    local pathType = mob:getLocalVar("PathType")
    if (mobid == 17305653 and instance:getProgress() < 13) then
        stop = 11;
        posPoint = {0,1,2,3,4,5,6,7,8,9,10,11};
    elseif (mobid == 17305650 and instance:getProgress() < 13) then
        stop = 10;
        posPoint = {0,1,2,3,4,5,6,7,8,9,10};
    elseif (mobid == 17305656 and instance:getProgress() < 13) then
        stop = 9;
        posPoint = {0,1,2,3,4,5,6,7,8,9};
    elseif (mobid == 17305647 and instance:getProgress() < 13) then
        stop = 8;
        posPoint = {0,1,2,3,4,5,6,7,8};
    elseif (mobid == 17305648 and instance:getProgress() < 13) then
        stop = 7;
        posPoint = {0,1,2,3,4,5,6,7};
    elseif (mobid == 17305659 and instance:getProgress() < 13) then
        stop = 6;
        posPoint = {0,1,2,3,4,5,6};
    elseif (mobid == 17305651 and instance:getProgress() < 13) then
        stop = 5;
        posPoint = {0,1,2,3,4,5};
    elseif (mobid == 17305657 and instance:getProgress() < 13) then
        stop = 4;
        posPoint = {0,1,2,3,4};
    elseif (mobid == 17305660 and instance:getProgress() < 13) then
        stop = 3;
        posPoint = {0,1,2,3};
    elseif (mobid == 17305658 and instance:getProgress() < 13) then
        stop = 2;
        posPoint = {0,1,2};
    elseif (mobid == 17305649 and instance:getProgress() < 13) then
        stop = 1;
        posPoint = {0,1};
    elseif (mobid == 17305652 and instance:getProgress() < 13) then
        stop = 0;
        posPoint = {0};
    end

	-- printf("Mob is at stop point??")
    if (mob:isFollowingPath()) then
        if (mob:atPoint(dsp.path.get(ID.mobPath[pathType],stop))) then
            mob:setLocalVar("PathDone",1);
            mob:clearPath();
            mob:setLocalVar("Path",0);
        else
            for i, v in ipairs(posPoint) do -- Set the Current Point of the Path so that the Mob can continue later on from this point
                local currentPoint = dsp.path.get(ID.mobPath[pathType],v)
				local mobid = mob:getID()

                if (mob:atPoint(currentPoint)) then
				    printf("%u is at specific point",mobid)
                    mob:setLocalVar("CurrentPathPoint",v);
                end
            end
        end
    end
end

 -- A FEST FOR GNATS --

function feastNpcRoam(mob)

    local pathing = mob:getLocalVar("Path");
    local mobid = mob:getID()

    if (mob:isFollowingPath() == false and pathing == 1) then
        mob:speed(20)
        mob:pathThrough(ID.feastPath.ROMAA, 1)
        mob:setLocalVar("Path",0);
    elseif (mob:isFollowingPath() == false) then

    end
end

function feastNpcUnitsRoam(mob)
    mob:setMobMod(dsp.mobMod.NO_MOVE,0)
    local pathing = mob:getLocalVar("Path");
    local mobid = mob:getID()

    if (mob:isFollowingPath() == false and pathing == 1) then
        mob:speed(20)
        printf("TRY")
        mob:pathThrough(ID.feastPath.UNIT2, 1)
        mob:setLocalVar("Path",0);
    elseif (mob:isFollowingPath() == false) then

    end
end



function feastNpcAggro(mob)
    local instance = mob:getInstance();
    local mobs = mob:getInstance():getMobs();

    for i,npc in pairs(mobs) do
        if (npc:getID() >= 17305693 and npc:getID() <= 17305712) then
            local npcID = npc:getID()
            if (mob:checkDistance(npc) < 15) then
                if (npc:isAlive()) then
	                mob:addEnmity(npc,0,1);
                    mob:clearPath()
                    mob:setLocalVar("Ready",0)
	                break;
                end
            end
        end
    end
end



