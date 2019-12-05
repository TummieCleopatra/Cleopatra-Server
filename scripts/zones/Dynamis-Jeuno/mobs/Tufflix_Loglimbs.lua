-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Tufflix Loglimbs
-- Boss Trigger for PLD/WAR
-- Popped with Roving Bijou
-- Drops Tome 18
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
mob:addMod(dsp.mod.EVA,50);
mob:addMod(dsp.mod.ACC,50);


end;


function onMobEngaged(mob,target)
local weakener = target:getVar("DynaWeakener");
   if (weakener == 3) then
   mob:setMod(dsp.mod.HPP,-75);
   mob:setMod(dsp.mod.DEFP,-75);
   mob:setMod(dsp.mod.ATTP,-75);
   mob:addMod(dsp.mod.EVA,-30);
   mob:addMOd(dsp.mod.ACC,-30);
  SetDropRate(5044,3421,300);
if (target:getObjType() == dsp.objType.PC) then  
target:PrintToPlayer("You have significantly weakened the monster!", 0xD);
end
elseif (weakener == 2) then
   mob:setMod(dsp.mod.HPP,-50);
   mob:setMod(dsp.mod.DEFP,-20);
   mob:setMod(dsp.mod.ATTP,-20);
   mob:addMod(dsp.mod.EVA,-20);
   mob:addMOd(dsp.mod.ACC,-20);
   SetDropRate(5044,3421,500);
if (target:getObjType() == dsp.objType.PC) then  
target:PrintToPlayer("You have weakened the monster!", 0xD);
end
elseif (weakener == 1) then
   mob:setMod(dsp.mod.HPP,-20);
   mob:setMod(dsp.mod.DEFP,-10);
   mob:setMod(dsp.mod.ATTP,-10);
   mob:addMod(dsp.mod.EVA,-10);
   mob:addMOd(dsp.mod.ACC,-10);
   SetDropRate(5044,3421,700);
if (target:getObjType() == dsp.objType.PC) then	
target:PrintToPlayer("You have weakened the monster ever so slightly", 0xD);
end
elseif (weakener == 0) then
 -- mob:setMod(dsp.mod.ACC,100);
 -- mob:setMod(dsp.mod.EVA,100);
if (target:getObjType() == dsp.objType.PC) then 
target:PrintToPlayer("You have summoned a Monster.", 0xD); 
end 
end   
end;


-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

    local battletime = mob:getBattleTime();
    local inv = mob:getLocalVar("Invincible");
	local randinvc = math.random(75, 90);

    if (battletime > inv + randinv) then
        mob:useMobAbility(438);
        mob:setLocalVar("Invincible", battletime);
    end

end;



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player)
local qm2 = GetNPCByID(17547511);
player:setVar("DynaWeakener",0);
qm2:setStatus(STATUS_NORMAL);
	

end;

function onMobDespawn( mob )
local qm2 = GetNPCByID(17547511);

qm2:setStatus(STATUS_NORMAL);

end