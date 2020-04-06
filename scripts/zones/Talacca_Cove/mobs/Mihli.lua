-----------------------------------
-- Area: Talacca Cove
-- MOB: Mihli
-----------------------------------

package.loaded["scripts/zones/Talacca_Cove/IDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Talacca_Cove/IDs");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;


function onMobSpawn(mob)
    mob:setLocalVar("CureBuff",1);
	mob:setLocalVar("HasteBuff",1);
	mob:setLocalVar("FCBuff",1);
	mob:setLocalVar("Bene",1);
    mob:setLocalVar("SpellCast",0)
end


-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local spellCooldown = 20
	local curepot = mob:getLocalVar("CureBuff");
	local haste = mob:getLocalVar("HasteBuff");
	local fc = mob:getLocalVar("FCBuff");

	local bene = mob:getLocalVar("Bene");
	local twohr = math.random(30,60);
	local hp = mob:getHPP();



    local randtp = math.random(200,600);
    if (mob:getTP() > 1000 + randtp) then
        mob:useMobAbility(2138);
        mob:setTP(0)
    end



	if (acc == 1 and hp < 75) then
		mob:addMod(dsp.mod.CURE_POTENCY,25);
	    mob:setLocalVar("CureBuff",2);
	elseif (haste == 1 and hp < 50) then
	    mob:addMod(dsp.mod.HASTE_MAGIC,1500);
	    mob:setLocalVar("HasteBuff",2);
		mob:addStatusEffect(dsp.effect.ENWATER, 10, 0, 1500);
	elseif (counter == 1 and hp < 25) then
	    mob:addMod(dsp.mod.FASTCAST,40);
	    mob:setLocalVar("CounterBuff",2);
    end

    if (hp < twohr and bene == 1) then
        mob:useMobAbility(689);
        mob:setLocalVar("Bene",0);
    end

    local battletime = mob:getBattleTime()
    local spellCast = mob:getLocalVar("SpellCast")
    local spellrand = math.random(1,10)
    if (battletime > spellCast + (spellCooldown + spellrand)) then
        local pickSpell = math.random(1,100)
        if (hp > 75) then
            if (pickSpell < 30) then
                mob:castSpell(22,target) -- Holy II
            elseif (pickSpell < 70) then
                mob:castSpell(356, target)  -- Paralyga
            else
                mob:castSpell(57,mob) -- Haste
            end
        elseif (hp > 35) then
            if (pickSpell < 60) then
                mob:castSpell(5, mob) -- Cure V
            else
                mob:castSpell(57,mob) -- Haste
            end
        else
            if (pickSpell < 50) then
                mob:castSpell(5, mob) -- Cure V
            else
                mob:castSpell(356, target)  -- Paralyga
            end
        end

        local nextCast = math.random(3,20)
        mob:setLocalVar("SpellCast",battletime + nextCast)
    end


end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onSpellPrecast(mob, spell)
end;

-----------------------------------
-- onSpellPrecast
-----------------------------------

function onMonsterMagicPrepare(mob, target)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob, killer)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, kkiller)
end;