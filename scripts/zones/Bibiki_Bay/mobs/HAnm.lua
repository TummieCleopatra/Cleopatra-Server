-----------------------------------
-- Area: Bibiki Bay
--  MOB: Naraka
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
   mob:setLocalVar("Trigger",1);
   local blank = GetNPCByID(16793928);
   blank:setStatus(dsp.status.DISAPPEAR);
   mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;







-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)

local hp = mob:getHPP();
local trigger = mob:getLocalVar("Trigger");
local rnd = 0;



if (hp <= 75 and trigger == 1) then
    randtwohour = math.random(1,7);
	if (randtwohour == 1) then
	    mob:useMobAbility(432);
		mob:setLocalVar("Trigger",2);
	elseif (randtwohour == 2) then
	    mob:useMobAbility(437);  -- Perfect Dodge
		mob:setLocalVar("Trigger",2);
	elseif (randtwohour == 3) then
	    mob:useMobAbility(436);  -- Chainspell
		mob:setLocalVar("Trigger",2);
	elseif (randtwohour == 4) then
	    mob:useMobAbility(438);  -- Invincible
		mob:setLocalVar("Trigger",2);
	elseif (randtwohour == 5) then
	    mob:useMobAbility(439);  -- Bloodweapon
		mob:setLocalVar("Trigger",2);
	elseif (randtwohour == 56) then
	    mob:useMobAbility(764);  -- Meikyo Shisui
		mob:setLocalVar("Trigger",2);
    end
elseif (hp <= 50 and trigger == 2) then
    randtwohour = math.random(1,7);
	if (randtwohour == 1) then
	    mob:useMobAbility(432);
		mob:setLocalVar("Trigger",3);
	elseif (randtwohour == 2) then
	    mob:useMobAbility(437);  -- Perfect Dodge
		mob:setLocalVar("Trigger",3);
	elseif (randtwohour == 3) then
	    mob:useMobAbility(436);  -- Chainspell
		mob:setLocalVar("Trigger",3);
	elseif (randtwohour == 4) then
	    mob:useMobAbility(438);  -- Invincible
		mob:setLocalVar("Trigger",3);
	elseif (randtwohour == 5) then
	    mob:useMobAbility(439);  -- Bloodweapon
		mob:setLocalVar("Trigger",3);
	elseif (randtwohour == 56) then
	    mob:useMobAbility(764);  -- Meikyo Shisui
		mob:setLocalVar("Trigger",3);
    end
elseif (hp <= 25 and trigger == 3) then
    randtwohour = math.random(1,7);
	if (randtwohour == 1) then
	    mob:useMobAbility(432);
		mob:setLocalVar("Trigger",4);
	elseif (randtwohour == 2) then
	    mob:useMobAbility(437);  -- Perfect Dodge
		mob:setLocalVar("Trigger",4);
	elseif (randtwohour == 3) then
	    mob:useMobAbility(436);  -- Chainspell
		mob:setLocalVar("Trigger",4);
	elseif (randtwohour == 4) then
	    mob:useMobAbility(438);  -- Invincible
		mob:setLocalVar("Trigger",4);
	elseif (randtwohour == 5) then
	    mob:useMobAbility(439);  -- Bloodweapon
		mob:setLocalVar("Trigger",4);
	elseif (randtwohour == 56) then
	    mob:useMobAbility(764);  -- Meikyo Shisui
		mob:setLocalVar("Trigger",4);
    end
end



end;


-----------------------------------


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)







    if (player:getVar("WARHAFight") == 1) then
	    player:setVar("WARHAFight",2);
	end

    if (player:getVar("MNKHAFight") == 1) then
	    player:setVar("MNKHAFight",2);
	end

    if (player:getVar("WHMHAFight") == 1) then
	    player:setVar("WHMHAFight",2);
	end

    if (player:getVar("BLMHAFight") == 1) then
	    player:setVar("BLMHAFight",2);
	end

    if (player:getVar("RDMHAFight") == 1) then
	    player:setVar("RDMHAFight",2);
	end

    if (player:getVar("THFHAFight") == 1) then
	    player:setVar("THFHAFight",2);
	end

    if (player:getVar("PLDHAFight") == 1) then
	    player:setVar("PLDHAFight",2);
	end

    if (player:getVar("PLDHAFightShield") == 1) then
	    player:setVar("PLDHAFightShield",2);
	end

    if (player:getVar("DRKHAFight") == 1) then
	    player:setVar("DRKHAFight",2);
	end

    if (player:getVar("BSTHAFight") == 1) then
	    player:setVar("BSTHAFight",2);
	end

    if (player:getVar("BRDHAFight") == 1) then
	    player:setVar("BRDHAFight",2);
	end

    if (player:getVar("RNGHAFight") == 1) then
	    player:setVar("RNGHAFight",2);
	end

    if (player:getVar("SAMHAFight") == 1) then
	    player:setVar("SAMHAFight",2);
	end

    if (player:getVar("NINHAFight") == 1) then
	    player:setVar("NINHAFight",2);
	end

    if (player:getVar("DRGHAFight") == 1) then
	    player:setVar("DRGHAFight",2);
	end

    if (player:getVar("SMNHAFight") == 1) then
	    player:setVar("SMNHAFight",2);
	end

    if (player:getVar("BLUHAFight") == 1) then
	    player:setVar("BLUHAFight",2);
	end

    if (player:getVar("CORHAFight") == 1) then
	    player:setVar("CORHAFight",2);
	end

    if (player:getVar("PUPHAFight") == 1) then
	    player:setVar("PUPHAFight",2);
	end

    if (player:getVar("DNCHAFight") == 1) then
	    player:setVar("DNCHAFight",2);
	end

    if (player:getVar("SCHHAFight") == 1) then
	    player:setVar("SCHHAFight",2);
	end
	player:PrintToPlayer("There is something sparkling in the sand!", 0xD);

end;


function onMobDespawn(mob)
   local blank = GetNPCByID(16793928);
   blank:setStatus(dsp.status.NORMAL);
end;

