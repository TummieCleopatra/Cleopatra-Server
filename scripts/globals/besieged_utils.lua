local ID = require("scripts/zones/Al_Zahbi/IDs")
-- require("scripts/zones/Al_Zahbi/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
require("scripts/globals/besieged_points");
require("scripts/globals/settings");

-- Move NPC ID's to a different file...maybe here??
function besiegedCheck(zone)
    local players = zone:getPlayers();
    -- Check the status of besieged Army's
    local besiegedStatus = GetServerVariable("[BESIEGED]STATUS");
    local mamool = GetServerVariable("[BESIEGED]Mamool_Ja_Status");
    local mamoolStart = GetServerVariable("[BESIEGED]Mamool_Start");
    local mamoolEnd = GetServerVariable("[BESIEGED]Mamool_Ja_End");
    local mamoolLvl = GetServerVariable("[BESIEGED]Mamool_LVL");
    local mamoolMarch = GetServerVariable("[BESIEGED]Mamool_Ja_March");

    local troll = GetServerVariable("[BESIEGED]Troll_Status");
    local trollStart = GetServerVariable("[BESIEGED]Troll_Start");
    local trollEnd = GetServerVariable("[BESIEGED]Troll_End");
    local trollLvl = GetServerVariable("[BESIEGED]Troll_LVL");

    local undead = GetServerVariable("[BESIEGED]Undead_Swarm_Status");
    local undeadStart = GetServerVariable("[BESIEGED]Undead_Swarm_Start");
    local undeadEnd = GetServerVariable("[BESIEGED]Undead_Swarm_End");
    local undeadLvl = GetServerVariable("[BESIEGED]Undead_Swarm_LVL");
    local undeadMarch = GetServerVariable("[BESIEGED]Undead_Swarm_March");

    local wins = GetServerVariable("[BESIEGED]Consecutive_Wins");
    local currentTime = os.time();
    local stop = 0;
    local march = 0

    -- March Check --
    if (mamool == 1) then
        if (players ~= nil) then
	        for i, player in pairs(players) do
	            player:messageSpecial(ID.text.MAMOOL_MARCH);
	        end
        end
        despawnNPCS()
        spawnForces()
        mamoolMarch = os.time() + 250
        SetServerVariable("[BESIEGED]Mamool_Ja_March",mamoolMarch)
        printf("Current time is %u",os.time())
        printf("Current march Time for Mamool Ja is %u",mamoolMarch)
    elseif (troll == 1) then
        if (players ~= nil) then
	        for i, player in pairs(players) do
	            player:messageSpecial(ID.text.TROLL_MARCH);
	        end
        end
        SetServerVariable("[BESIEGED]Troll_Status",10);
    elseif (undead == 1) then
        printf("Undead is equal to 1 somehow")
        if (players ~= nil) then
	        for i, player in pairs(players) do
	            player:messageSpecial(ID.text.UNDEAD_MARCH);
	        end
        end
        despawnNPCS()
        spawnForces()

        -- SetServerVariable("[BESIEGED]Undead_Swarm_Status",10);
        undeadMarch = os.time() + 250
        SetServerVariable("[BESIEGED]Undead_Swarm_March",undeadMarch)
        printf("Current time is %u",os.time())
        printf("Current march Time is %u",undeadMarch)

        -- Setup 5 min march time
    end

    -- Start Besieged
    -- Mamool Check
    -- if (mamool == 2) then  -- Mamool always goes first if there is a tie



    -- elseif (troll == 2 and mamool >= 10 and undead >= 10) then

    -- 1 Advancing
	-- 2 Attack
	-- 3 Retreat
	-- 4 Training
	-- 5 March

    -- Undead Status
    printf("[Undead Swarm Status is %u]",undead)
	printf("Undead_Swarm_March is %u",undeadMarch)

    printf("[Mamool Ja Status is %u]",mamool)
	printf("Mamool_Ja_March is %u",mamoolMarch)

    -- --------------------------- --
    -- Besieged Spawning Mechanism --
    -- --------------------------- --

    if ((mamool == 2) and (os.time() > mamoolMarch) and mamoolMarch ~= 0 and besiegedStatus ~= 1) then
        SetServerVariable("[BESIEGED]Mamool_Ja_March",0);
        local randomize = math.random(1,4)
		randomize = randomize * 3
		randomize = randomize * 60
        SetServerVariable("[BESIEGED]Mamool_Ja_End",os.time() + 1110 + randomize);
        printf("======== START MAMOOL JA BESIEGED!!! =========")
        printf("Current time is %u",os.time())
        printf("End time is: %u", os.time() + 1110 + randomize)
        SetServerVariable("[BESIEGED]Mamool_Ja_Status",3);
        SetServerVariable("[BESIEGED]STATUS",1);
        spawnMamool(mamoolLvl,zone)
        if (not player:isInMogHouse()) then
            if (players ~= nil) then
                for i, player in pairs(players) do
                    local start = math.random(1,20)
                    player:messageSpecial(ID.text.MAMOOL_START);
                    player:addStatusEffect(dsp.effect.BESIEGED,0,3,3600)
                    player:ChangeMusic(1, 142)
                    player:ChangeMusic(2, 142)
                    player:startEvent(8,start)
                end
            end
        else
            player:messageSpecial(ID.text.MAMOOL_START);
        end
    elseif ((undead == 2) and (os.time() > undeadMarch) and undeadMarch ~= 0 and besiegedStatus ~= 1) then
        -- SetServerVariable("[BESIEGED]Undead_Swarm_Start",0);
        SetServerVariable("[BESIEGED]Undead_Swarm_March",0);
        local randomize = math.random(1,4)
		randomize = randomize * 3
		randomize = randomize * 60
        SetServerVariable("[BESIEGED]Undead_Swarm_End",os.time() + 1110 + randomize);
        printf("======== START UNEAD BESIEGED!!! =========")
        printf("Current time is %u",os.time())
        printf("End time is: %u", os.time() + 1110 + randomize)

        SetServerVariable("[BESIEGED]Undead_Swarm_Status",3);
        SetServerVariable("[BESIEGED]STATUS",1);
        -- do cs here
        -- set spawns
        spawnUndead(undeadLvl,zone)
        if (not player:isInMogHouse()) then
            if (players ~= nil) then
                for i, player in pairs(players) do
                    local start = math.random(1,20)
                    player:messageSpecial(ID.text.UNDEAD_START);
                    player:addStatusEffect(dsp.effect.BESIEGED,0,3,3600)
                    player:ChangeMusic(1, 142)
                    player:ChangeMusic(2, 142)
                    player:startEvent(5,start)
                end
            end
        else
            player:messageSpecial(ID.text.UNDEAD_START);
        end
    end

   if (mamoolEnd > 1) then
        if (os.time() > mamoolEnd) then
            SetServerVariable("[BESIEGED]Mamool_End",1)
            if (mamoolLvl <= 3) then
            stop = 20
            elseif (mamoolLvl <= 7) then
                stop = 30
            else
                stop = 40
            end

			DespawnMob(ID.besieged.MAMOOL_BOSS[undeadLvl]) -- Spawn Boss for Level
            -- Depsawn Helpers
            despawnForces()
            -- Spawn Regular Zone NPCS
            spawnNPCS()
            for i, player in pairs(players) do
                local ending = math.random(1,20)
	            player:messageSpecial(ID.text.MAMOOL_LOSE);
                player:ChangeMusic(1, 178);
			    player:ChangeMusic(2, 178);
                player:startEvent(6,ending)
                calculatePoints(player)
                player:delStatusEffect(dsp.effect.BESIEGED)
	        end
                printf("[DEBUG] - The Mamool have retreated")
                SetServerVariable("[BESIEGED]Mamool_Status",11);
                -- Lets Cap Levels
                if (mamoolLvl < HORDE_CAP) then
                    SetServerVariable("[BESIEGED]Mamool_LVL",mamoolLvl + 1);
                end
                SetServerVariable("[BESIEGED]Consecutive_Wins", wins + 1);
            for i,v in pairs(ID.besieged.MAMOOL) do
            -- GetMobByID(v):setSpawn(-333,-20,231,180)
                if (i < stop) then
				    if (GetMobByID(v):isAlive()) then
			            printf("Despawning Mob ID: %u",v)
                        DespawnMob(v);
					    print(i)
				    end
                else
                    break
                end
            end
            -- Depsawn Helpers
            despawnForces()
            -- Spawn Regular Zone NPCS
            spawnNPCS()
            SetServerVariable("[BESIEGED]STATUS",0);
        end
    end

    if (trollEnd > 1) then
        if (os.time() > trollEnd) then
            SetServerVariable("[BESIEGED]Troll_End",1)
            if (trollLvl <= 3) then
            stop = 20
            elseif (trollLvl <= 7) then
                stop = 30
            else
                stop = 40
            end

			-- DespawnMob(ID.besieged.TROLL_BOSS[trollLvl]) -- Spawn Boss for Level
            -- Depsawn Helpers
            despawnForces()
            -- Spawn Regular Zone NPCS
            spawnNPCS()
            for i, player in pairs(players) do
                local ending = math.random(1,20)
	            player:messageSpecial(ID.text.TROLL_LOSE);
                player:ChangeMusic(1, 178);
			    player:ChangeMusic(2, 178);
                player:startEvent(6,ending)
                calculatePoints(player)
                player:delStatusEffect(dsp.effect.BESIEGED)
	        end
                printf("[DEBUG] - The Trolls have retreated due to Timeout")
                SetServerVariable("[BESIEGED]Troll_Status",11);
                -- Lets Cap Levels
                if (trollLvl < HORDE_CAP) then
                    SetServerVariable("[BESIEGED]Troll_LVL",trollLvl + 1);
                end
                SetServerVariable("[BESIEGED]Consecutive_Wins", wins + 1);
            for i,v in pairs(ID.besieged.TROLL) do
            -- GetMobByID(v):setSpawn(-333,-20,231,180)
                if (i < stop) then
				    if (GetMobByID(v):isAlive()) then
			            printf("Despawning Mob ID: %u",v)
                        DespawnMob(v);
					    print(i)
				    end
                else
                    break
                end
            end
            SetServerVariable("[BESIEGED]STATUS",0);
        end
    end

    if (undeadEnd > 1) then
        if (os.time() > undeadEnd) then
            SetServerVariable("[BESIEGED]Undead_Swarm_End",1)
            if (undeadLvl <= 3) then
            stop = 30
            elseif (undeadLvl <= 7) then
                stop = 40
            else
                stop = 40
            end

			DespawnMob(ID.besieged.UNDEAD_BOSS[undeadLvl]) -- Spawn Boss for Level
			DespawnMob(16974028) -- Lamia Elemental
            -- Depsawn Helpers
            despawnForces()
            -- Spawn Regular Zone NPCS
            spawnNPCS()
            for i, player in pairs(players) do
                local ending = math.random(1,20)
	            player:messageSpecial(ID.text.UNDEAD_LOSE);
                player:ChangeMusic(1, 178);
			    player:ChangeMusic(2, 178);
                player:startEvent(6,ending)
                calculatePoints(player)
                player:delStatusEffect(dsp.effect.BESIEGED)
	        end
                printf("[DEBUG] - The Undead have retreated due to Timeout")
                SetServerVariable("[BESIEGED]Undead_Swarm_Status",11);
                -- Lets Cap Levels
                if (undeadLvl < HORDE_CAP) then
                    SetServerVariable("[BESIEGED]Undead_Swarm_LVL",undeadLvl + 1);
                end
                SetServerVariable("[BESIEGED]Consecutive_Wins", wins + 1);
            for i,v in pairs(ID.besieged.UNDEAD) do
            -- GetMobByID(v):setSpawn(-333,-20,231,180)
                if (i < stop) then
				    if (GetMobByID(v):isAlive()) then
			            printf("Despawning Mob ID: %u",v)
                        DespawnMob(v);
					    print(i)
				    end
                else
                    break
                end
            end
            SetServerVariable("[BESIEGED]STATUS",0);
        end
    end
end;

-- ---------------------------------
--     Strength of Participants
-- ---------------------------------

function mamoolStrength(mob)
    local level = GetServerVariable("[BESIEGED]Mamool_LVL");
	local hpboost = (13 * level);
	local attboost = (5 * level) + 1;
	local defboost = (10 * level) + 75;
	local accboost = (50 * level) + 1;
	local evaboost = ((4 * level) + 2);
	local magicatk = (4 * level) + 1;
    local vitboost = (12 * level) + 1;

    mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,hpboost,0,3600)
	mob:addMod(dsp.mod.ATT,attboost);
	mob:addMod(dsp.mod.DEF,defboost);
	mob:addMod(dsp.mod.ACC,accboost);
	mob:addMod(dsp.mod.EVA,evaboost);
	mob:addMod(dsp.mod.MATT,magicatk);
    mob:addMod(dsp.mod.VIT,vitboost);
    mob:addHP(75000);
