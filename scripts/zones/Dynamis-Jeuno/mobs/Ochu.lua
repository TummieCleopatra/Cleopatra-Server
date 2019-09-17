-----------------------------------
-- Area: Dynamis Windy
-- NPC:  Bee
-- Map1 Position: http://images2.wikia.nocookie.net/__cb20090312004752/ffxi/images/8/84/Win1.jpg
-- Map2 Position: http://images2.wikia.nocookie.net/__cb20090312004839/ffxi/images/6/61/Win2.jpg
-----------------------------------
local ID = require("scripts/zones/Dynamis-Jeuno/IDs")
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Jeuno/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
local ochu = mob:getID()
GetMobByID(ochu):setDropID(5042); -- Default Drop ID
mob:setMod(dsp.mod.ACC,260);
mob:setMod(dsp.mod.EVA,295);
mob:setMod(dsp.mod.DEF,220);



	
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)

local vanatime = VanadielHour();
if (vanatime >= 0 and vanatime < 6) then
mob:setMod(dsp.mod.ATTP,-20);
mob:setMod(dsp.mod.MATT,-20);
mob:setMod(dsp.mod.DELAY,-40);
elseif (vanatime >= 6 and vanatime < 12) then
-- Neutral
elseif (vanatime >= 12 and vanatime < 18) then
mob:setMod(dsp.mod.ACC,-30);
mob:setMod(dsp.mod.ATTP,10);
end
    
end;




-----------------------------------
-- onWeaponskillHit
-----------------------------------
function onWeaponskillHit(mob, attacker, weaponskill)
-- Staggering Function
if (attacker:getObjType() == TYPE_PC) then
	local isweak = mob:getLocalVar("WeakenedTrigger");
	local ochu = mob:getID()
	
	local wsweakness = math.random(1,1000);
	if (wsweakness > 180) and (wsweakness < 401) and (isweak ~= 1) then
		mob:weaknessTrigger(0); -- Yellow Stagger Increase Scyld 55% of Triggers
		mob:addStatusEffect(dsp.effect.TERROR,1,0,10);
		local randomscyld = math.random(10,20);
		local oldscyld = attacker:getVar("ScyldMultiplier");
		local newscyld = (randomscyld + oldscyld);
		attacker:setVar("ScyldMultiplier",newscyld);
		mob:setLocalVar("WeakenedTrigger",1);
		attacker:PrintToPlayer("You have been granted a "..randomscyld.."% scyld bonus.  Total Bonus: "..newscyld.."%.", 0x15);
	elseif (wsweakness > 80) and (wsweakness < 181) and (isweak ~= 1) then
		mob:weaknessTrigger(1); -- Blue Stagger drops Memoirs which grants 4-8 currency  15%
		mob:addStatusEffect(dsp.effect.TERROR,1,0,10);
		GetMobByID(ochu):setDropID(6096);
		mob:setLocalVar("WeakenedTrigger",1);
	elseif (wsweakness > 20) and (wsweakness < 81) and (isweak ~= 1) then
		mob:weaknessTrigger(2); -- Red Stagger drops Pop Items 10%
		mob:addStatusEffect(dsp.effect.TERROR,1,0,10);
		local itemdrop = math.random(1,4);
		if (itemdrop == 1) then
			GetMobByID(ochu):setDropID(6100); -- Fiendish Tome 17
		elseif (itemdrop == 2) then
			GetMobByID(ochu):setDropID(6101); -- Fiendish Tome 18
		elseif (itemdrop == 3) then
			GetMobByID(ochu):setDropID(6102); -- Fiendish Tome 19
		elseif (itemdrop == 4) then
			GetMobByID(ochu):setDropID(6103); -- Fiendish Tome 20
		end
		mob:setLocalVar("WeakenedTrigger",1);
	elseif (wsweakness < 21) and (isweak ~= 1) then
		mob:weaknessTrigger(3); -- White Stagger drops 100's
		mob:addStatusEffect(dsp.effect.TERROR,1,0,10);
		local extracurrency = math.random(1,3);
		if (extracurrency == 1) then
			GetMobByID(ochu):setDropID(6097);	-- L.Jadeshell	
		elseif (extracurrency == 2) then
			GetMobByID(ochu):setDropID(6098); -- Montiont
		elseif (extracurrency == 3) then
			GetMobByID(ochu):setDropID(6099); -- 100 Byne
		end
		mob:setLocalVar("WeakenedTrigger",1);
	end

