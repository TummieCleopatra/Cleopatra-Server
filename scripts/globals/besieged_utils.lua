local ID = require("scripts/zones/Al_Zahbi/IDs")
-- require("scripts/zones/Al_Zahbi/globals");
require("scripts/globals/mobs")
require("scripts/globals/pathfind");
require("scripts/globals/status");
require("scripts/globals/besieged_points");

-- Move NPC ID's to a different file...maybe here??
function besiegedCheck(zone)
    local players = zone:getPlayers();
    -- Check the status of besieged Army's
    local mamool = GetServerVariable("[BESIEGED]Mamool_Status");
    local mamoolStart = GetServerVariable("[BESIEGED]Mamool_Start");
    local mamoolEnd = GetServerVariable("[BESIEGED]Mamool_End");
    local mamoolLvl = GetServerVariable("[BESIEGED]Mamool_LVL");

    local troll = GetServerVariable("[BESIEGED]Troll_Status");
    local trollStart = GetServerVariable("[BESIEGED]Troll_Start");
    local trollEnd = GetServerVariable("[BESIEGED]Troll_End");
    local trollLvl = GetServerVariable("[BESIEGED]Troll_LVL");

    local undead = GetServerVariable("[BESIEGED]Undead_Swarm_Status");
    local undeadStart = GetServerVariable("[BESIEGED]Undead_Swarm_Start");
    local undeadEnd = GetServerVariable("[BESIEGED]Undead_Swarm_End");
    local undeadLvl = GetServerVariable("[BESIEGED]Undead_Swarm_LVL");

    local wins = GetServerVariable("[BESIEGED]Consecutive_Wins");
    local currentTime = os.time();
    local stop = 0;

    -- March Check --
    if (mamool == 1) then
        if (players ~= nil) then
	        for i, player in pairs(players) do
	            player:messageSpecial(ID.text.MAMOOL_MARCH);
	        end
        end
        SetServerVariable("[BESIEGED]Mamool_Status",10);
    elseif (troll == 1) then
        if (players ~= nil) then
	        for i, player in pairs(players) do
	            player:messageSpecial(ID.text.TROLL_MARCH);
	        end
        end
        SetServerVariable("[BESIEGED]Troll_Status",10);
    elseif (undead == 1) then
        if (players ~= nil) then
	        for i, player in pairs(players) do
	            player:messageSpecial(ID.text.UNDEAD_MARCH);
	        end
        end
        SetServerVariable("[BESIEGED]Undead_Swarm_Status",10);
    end

    -- Start Besieged
    -- Mamool Check
    -- if (mamool == 2) then  -- Mamool always goes first if there is a tie



    -- elseif (troll == 2 and mamool >= 10 and undead >= 10) then




    -- elseif (undead == 2 and troll >= 10 and mamool >= 10) then
    if (undead == 2) then
        -- SetServerVariable("[BESIEGED]Undead_Swarm_Start",0);
        SetServerVariable("[BESIEGED]Undead_Swarm_End",os.time() + 1800 + (60 * (3 * undeadLvl)));
        SetServerVariable("[BESIEGED]Undead_Swarm_Status",3);
        -- do cs here
        -- set spawns
        despawnNPCS()
        spawnForces()
        spawnUndead(undeadLvl,zone)
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

            for i, player in pairs(players) do
                local ending = math.random(1,20)
	            player:messageSpecial(ID.text.MAMOOL_LOSE);
                player:ChangeMusic(1, 178);
			    player:ChangeMusic(2, 178);
                player:startEvent(6,ending)
                calculatePoints(player)
                player:delStatusEffect(dsp.effect.BESIEGED)
	        end
                printf("[DEBUG] - The Undead have retreated")
                SetServerVariable("[BESIEGED]Mamool_Status",11);
                SetServerVariable("[BESIEGED]Mamool_LVL",mamoolLvl + 1);
                SetServerVariable("[BESIEGED]Consecutive_Wins", wins + 1);
            for i,v in pairs(ID.besieged.MAMOOL) do
            -- GetMobByID(v):setSpawn(-333,-20,231,180)
                if (i < stop) then
                    DespawnMob(v);
                else
                    DespawnMob(ID.besieged.MAMOOL_BOSS[mamoolLvl]) -- Spawn Boss for Level
                    break
                end
            end
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
                SetServerVariable("[BESIEGED]Troll_LVL",trollLvl + 1);
                SetServerVariable("[BESIEGED]Consecutive_Wins", wins + 1);
            for i,v in pairs(ID.besieged.TROLL) do
            -- GetMobByID(v):setSpawn(-333,-20,231,180)
                if (i < stop) then
                    DespawnMob(v);
                else
                    DespawnMob(ID.besieged.TROLL_BOSS[trollLvl]) -- Spawn Boss for Level
                    break
                end
            end
        end
    end

    if (undeadEnd > 1) then
        if (os.time() > undeadEnd) then
            SetServerVariable("[BESIEGED]Undead_Swarm_End",1)
            if (undeadLvl <= 3) then
            stop = 20
            elseif (undeadLvl <= 7) then
                stop = 30
            else
                stop = 40
            end

            for i, player in pairs(players) do
                local ending = math.random(1,20)
	            player:messageSpecial(ID.text.UNDEAD_LOSE);
                player:ChangeMusic(1, 178);
			    player:ChangeMusic(2, 178);
                player:startEvent(6,ending)
                calculatePoints(player)
                player:delStatusEffect(dsp.effect.BESIEGED)
	        end
                printf("[DEBUG] - The Undead have retreated")
                SetServerVariable("[BESIEGED]Undead_Swarm_Status",11);
                SetServerVariable("[BESIEGED]Undead_Swarm_LVL",undeadLvl + 1);
                SetServerVariable("[BESIEGED]Consecutive_Wins", wins + 1);
            for i,v in pairs(ID.besieged.UNDEAD) do
            -- GetMobByID(v):setSpawn(-333,-20,231,180)
                if (i < stop) then
                    DespawnMob(v);
                else
                    DespawnMob(ID.besieged.UNDEAD_BOSS[undeadLvl]) -- Spawn Boss for Level
                    break
                end
            end
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

	local hpboost = (10 * level);
	local strboost = (20 * level) + 5;
	local attboost = (20 * level) + 10;
	local defboost = (35 * level) + 350;
    local vitboost = (5 * level) + 20;
	local accboost = (20 * level) + 5;
	local evaboost = (35 * level) + 95;
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
    mob:addHP(65000);
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

	local hpboost = (5 * level) + 15;
	local strboost = (10 * level) + 2;
	local attboost = (20 * level) + 2;
	local defboost = (30 * level) + 150;
    -- local vitboost = (3 * level) + 5;
	local accboost = (20 * level) + 10;
	local evaboost = (20 * level) + 30;
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
    mob:addHP(35000);
