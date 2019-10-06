-----------------------------------
-- Area: Dynamis Windurst
-- NPC:  Naa Yixo the STillrage
-- Boss Trigger for RDM/SAM
-----------------------------------
require("scripts/globals/status");
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
   mob:addMod(dsp.mod.ACC,-30);
  --  SetDropRate(5004,3415,300);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have significantly weakened the monster!", 0xD);
end
elseif (weakener == 2) then
   mob:setMod(dsp.mod.HPP,-50);
   mob:setMod(dsp.mod.DEFP,-20);
   mob:setMod(dsp.mod.ATTP,-20);
   mob:addMod(dsp.mod.EVA,-20);
   mob:addMod(dsp.mod.ACC,-20);
  --  SetDropRate(5004,3415,500);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have weakened the monster!", 0xD);
end
elseif (weakener == 1) then
   mob:setMod(dsp.mod.HPP,-20);
   mob:setMod(dsp.mod.DEFP,-10);
   mob:setMod(dsp.mod.ATTP,-10);
   mob:addMod(dsp.mod.EVA,-10);
   mob:addMod(dsp.mod.ACC,-10);
    -- SetDropRate(5004,3415,700);
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
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player,isKiller)
player:setVar("DynaWeakener",0);


end;