end



return 0;


end;

-----------------------------------
-- onMobFight Action
-- Randomly change Resistance based on Time
-----------------------------------
function onMobFight(mob,target)

if (mob:hasStatusEffect(dsp.effect.TERROR)) then
mob:setMod(dsp.mod.SLASHRES,1500);
mob:setMod(dsp.mod.PIERCERES,1500);
mob:setMod(dsp.mod.HTHRES,1500);
elseif (not mob:hasStatusEffect(dsp.effect.TERROR)) then
mob:setMod(dsp.mod.SLASHRES,1000);
mob:setMod(dsp.mod.PIERCERES,1000);
mob:setMod(dsp.mod.HTHRES,1000);
end




local vanatime = VanadielHour();
local isweakened = mob:getLocalVar("WeakenedTrigger");
if (vanatime >= 18) then
local randomTime = math.random(10,25);
local changeTime = mob:getLocalVar("changeTime");
if (mob:getBattleTime() - changeTime > randomTime) then
local changeres = math.random(1,3);

if (changeres == 1) then
if (target:getObjType() == TYPE_PC) then
target:PrintToPlayer("There is a change in the Monsters behavior.", 0x1C);
end
mob:setMod(dsp.mod.SLASHRES,300);
mob:setMod(dsp.mod.PIERCERES,1000);
mob:setMod(dsp.mod.HTHRES,2000);
mob:setLocalVar("changeTime", mob:getBattleTime());
elseif (changeres == 2) then
if (target:getObjType() == TYPE_PC) then
target:PrintToPlayer("There is a change in the Monsters behavior.", 0x1C);
end
mob:setMod(dsp.mod.SLASHRES,1000);
mob:setMod(dsp.mod.PIERCERES,2000);
mob:setMod(dsp.mod.HTHRES,300);
mob:setLocalVar("changeTime", mob:getBattleTime());
else
if (target:getObjType() == TYPE_PC) then
target:PrintToPlayer("There is a change in the Monsters behavior.", 0x1C);
end
mob:setMod(dsp.mod.SLASHRES,3000);
mob:setMod(dsp.mod.PIERCERES,300);
mob:setMod(dsp.mod.HTHRES,2000);
mob:setLocalVar("changeTime", mob:getBattleTime());
end
end
end












end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    local scyldmult = killer:getVar("ScyldMultiplier");
    local duration = 45;
	local accBoost = 10;
	local level = killer:getMainLvl();
	local scyld = math.floor((level - 65) * (1 + (scyldmult/100)));
	local stagger = mob:getLocalVar("MonsterStagger");
	
	
	
	
	if (killer:getObjType() == TYPE_PC) then
	
	local randombuff = math.random(1,100)
	if (randombuff >= 50) then
	killer:addStatusEffect(dsp.effect.ACCURACY_BOOST,accBoost,0,duration);
    killer:PrintToPlayer("The monster has endowed you with a temporary Accuracy Bonus", 0xD);
	elseif (randombuff < 20) then
	local heal = killer:getMaxHP();
	local healmp = killer:getMaxMP();
	killer:addHP(heal);
	killer:addMP(healmp);
    killer:PrintToPlayer(string.format("%s recovers HP and MP", killer:getName()), 0x15);
	end
	killer:addCurrency("scyld", scyld);
	killer:PrintToPlayer(string.format("%s gains "..scyld.." scyld.", killer:getName()), 0x15);
	end
	
end;