end

function trollStrength(mob)
    local level = GetServerVariable("[BESIEGED]Troll_LVL");
	local hpboost = (13 * level);
	local attboost = (5 * level) + 1;
	local defboost = (10 * level) + 75;
	local accboost = (50 * level) + 1;
	local evaboost = ((4 * level) + 2);
	local magicatk = (4 * level) + 1;
    local vitboost = (12 * level) + 1;

    mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,hpboost,0,3600)
	mob:addMod(dsp.mod.ATT,attboost);
	mob:addMod(dsp.mod.DEF,defboost);
	mob:addMod(dsp.mod.ACC,accboost);
	mob:addMod(dsp.mod.EVA,evaboost);
	mob:addMod(dsp.mod.MATT,magicatk);
    mob:addMod(dsp.mod.VIT,vitboost);
    mob:addHP(75000);
end

function undeadStrength(mob)
    local level = GetServerVariable("[BESIEGED]Undead_Swarm_LVL");
	local hpboost = (12 * level);
	local attboost = (5 * level) + 1;
	local defboost = (9 * level) + 75;
	local accboost = (20 * level) + 1;
	local evaboost = ((4 * level) + 2);
	local magicatk = (4 * level) + 1;
    local vitboost = (8 * level) + 1;

    mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,hpboost,0,3600)
	mob:addMod(dsp.mod.ATT,attboost);
	mob:addMod(dsp.mod.DEF,defboost);
	mob:addMod(dsp.mod.ACC,accboost);
	mob:addMod(dsp.mod.EVA,evaboost);
	mob:addMod(dsp.mod.MATT,magicatk);
    mob:addMod(dsp.mod.VIT,vitboost);
    mob:addHP(75000);
