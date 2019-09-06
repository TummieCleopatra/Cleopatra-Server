-----------------------------------
-- Area: Sealion den
-- NPC:  Prishe
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
  mob:setLocalVar("TwoHour", 0); -- initialize 2 hr
  local hp = math.random(30,45)
  mob:setLocalVar("TwoHourHP", hp); 

  -- randomize two hour she will use either hundred fists or benediction
  local rnd = math.random(1,10);
  if (rnd <= 5) then
  mob:setLocalVar("TwoHour",1); -- Hundred Fists
  else
  mob:setLocalVar("TwoHour",2); -- Benediction
  end

end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
switch (mob:getID()) : caseof {
[16908475] = function (x)
	GetMobByID(16908476):updateEnmity(target);
	end,
    }
end;

function onMobFight(mob,target)

    local twohour = mob:getLocalVar("TwoHour");
    local hp = mob:getLocalVar("TwoHourHP");
    GetMobByID(16908476):updateEnmity(target);
    if (mob:getHPP() < hp and twohour ~= nil) then
        if (twohour == 1) then
	    mob:useMobAbility(753);
		elseif (twohour == 2) then
	    mob:useMobAbility(754);
        end
        mob:setLocalVar("TwoHour", 0);
    end
	
	local mobtp = mob:getTP();
	-- print(mobtp);
	


end;



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player,isKiller)
    DespawnMob(16908476);

end;