---------------------------------------------
--  Reinforcements
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/salvagescaler");

---------------------------------------------
function onMobSkillCheck(target,mob,skill)

        return 1;
    
end;

function onMobWeaponSkill(target, mob, skill)
    local spawnNumber = 0;
    local spawnx = mob:getXPos();
    local spawny = mob:getYPos();
    local spawnz = mob:getZPos();	
	local spawn = mob:getLocalVar("SpawnID");
	local spawnstart = mob:getLocalVar("SpawnID");
	local nmspawn = mob:getLocalVar("NmID");
	local rand = math.random(1,100);
	local NMspawn = mob:getLocalVar("NMspawn");
	
	if (mob:getZoneID() == 73) then -- Zhayolm Ramparts don't multispawn just spawn once
	    spawnNumber = 1;
	

	if ((spawn - spawnstart) < spawnNumber) then
        if (rand < 5 and NMspawn == 1) then
            GetMobByID(nmspawn):setSpawn(spawnx+1,spawny,spawnz);
	        SpawnMob(nmspawn):updateEnmity(target);
		    mob:setLocalVar("NMspawn",0);
		else		
	        GetMobByID(spawn):setSpawn(spawnx+1,spawny,spawnz);
	        SpawnMob(spawn):updateEnmity(target);
	        spawn = spawn + 1;
	        mob:setLocalVar("SpawnID", spawn);
			printf("Spawn is: %s",spawn);
		end
	end

    end	
	
	if (mob:getZoneID() == 75) then
		local mobone = mob:getLocalVar("Mob1");
	    local mobtwo = mob:getLocalVar("Mob2");
	    local mobthree = mob:getLocalVar("Mob3");
	    local mobfour = mob:getLocalVar("Mob4");
	    local mobfive = mob:getLocalVar("Mob5");
		local spawnm = mob:getLocalVar("RampNM");
		local mob1 = GetMobByID(mobone);
	    local mob2 = GetMobByID(mobtwo);
	    local mob3 = GetMobByID(mobthree);
	    local mob4 = GetMobByID(mobfour);
	    local mob5 = GetMobByID(mobfive);
		local spawn = 0;
		if (GetMobAction(mobone) == 0) then
		    spawn = mobone;
			printf("MOB1");
		elseif (GetMobAction(mobtwo) == 0) then
		    spawn = mobtwo;
			printf("MOB2");
		elseif (GetMobAction(mobthree) == 0) then
		    spawn = mobthree;
		elseif (GetMobAction(mobfour) == 0) then
		    spawn = mobfour;		
		elseif (GetMobAction(mobfive) == 0) then
		    spawn = mobfive;
		end
        printf("Chance to spawn NM: %s",rand);
        if (rand < 10 and NMspawn == 1) then
            GetMobByID(spawnm):setSpawn(spawnx+1,spawny,spawnz);
	        SpawnMob(spawnm):updateEnmity(target);
		    mob:setLocalVar("NMspawn",0);
		else		
	        GetMobByID(spawn):setSpawn(spawnx+1,spawny,spawnz);
	        SpawnMob(spawn):updateEnmity(target);
			printf("Spawn is: %s",spawn);
		end		
	
	end
	
	
	
	
	
	
	return 0;

end;