end

-- ------------------------------
--  Pathing Functions
-- ------------------------------


function enemyRoam(mob)
    local undead = mob:getID()
    local randPath = mob:getLocalVar("RandPath")
    local pathing = mob:getLocalVar("Path");
    -- printf("Pathing is %u",pathing)
    if (mob:isFollowingPath() == false and pathing == 1) then
        mob:speed(40)
        -- printf("Not Following Path set speed and start pathing for %u",undead)

        printf("%u is following path %u",undead,randPath)
        mob:pathThrough(AL_ZAHBI.mobPath[randPath], 1)
        mob:setLocalVar("Path",0);
    else
        -- printf("No pathing found???")
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
            printf("Not Following Path so Resuming path from last point %u",undead)

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
    if (mob:isFollowingPath()) then
        if (mob:atPoint(dsp.path.get(AL_ZAHBI.mobPath[randPath],stop))) then
            mob:setLocalVar("PathDone",1);
            mob:clearPath();
            mob:setLocalVar("Path",0);

        else
            for i, v in ipairs(posPoint) do -- Set the Current Point of the Path so that the Mob can continue later on from this point
                local currentPoint = dsp.path.get(AL_ZAHBI.mobPath[randPath],v)
                if (mob:atPoint(currentPoint)) then
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
    for id = ID.besieged.NPCS[1].npc_start,ID.besieged.NPCS[1].npc_end do
        GetNPCByID(id):setStatus(dsp.status.DISAPPEAR);
    end
