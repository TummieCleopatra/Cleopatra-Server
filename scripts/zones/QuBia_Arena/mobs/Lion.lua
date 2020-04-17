-----------------------------------
-- Area: Horlais Peak
-- NPC:  Nanaa
-- Tactics NPC
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobInitialize(mob)

end;

function onMobSpawn(mob)

    local special = mob:setLocalVar("Special", 2);
    local change = mob:setLocalVar("Changed",1);
	mob:setUnkillable(true);

end;

function onMobRoam(mob)
   -- mob:setModelId(1005);
	-- mob:AnimationSub(1);
end;

function onMobEngaged(mob,target)
    target:PrintToPlayer("??? : You will not be able to defeat me...", 0xD);
end;


function onMobFight(mob,target)
    local setskin = mob:getLocalVar("Skin");
    local change = mob:getLocalVar("Changed");
    local special = mob:getLocalVar("Special");
    local hp = mob:getHPP();
    local twohr = math.random(50,75);
	local tpmove = math.random(1,30);
	local taunt = mob:getLocalVar("Taunt");
	local isweak = mob:getLocalVar("WeakenedTrigger");
	local trusttalk = mob:getLocalVar("TrustTalk");
	local tp = mob:getTP();
    local mobSkin = mob:getModelId();


    if (hp < twohr) and (special ~= 1) then
      mob:useMobAbility(437);
	  mob:setLocalVar("Special",1);
    end



    if (isweak ~= 1) and (trusttalk ~= 1) and (hp < 60) then
        if (target:getObjType() == dsp.objType.PET or target:getObjType() == dsp.objType.TRUST) then
		    local master = target:getMaster();
			master:PrintToPlayer(string.format("(Lion) %s, we must strike this imposter down to reveal its true self!", target:getName()),0xF);
			mob:setLocalVar("TrustTalk",1);
	    elseif (target:getObjType() == dsp.objType.PC) then
	        target:PrintToPlayer(string.format("(Lion) %s, we must strike this imposter down to reveal its true self!", target:getName()),0xF);
		    mob:setLocalVar("TrustTalk",1);
		end
	end







end;



function onCriticalHit(mob)
    local hp = mob:getHPP();
    local changed = mob:getLocalVar("Changed");
	local isweak = mob:getLocalVar("WeakenedTrigger");
	local wsweakness = math.random(1,25);
    -- Function to break Mob out of its fake Form less than 50%
    if ((hp <= 50) and (changed == 1)) then
        if (wsweakness < 99) and (isweak ~= 1) then
		    mob:setUnkillable(false);
		    mob:weaknessTrigger(2);
            mob:addStatusEffect(dsp.effect.TERROR,1,0,3);
            mob:setLocalVar("WeakenedTrigger",1);
			-- mob:injectActionPacket(5, 350);
			mob:setHP(0);

        end
    end
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,player,isKiller)
local killx = mob:getXPos();
local killy = mob:getYPos();
local killz = mob:getZPos();
local mammett = 17621313;


	SpawnMob(mammett):setPos(killx,killy,killz);
    GetMobByID(mammett):updateClaim(player);
end;