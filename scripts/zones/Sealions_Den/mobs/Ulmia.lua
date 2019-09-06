-----------------------------------
-- Area: Sealion den
-- NPC:  Ulmia
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)

    mob:addStatusEffect(dsp.effect.BIND, 1, 0, 1800);
	mob:untargetable(true);
	-- mob:hideName(true);
    mob:setLocalVar("TwoHour", 1); -- initialize 2 hr
    local hp = math.random(30,45)
    mob:setLocalVar("TwoHourHP", hp); 	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:setLocalVar("Buff1",5); -- use the first buff after 10 seconds of battle
    mob:setLocalVar("Buff2",10); -- use the second buff after 20 seconds of battle	
end;

function onMobFight(mob,target)

local battletime = mob:getBattleTime();
local buffone = mob:getLocalVar("Buff1");
local bufftwo = mob:getLocalVar("Buff2");
local prishehp = GetMobByID(16908475):getHPP();
local twohour = mob:getLocalVar("TwoHour");
local hp = mob:getLocalVar("TwoHourHP");
-- print(buffone);
-- print(battletime);
if (prishehp > 75) then
    if (battletime > buffone) then
	    mob:castSpell(420);  -- Victory March
		printf("Try to Cast Victory march");
		buffone = battletime + 130;
		mob:setLocalVar("Buff1",buffone);
    elseif (battletime > bufftwo) then
	    mob:castSpell(419);  -- Advancing March
		bufftwo = battletime + 130;
		mob:setLocalVar("Buff2",bufftwo);
    end	
elseif (prishehp > 50) then
    if (battletime > buffone) then
	printf("Try to Cast Victory march");
	    mob:castSpell(420);  -- Victory March
		buffone = battletime + 130;
		mob:setLocalVar("Buff1",buffone);		
    elseif (battletime > bufftwo) then
	    mob:castSpell(397);  -- Valor Minuet IV
		bufftwo = battletime + 130;
		mob:setLocalVar("Buff2",bufftwo);		
    end		
else	
    if (battletime > buffone) then
	printf("Try to Cast Victory march");
	    mob:castSpell(397);  -- Valor Minuet IV
		buffone = battletime + 130;
		mob:setLocalVar("Buff1",buffone);		
    elseif (battletime > bufftwo) then
	    mob:castSpell(396);  -- Valor Minuet III
		bufftwo = battletime + 130;
		mob:setLocalVar("Buff2",bufftwo);		
    end	
	
  if (prishehp <= hp and twohour == 1) then
      mob:useMobAbility(762);
	  mob:setLocalVar("TwoHour", 0);
  end
	  
end	

end;

function onSpellPrecast(mob, spell)

end;

function onMonsterMagicPrepare(caster, target)
   rnd = math.random(1,100);
	
    if (rnd < 20) then
       return 376;  -- Horde Lullabye
    elseif (rnd < 79) then
       return 373;  -- Foe Requiem IV
    elseif (rnd <= 100) then
	   return 423;  -- Masacre Elegy
	end	

end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player,isKiller)
end;