end

function spawnNPCS()
    for id = ID.besieged.NPCS[1].npc_start,ID.besieged.NPCS[1].npc_end do
        GetNPCByID(id):setStatus(dsp.status.NORMAL);
    end
end

function spawnForces()
    for id = ID.besieged.BATTLE_NPCS.npc_start,ID.besieged.BATTLE_NPCS.npc_end do
        SpawnMob(id)
    end
end

function despawnForces()
    for id = ID.besieged.BATTLE_NPCS.npc_start,ID.besieged.BATTLE_NPCS.npc_end do
        DespawnMob(id)
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
        SetServerVariable("[BESIEGED]Mamool_LVL",level + 1);
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
            player:ChangeMusic(1, 178);
			player:ChangeMusic(2, 178);
            player:startEvent(6,ending)
            calculatePoints(player)
            player:delStatusEffect(dsp.effect.BESIEGED)
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
        SetServerVariable("[BESIEGED]Troll_LVL",level + 1);
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
            player:ChangeMusic(1, 178);
			player:ChangeMusic(2, 178);
            player:startEvent(6)
            calculatePoints(player)
            player:delStatusEffect(dsp.effect.BESIEGED)
	    end
    end
end

function undeadDeathCount(mob)
    local players = mob:getZone():getPlayers();
    local kills = GetServerVariable("[BESIEGED]Fallen_Enemies")
    local level = GetServerVariable("[BESIEGED]Undead_Swarm_LVL");
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
        SetServerVariable("[BESIEGED]Undead_Swarm_End",1)
        printf("[DEBUG] - The Undead have retreated")
        SetServerVariable("[BESIEGED]Undead_Swarm_Status",11);
        SetServerVariable("[BESIEGED]Undead_Swarm_LVL",level + 1);
        for i,v in pairs(ID.besieged.UNDEAD) do
        -- GetMobByID(v):setSpawn(-333,-20,231,180)
            if (i < stop) then
                DespawnMob(v);
            else
                DespawnMob(ID.besieged.UNDEAD_BOSS[level]) -- Spawn Boss for Level
                break
            end
        end
        -- Depsawn Helpers
        despawnForces()
        -- Spawn Regular Zone NPCS
        spawnNPCS()
        SetServerVariable("[BESIEGED]Fallen_Enemies",0)
        for i, player in pairs(players) do
	        player:messageSpecial(ID.text.UNDEAD_LOSE);
            player:ChangeMusic(1, 178);
			player:ChangeMusic(2, 178);
            player:startEvent(6)
            calculatePoints(player)
            player:delStatusEffect(dsp.effect.BESIEGED)
	    end
    end
end

function npcDeathCount(mob)
    local players = mob:getZone():getPlayers();
    local death = GetServerVariable("[BESIEGED]Fallen_Allies")
    local undead = GetServerVariable("[BESIEGED]Undead_Swarm_Status");
    death = death + 1;
    printf("==== Fallen Allies is now %u ====",death)
    SetServerVariable("[BESIEGED]Fallen_Allies",death)
    if (death >= 20) then
        if (undead == 3) then
            for i, player in pairs(players) do
	            player:messageSpecial(ID.text.UNDEAD_WIN);
	        end
        end
        SetServerVariable("[BESIEGED]Fallen_Allies",0)
        -- Despawn All mobs
        -- Despawn all NPCS
        -- Respawn NPCs
    end
end