end

function generalStrength(mob)
    local level = GetServerVariable("[BESIEGED]Consecutive_Wins");
	if (level == nil) then
	    level = 1;
	elseif (level < 3) then
	    level = 1;
	elseif (level >= 3) then
	    level = math.floor((level / 3) + 1);
	end
    local id = mob:getID();
	printf("Level of strength of generals is %u",level);
    printf("General is %u",id);
	if (level >= 15) then
	    level = 15;
	end

	local hpboost = (8 * level);
	local strboost = (10 * level) + 5;
	local attboost = (10 * level) + 10;
	local defboost = (9 * level) + 100;
    local vitboost = (5 * level) + 20;
	local accboost = (8 * level) + 5;
	local evaboost = (8 * level) + 95;
	local regain = (level * 10) + 20;
	local magicatk = (4 * level) + 15;

	mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,hpboost,0,3600);
	mob:addMod(dsp.mod.ATT,attboost);
	mob:addMod(dsp.mod.DEF,defboost);
	mob:addMod(dsp.mod.ACC,accboost);
	mob:addMod(dsp.mod.EVA,evaboost);
    mob:addMod(dsp.mod.REGAIN,regain);
    mob:addMod(dsp.mod.VIT,vitboost);
    mob:addMod(dsp.mod.STR,strboost);
	mob:addMod(dsp.mod.MATT,magicatk);
    mob:addMod(dsp.mod.DEATHRES, 100)  -- Resist Death from Perdition
	mob:addMod(dsp.mod.AMNESIARES, 100)
    mob:addHP(65000);
