-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Trailblix Goatmug
-- Boss Trigger for RDM/NIN
-- ID 17547493
-- Popped with Tome 17
-- Drops Odius Cup
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobInitialize(mob)
	mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300);
end;
-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
mob:addMod(dsp.mod.EVA,30);
mob:addMod(dsp.mod.ACC,50);



end;


function onMobEngaged(mob,target)
	local randcs = 0;
	local randmij = 0;
local weakener = target:getVar("DynaWeakener");
   if (weakener == 3) then
   mob:setMod(dsp.mod.HPP,-75);
   mob:setMod(dsp.mod.DEFP,-75);
   mob:setMod(dsp.mod.ATTP,-75);
   mob:addMod(dsp.mod.EVA,-30);
   mob:addMod(dsp.mod.ACC,-30);
   mob:addMod(dsp.mod.MATT,-30);
   randcs = math.random(120, 180);
   randmij = math.random(180, 220);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have significantly weakened the monster!", 0xD);
end
elseif (weakener == 2) then
   mob:setMod(dsp.mod.HPP,-50);
   mob:setMod(dsp.mod.DEFP,-20);
   mob:setMod(dsp.mod.ATTP,-20);
   mob:addMod(dsp.mod.EVA,-20);
   mob:addMod(dsp.mod.ACC,-20);
   mob:addMod(dsp.mod.MATT,-20);
   randcs = math.random(100, 160);
   randmij = math.random(160, 200);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have weakened the monster!", 0xD);
end
elseif (weakener == 1) then
   mob:setMod(dsp.mod.HPP,-20);
   mob:setMod(dsp.mod.DEFP,-10);
   mob:setMod(dsp.mod.ATTP,-10);
   mob:addMod(dsp.mod.EVA,-10);
   mob:addMod(dsp.mod.ACC,-10);
   mob:addMod(dsp.mod.MATT,-10);
   randcs = math.random(100, 130);
   randmij = math.random(150, 180);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have weakened the monster ever so slightly", 0xD);
end
elseif (weakener == 0) then
 -- mob:setMod(dsp.mod.ACC,100);
 -- mob:setMod(dsp.mod.EVA,100);
   randcs = math.random(100, 110);
   randmij = math.random(140, 150);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have summoned a Monster.", 0xD);
end
end
mob:setLocalVar("rand_cs",randcs);
mob:setLocalVar("rand_mij",randmij);
end;


-----------------------------------
-- onMobFight Action
-----------------------------------
function onMobFight(mob,target)

    local battletime = mob:getBattleTime();
    local chainspell = mob:getLocalVar("Chainspell");
	local mijin = mob:getLocalVar("Mijin");
	local randcs = mob:getLocalVar("rand_cs");
	local randmij = mob:getLocalVar("rand_mij");


    if (battletime > chainspell + randcs) then
        mob:useMobAbility(436);
        mob:setLocalVar("Chainspell", battletime);
    elseif (battletime > mijin + randmij) then
        mob:useMobAbility(475);
        mob:setLocalVar("Mijin", battletime);
    end

end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player)
local qm1 = GetNPCByID(17547510);
player:setVar("DynaWeakener",0);
qm1:setStatus(STATUS_NORMAL);

end;

function onMobDespawn( mob )
local qm1 = GetNPCByID(17547510);

qm1:setStatus(STATUS_NORMAL);

end