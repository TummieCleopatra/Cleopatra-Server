



function staggerRate(mob)
    -- Sets overall Stagger Percentage
    local rate = 40
    local white = 5 -- 3%
    local red = 20  -- 37%
    local blue = 45 -- 15%
    local yellow = 100  -- 50%
    return rate, white, red, blue, yellow
end

function megaBossWeakener(mob, player)
local weakener = mob:getLocalVar("DynaWeakener");
   print(weakener)
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
   mob:setLocalVar("DynaWeakener",0);
  --  SetDropRate(5004,3415,300);
  player:PrintToPlayer("The Monster may not prove to be a challenge", 0xD);
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
   mob:setLocalVar("DynaWeakener",0);
  --  SetDropRate(5004,3415,300);
  player:PrintToPlayer("You have significantly weakened the monster!", 0xD);
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
   mob:setLocalVar("DynaWeakener",0);
  --  SetDropRate(5004,3415,500);
  player:PrintToPlayer("You have weakened the monster!", 0xD);
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
   mob:setLocalVar("DynaWeakener",0);
    -- SetDropRate(5004,3415,700);
  player:PrintToPlayer("You have weakened the monster ever so slightly", 0xD);
elseif (weakener == 0) then
 -- mob:setMod(dsp.mod.ACC,100);
 -- mob:setMod(dsp.mod.EVA,100);
   mob:setLocalVar("DynaWeakener",0);
player:PrintToPlayer("You have summoned a Monster.", 0xD);
end
end