end

function volunteerStrength(mob)
    local level = GetServerVariable("[BESIEGED]Consecutive_Wins");
	if (level == nil) then
	    level = 1;
	elseif (level < 3) then
	    level = 1;
	elseif (level >= 3) then
	    level = math.floor((level / 3) + 1);
	end

	if (level >= 10) then
	    level = 10;
	end

	local hpboost = (4 * level) + 20;
	local strboost = (3 * level) + 2;
	local attboost = (level) + 2;
	local defboost = (2 * level) - 160;
    -- local vitboost = (3 * level) + 5;
	local accboost = (level) + 5;
	local evaboost = (level) + 5;
	-- local regain = level + 1;
	-- local magicatk = (4 * level) + 2;

	mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,hpboost,0,3600);
	mob:addMod(dsp.mod.ATT,attboost);
	mob:addMod(dsp.mod.DEF,defboost);
	mob:addMod(dsp.mod.ACC,accboost);
	mob:addMod(dsp.mod.EVA,evaboost);
    -- mob:addMod(dsp.mod.REGAIN,regain);
    -- mob:addMod(dsp.mod.VIT,vitboost);
    mob:addMod(dsp.mod.STR,strboost);
	-- mob:addMod(dsp.mod.MATT,magicatk);
	mob:addMod(dsp.mod.DEATHRES, 100)  -- Resist Death from Perdition
	mob:addMod(dsp.mod.AMNESIARES, 100)
    mob:addHP(35000);
end



