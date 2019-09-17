-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Gu'Nhi Noondozer
-- Popped with Tome 8
-----------------------------------

require("scripts/globals/dynamis");

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
  --  SetDropRate(5004,3415,300);
target:PrintToPlayer("You have significantly weakened the monster!", 0xD);
elseif (weakener == 2) then
   mob:setMod(dsp.mod.HPP,-50);
   mob:setMod(dsp.mod.DEFP,-20);
   mob:setMod(dsp.mod.ATTP,-20);
   mob:addMod(dsp.mod.EVA,-20);
   mob:addMOd(dsp.mod.ACC,-20);
  --  SetDropRate(5004,3415,500);
target:PrintToPlayer("You have weakened the monster!", 0xD);
elseif (weakener == 1) then
   mob:setMod(dsp.mod.HPP,-20);
   mob:setMod(dsp.mod.DEFP,-10);
   mob:setMod(dsp.mod.ATTP,-10);
   mob:addMod(dsp.mod.EVA,-10);
   mob:addMOd(dsp.mod.ACC,-10);
    -- SetDropRate(5004,3415,700);
target:PrintToPlayer("You have weakened the monster ever so slightly", 0xD);
elseif (weakener == 0) then
 -- mob:setMod(dsp.mod.ACC,100);
 -- mob:setMod(dsp.mod.EVA,100);
target:PrintToPlayer("You have summoned a Monster.", 0xD);  
end   
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
killer:setVar("DynaWeakener",0);
	

end;