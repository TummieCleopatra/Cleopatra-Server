-----------------------------------
-- Area: Dynamis Windurst
--  MOB: Tzee Xicu Idol
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/dynamis");
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
mob:addMod(dsp.mod.EVA,50);
mob:addMod(dsp.mod.ACC,50);
mob:setMod(dsp.mod.FASTCAST,50);

local weakener = target:getVar("DynaWeakener");
 if (weakener == 4) then
   mob:setMod(dsp.mod.HPP,-75);
   mob:setMod(dsp.mod.DEFP,-90);
   mob:setMod(dsp.mod.ATTP,-90);
   mob:addMod(dsp.mod.EVA,-40);
   mob:addMod(dsp.mod.ACC,-40);
   mob:setMod(dsp.mod.FASTCAST,-60);
   mob:setMod(dsp.mod.SLASHRES,1500);
   mob:setMod(dsp.mod.PIERCERES,1500);
   mob:setMod(dsp.mod.HTHRES,1500);
   target:setVar("DynaWeakener",0);
  --  SetDropRate(5004,3415,300);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("The Monster may not prove to be a challenge", 0xD);
end
elseif (weakener == 3) then
   mob:setMod(dsp.mod.HPP,-57);
   mob:setMod(dsp.mod.DEFP,-57);
   mob:setMod(dsp.mod.ATTP,-77);
   mob:addMod(dsp.mod.EVA,-30);
   mob:addMod(dsp.mod.ACC,-30);
   mob:setMod(dsp.mod.FASTCAST,-40);
   mob:setMod(dsp.mod.SLASHRES,1200);
   mob:setMod(dsp.mod.PIERCERES,1200);
   mob:setMod(dsp.mod.HTHRES,1200);
   target:setVar("DynaWeakener",0);
  --  SetDropRate(5004,3415,300);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have significantly weakened the monster!", 0xD);
end
elseif (weakener == 2) then
   mob:setMod(dsp.mod.HPP,-38);
   mob:setMod(dsp.mod.DEFP,-20);
   mob:setMod(dsp.mod.ATTP,-20);
   mob:addMod(dsp.mod.EVA,-20);
   mob:addMod(dsp.mod.ACC,-20);
   mob:setMod(dsp.mod.FASTCAST,-30);
   mob:setMod(dsp.mod.SLASHRES,1000);
   mob:setMod(dsp.mod.PIERCERES,1000);
   mob:setMod(dsp.mod.HTHRES,1000);
   target:setVar("DynaWeakener",0);
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
   mob:setMod(dsp.mod.FASTCAST,-15);
   mob:setMod(dsp.mod.SLASHRES,900);
   mob:setMod(dsp.mod.PIERCERES,900);
   mob:setMod(dsp.mod.HTHRES,900);
   target:setVar("DynaWeakener",0);
    -- SetDropRate(5004,3415,700);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have weakened the monster ever so slightly", 0xD);
end
elseif (weakener == 0) then
 -- mob:setMod(dsp.mod.ACC,100);
 -- mob:setMod(dsp.mod.EVA,100);
   target:setVar("DynaWeakener",0);
if (target:getObjType() == dsp.objType.PC) then
target:PrintToPlayer("You have summoned a Monster.", 0xD);
end
end



end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)


end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player,isKiller)

	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_LANTERN) == false) then
		player:setVar("DynaWindurst_Win",1);
		player:addKeyItem(dsp.ki.HYDRA_CORPS_LANTERN);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,HYDRA_CORPS_LANTERN);
		player:addTitle(dsp.title.DYNAMISWINDURST_INTERLOPER); -- Add title
	end

end;