function helperStrength(mob)
    local level = GetServerVariable("[BESIEGED]Consecutive_Wins");
	if (level == nil) then
	    level = 1;
	elseif (level < 3) then
	    level = 1;
	elseif (level >= 3) then
	    level = math.floor((level / 3) + 1);
	end

	if (level >= 15) then
	    level = 15;
	end

	local hpboost = (4 * level) + 15;
	local strboost = (1.1 * level) + 8;
	local attboost = (1.2 * level) + 5;
	local defboost = (2 * level);
    -- local vitboost = (3 * level) + 5;
	local accboost = (2 * level) + 10;
	local evaboost = (2 * level) + 7;
	local regain = level + 1;
	local magicatk = (4 * level) + 2;

	mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,hpboost,0,3600);
	mob:addMod(dsp.mod.ATT,attboost);
	mob:addMod(dsp.mod.DEF,defboost);
	mob:addMod(dsp.mod.ACC,accboost);
	mob:addMod(dsp.mod.EVA,evaboost);
    mob:addMod(dsp.mod.REGAIN,regain);
    -- mob:addMod(dsp.mod.VIT,vitboost);
    mob:addMod(dsp.mod.STR,strboost);
	mob:addMod(dsp.mod.MATT,magicatk);
	mob:addMod(dsp.mod.DEATHRES, 100)  -- Resist Death from Perdition
	mob:addMod(dsp.mod.AMNESIARES, 100)
    mob:addHP(35000);
end

-- ------------------------------
--  Pathing Functions
-- ------------------------------


function enemyRoam(mob)
    local undead = mob:getID()
    local randPath = mob:getLocalVar("RandPath")
    local pathing = mob:getLocalVar("Path");
    local mobid = mob:getID()
    -- printf("Pathing is %u",pathing)
    if (mob:isFollowingPath() == false and pathing == 1) then
        mob:speed(40)
        -- printf("Not Following Path set speed and start pathing for %u",undead)

        printf("%u is following path %u",undead,randPath)
        mob:pathThrough(AL_ZAHBI.mobPath[randPath], 1)
        mob:setLocalVar("Path",0);
    elseif (mob:isFollowingPath() == false) then
        -- printf("<%u> has no Path",mobid)
        -- printf("No pathing found for: <%u>..Resetting",mobid)
        -- resumePath(mob)
    end
end

function resumePath(mob)
    local undead = mob:getID()
    local randPath = mob:getLocalVar("RandPath")
    local pathing = mob:getLocalVar("Path");
    local currentPoint = mob:getLocalVar("CurrentPathPoint")
    local pathRemain = {};
    local pathDone = mob:getLocalVar("PathDone");
    -- Store Path to new variable
    pathRemain = AL_ZAHBI.mobPath[randPath];
    currentPoint = currentPoint * 3;
    -- Remove Points already taken
    for i=1, currentPoint do
        table.remove(pathRemain, 1)
    end

    -- printf("Pathing is %u",pathing)
    if (pathDone ~= 1) then
        if (mob:isFollowingPath() == false) then
            mob:speed(30)
            -- printf("Not Following Path so Resuming path from last point %u",undead)

            -- printf("%u is following path %u",undead,randPath)
            mob:pathThrough(pathRemain, 1)
            mob:setLocalVar("Path",0);
        end
    end
end

function enemyPath(mob)
    local randPath = mob:getLocalVar("RandPath")
    local stop = 0;
    local posPoint = {}
    if (randPath == 1) then
        stop = 7;
        posPoint = {0,1,2,3,4,5,6,7};
    elseif (randPath == 2) then
        stop = 9;
        posPoint = {0,1,2,3,4,5,6,7,8,9};
    elseif (randPath == 3) then
        stop = 6;
        posPoint = {0,1,2,3,4,5,6};
    elseif (randPath == 4) then
        stop = 7;
        posPoint = {0,1,2,3,4,5,6,7};
    elseif (randPath == 5) then
        stop = 7;
        posPoint = {0,1,2,3,4,5,6,7};
    elseif (randPath == 6) then
        stop = 9;
        posPoint = {0,1,2,3,4,5,6,7,8,9};
    elseif (randPath == 7) then
        stop = 5;
        posPoint = {0,1,2,3,4,5};
    elseif (randPath == 8) then
        stop = 5;
        posPoint = {0,1,2,3,4,5};
    end
	-- printf("Mob is at stop point??")
    if (mob:isFollowingPath()) then
        if (mob:atPoint(dsp.path.get(AL_ZAHBI.mobPath[randPath],stop))) then
            mob:setLocalVar("PathDone",1);
            mob:clearPath();
            mob:setLocalVar("Path",0);


        else
            for i, v in ipairs(posPoint) do -- Set the Current Point of the Path so that the Mob can continue later on from this point
                local currentPoint = dsp.path.get(AL_ZAHBI.mobPath[randPath],v)
				local mobid = mob:getID()

                if (mob:atPoint(currentPoint)) then
				    printf("%u is at specific point",mobid)
                    mob:setLocalVar("CurrentPathPoint",v);
                end
            end

        end
    end
end

-- ------------------------------
--  Spawn/Despawn Functions
-- ------------------------------

function despawnNPCS()
    SetServerVariable("[BESIEGED]Fallen_Allies",0)
    for id = ID.besieged.NPCS[1].npc_start,ID.besieged.NPCS[1].npc_end do
        GetNPCByID(id):setStatus(dsp.status.DISAPPEAR);
    end

    for id = ID.besieged.NPCS[2].npc_start,ID.besieged.NPCS[2].npc_end do
        GetNPCByID(id):setStatus(dsp.status.DISAPPEAR);
    end
end

function spawnNPCS()
    for id = ID.besieged.NPCS[1].npc_start,ID.besieged.NPCS[1].npc_end do
        GetNPCByID(id):setStatus(dsp.status.NORMAL);
    end

    for id = ID.besieged.NPCS[2].npc_start,ID.besieged.NPCS[2].npc_end do
        GetNPCByID(id):setStatus(dsp.status.NORMAL);
    end
	SetServerVariable("[BESIEGED]General_Dead",0)
	SetServerVariable("[BESIEGED]Volunteer_Dead",0)
	SetServerVariable("[BESIEGED]Trooper_Dead",0)
	SetServerVariable("[BESIEGED]Guard_Dead",0)
	SetServerVariable("[BESIEGED]Freelance_Dead",0)
end

function spawnForces()
    for force = ID.besieged.BATTLE_NPCS.npc_start,ID.besieged.BATTLE_NPCS.npc_end do
        SpawnMob(force)
		printf("Spawning Forces...ID is: %u",force)
    end
end

function despawnForces()
    printf("[DEBUG] - Try to despawn all Forces including generals")
    for id = ID.besieged.BATTLE_NPCS.npc_start,ID.besieged.BATTLE_NPCS.npc_end do
        if (GetMobByID(id):isAlive()) then
		    DespawnMob(id)
			printf("Despawning NPC with ID of: %u",id)
		end
    end
end

function spawnMamool(mamoolLvl,zone)
    if (mamoolLvl == 0) then
        mamoolLvl = 1;
    end
    local stop = 0;
    if (mamoolLvl <= 4) then
        stop = 30
    elseif (mamoolLvl <= 8) then
        stop = 40
    end
    for i,v in pairs(ID.besieged.MAMOOL) do
        if (i < stop) then
            GetMobByID(v):setRespawnTime(70 + (i * 5))
        else
            GetMobByID(ID.besieged.MAMOOL_BOSS[mamoolLvl]):setRespawnTime(70 + (i * 5)) -- Spawn Boss for Level
            break
        end
    end
end

function spawnTroll(trollLvl,zone)
    if (trollLvl == 0) then
        trollLvl = 1;
    end
    local stop = 0;
    if (trollLvl <= 4) then
        stop = 30
    elseif (trollLvl <= 8) then
        stop = 40
    end
    for i,v in pairs(ID.besieged.TROLL) do
        if (i < stop) then
            GetMobByID(v):setRespawnTime(70 + (i * 5))
        else
            GetMobByID(ID.besieged.TROLL_BOSS[trollLvl]):setRespawnTime(70 + (i * 5)) -- Spawn Boss for Level
            break
        end
    end
end

function spawnUndead(undeadLvl,zone)
    if (undeadLvl == 0) then
        undeadLvl = 1;
    end
    local stop = 0;
    if (undeadLvl <= 4) then
        stop = 30
    elseif (undeadLvl <= 8) then
        stop = 40
    end
    for i,v in pairs(ID.besieged.UNDEAD) do
    -- GetMobByID(v):setSpawn(-333,-20,231,180)
        if (i < stop) then
            GetMobByID(v):setRespawnTime(70 + (i * 5))
        else
            GetMobByID(ID.besieged.UNDEAD_BOSS[undeadLvl]):setRespawnTime(70 + (i * 5)) -- Spawn Boss for Level
            break
        end
    end
end

-- ------------------------------
--  Aggro Functions
-- ------------------------------

function npcAggroMob(mob)
   local randomfight = math.random(1,10)
   for i,v in pairs(ID.besieged.UNDEAD) do
        if (mob:checkDistance(GetMobByID(v)) < 22) then
			if ((GetMobAction(v) == 1) and (randomfight < 8)) then
	            mob:addEnmity(GetMobByID(v),0,1);
				break;
	        elseif (GetMobAction(v) ~= 1 and GetMobByID(v):isAlive()) then
	            mob:addEnmity(GetMobByID(v),0,1);
				break;
	        end
        end
    end
end

function mobAggroNpc(mob)
    local randomfight = math.random(1,100)
    for id = ID.besieged.BATTLE_NPCS.npc_start,ID.besieged.BATTLE_NPCS.npc_end do
        if (mob:checkDistance(GetMobByID(id)) < 10) then  -- Mob Agro WIDE!
           -- printf("Aggro Check")
            if (randomfight < 10) then
	           if ((GetMobAction(id) == 1) and (randomfight < 20)) then
	                mob:addEnmity(GetMobByID(id),0,1);
				    break;
	            elseif (GetMobAction(id) ~= 1 and GetMobByID(id):isAlive()) then
	                mob:addEnmity(GetMobByID(id),0,1);
				    break;
	            end
            end
        end
    end
end

-- ------------------------------
--  Death Counter to end battle
-- ------------------------------
function mamoolDeathCount(mob)
    local players = mob:getZone():getPlayers();
    local kills = GetServerVariable("[BESIEGED]Fallen_Enemies")
    local level = GetServerVariable("[BESIEGED]Mamool_LVL");
    local modifier = math.floor((level / 4) + 2);
    local killsNeeded = 8 + (4 * modifier);
    local stop = 0;
    if (level <= 4) then
        stop = 30
    elseif (level <= 8) then
        stop = 40
    end

    if (kills < killsNeeded) then
        kills = kills + 1;
        printf("Al Zahbi forces have defeated: %u mobs",kills)
        SetServerVariable("[BESIEGED]Fallen_Enemies",kills)
    elseif (kills == killsNeeded) then
        SetServerVariable("[BESIEGED]Mamool_End",1)
        printf("[DEBUG] - The Mamool have retreated")
        SetServerVariable("[BESIEGED]Mamool_Status",11);
        -- Lets Cap Levels
        if (level < HORDE_CAP) then
            SetServerVariable("[BESIEGED]Mamool_LVL",level + 1);
        end
        for i,v in pairs(ID.besieged.MAMOOL) do
        -- GetMobByID(v):setSpawn(-333,-20,231,180)
            if (i < stop) then
                DespawnMob(v);
            else
                DespawnMob(ID.besieged.MAMOOL_BOSS[level]) -- Spawn Boss for Level
                break
            end
        end
        -- Depsawn Helpers
        despawnForces()
        -- Spawn Regular Zone NPCS
        spawnNPCS()
        SetServerVariable("[BESIEGED]Fallen_Enemies",0)
        for i, player in pairs(players) do
            local ending = math.random(1,20)
	        player:messageSpecial(ID.text.MAMOOL_LOSE);
            if not player:isInMogHouse() then
                player:ChangeMusic(1, 178);
			    player:ChangeMusic(2, 178);
                player:startEvent(6,ending)
                calculatePoints(player)
                player:delStatusEffect(dsp.effect.BESIEGED)
            end
	    end
    end
end

function trollDeathCount(mob)
    local players = mob:getZone():getPlayers();
    local kills = GetServerVariable("[BESIEGED]Fallen_Enemies")
    local level = GetServerVariable("[BESIEGED]Troll_LVL");
    local modifier = math.floor((level / 4) + 2);
    local killsNeeded = 8 + (4 * modifier);
    local stop = 0;
    if (level <= 4) then
        stop = 30
    elseif (level <= 8) then
        stop = 40
    end

    if (kills < killsNeeded) then
        kills = kills + 1;
        printf("Al Zahbi forces have defeated: %u mobs",kills)
        SetServerVariable("[BESIEGED]Fallen_Enemies",kills)
    elseif (kills == killsNeeded) then
        SetServerVariable("[BESIEGED]Troll_End",1)
        printf("[DEBUG] - The Troll have retreated")
        SetServerVariable("[BESIEGED]Troll_Status",11);
        -- Lets Cap Levels
        if (level < HORDE_CAP) then
            SetServerVariable("[BESIEGED]Troll_LVL",level + 1);
        end
        for i,v in pairs(ID.besieged.TROLL) do
        -- GetMobByID(v):setSpawn(-333,-20,231,180)
            if (i < stop) then
                DespawnMob(v);
            else
                DespawnMob(ID.besieged.TROLL_BOSS[level]) -- Spawn Boss for Level
                break
            end
        end
        -- Depsawn Helpers
        despawnForces()
        -- Spawn Regular Zone NPCS
        spawnNPCS()
        SetServerVariable("[BESIEGED]Fallen_Enemies",0)
        for i, player in pairs(players) do
            player:messageSpecial(ID.text.TROLL_LOSE);
            if not player:isInMogHouse() then
                player:ChangeMusic(1, 178);
			    player:ChangeMusic(2, 178);
                player:startEvent(6)
                calculatePoints(player)
                player:delStatusEffect(dsp.effect.BESIEGED)
            end
	    end
    end
end

function undeadDeathCount(mob)
    local players = mob:getZone():getPlayers();
    local kills = GetServerVariable("[BESIEGED]Fallen_Enemies")
    local level = GetServerVariable("[BESIEGED]Undead_Swarm_LVL");
	local wins = GetServerVariable("[BESIEGED]Consecutive_Wins");
    local modifier = math.floor((level / 4) + 2);
    local killsNeeded = 8 + (4 * modifier);
    local stop = 0;
    if (level <= 4) then
        stop = 30
    elseif (level <= 8) then
        stop = 40
    end

    if (kills < killsNeeded) then
        kills = kills + 1;
        printf("Al Zahbi forces have defeated: %u mobs",kills)
        SetServerVariable("[BESIEGED]Fallen_Enemies",kills)
    elseif (kills == killsNeeded) then
        -- Depsawn Helpers
        despawnForces()
        -- Spawn Regular Zone NPCS
        spawnNPCS()
        SetServerVariable("[BESIEGED]Undead_Swarm_End",1)
        printf("[DEBUG] - The Undead have retreated")
        SetServerVariable("[BESIEGED]Undead_Swarm_Status",11);
        -- Lets Cap Levels
        if (level < HORDE_CAP) then
            SetServerVariable("[BESIEGED]Undead_Swarm_LVL",level + 1);
        end

		SetServerVariable("[BESIEGED]Consecutive_Wins", wins + 1);
        for i,v in pairs(ID.besieged.UNDEAD) do
        -- GetMobByID(v):setSpawn(-333,-20,231,180)
            if (i < stop) then
                if (GetMobByID(v):isAlive()) then
                    printf("[%u] - Despawning Mob with an ID of: %u",i,v)
                    DespawnMob(v)
                end
            else
                despawnUndeadBoss()
                break
            end
        end

        SetServerVariable("[BESIEGED]Fallen_Enemies",0)
        for i, player in pairs(players) do
	        player:messageSpecial(ID.text.UNDEAD_LOSE);
            if not player:isInMogHouse() then
                player:ChangeMusic(1, 178);
			    player:ChangeMusic(2, 178);
                player:startEvent(6)
                calculatePoints(player)
                player:delStatusEffect(dsp.effect.BESIEGED)
            end
	    end
    end
end

function npcDeathCount(mob)
    -- Need to make
    local players = mob:getZone():getPlayers();
    local death = GetServerVariable("[BESIEGED]Fallen_Allies")
    local undead = GetServerVariable("[BESIEGED]Undead_Swarm_Status");
    local level = GetServerVariable("[BESIEGED]Undead_Swarm_LVL");

    local stop = 0;
    if (level <= 4) then
        stop = 30
    elseif (level <= 8) then
        stop = 40
    end

    death = death + 1;
    printf("==== Fallen Allies is now %u ====",death)
    SetServerVariable("[BESIEGED]Fallen_Allies",death)
    if (death >= 16) then
	    -- Depsawn Helpers
        despawnForces()
        -- Spawn Regular Zone NPCS
        spawnNPCS()
        if (undead == 3) then
            printf("==== The Undead Swarm Has Won ====",death)
            for i,v in pairs(ID.besieged.UNDEAD) do
                if (i < stop) then
                    if (GetMobByID(v):isAlive()) then
			            printf("Despawning Mob ID: %u",v)
                        DespawnMob(v);
					    print(i)
				    end
                else
				    despawnUndeadBoss()
                    break
                end
            end

            for i, player in pairs(players) do
	            player:messageSpecial(ID.text.UNDEAD_WIN);
				player:delStatusEffect(dsp.effect.BESIEGED)
	        end

            SetServerVariable("[BESIEGED]Undead_Swarm_LVL",1);
            SetServerVariable("[BESIEGED]Undead_Swarm_End",1)
            SetServerVariable("[BESIEGED]Undead_Swarm_Status",11);
        end

        SetServerVariable("[BESIEGED]Fallen_Allies",0)
        SetServerVariable("[BESIEGED]Consecutive_Wins",0);

    end
end

function despawnUndeadBoss()

    for i,v in pairs(ID.besieged.UNDEAD_BOSS) do
	    if (i < 9) then
		    if (GetMobByID(v):isAlive()) then
			    DespawnMob(v)
			    printf("Despawning Mob boss %u", v)
			end
	    end
    end

end






