-----------------------------------
-- Area: Al'Taieu
-- NM:  Jailer of Prudence
-- IDs: 16912846, 16912847
-- AnimationSubs: 0 - Normal, 3 - Mouth Open
-- Wiki: http://ffxiclopedia.wikia.com/wiki/Jailer_of_Prudence
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/AlTaieu/mobIDs");
require("scripts/globals/mobscaler");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAIN_2HOUR, 1);
    mob:setMobMod(dsp.mobMod.2HOUR_MULTI, 1);
    mob:setMobMod(dsp.mobMod.NO_DROPS, 1);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("PartySize",8);  
    mob:AnimationSub(0); -- Mouth closed
    mob:addStatusEffectEx(dsp.effect.FLEE,0,100,0,60);
    mob:setMod(dsp.mod.TRIPLE_ATTACK, 20);
    mob:setMod(dsp.mod.REGEN, 10);
    mob:addMod(dsp.mod.BINDRES, 30);
    mob:addMod(dsp.mod.SLOWRES, 10);
    mob:addMod(dsp.mod.BLINDRES, 10);
    mob:addMod(dsp.mod.SLEEPRES, 30);
    mob:addMod(dsp.mod.PETRIFYRES, 10);
    mob:addMod(dsp.mod.GRAVITYRES, 10);
    mob:addMod(dsp.mod.LULLABYRES, 30);
end;

-----------------------------------
-- onMobDisEngage Action
-----------------------------------

function onMobDisEngage(mob, target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    local size = target:getPartySize();
	mobScaler(mob,target);
end;

-----------------------------------
-- onMobskill -- When this functionlity is added, this should work.
-----------------------------------

-- function onUseAbility(mob,target,ability)

    -- if (ability:getID() == 437) then -- Perfect Dodge
        -- mob:addStatusEffectEx(dsp.effect.FLEE,0,100,0,30);
    -- else        
        -- if (mob:getID() == PrudenceOne and GetMobAction(PrudenceTwo) > 0 and GetMobAction(PrudenceTwo) ~= ACTION_SLEEP and GetMobAction(PrudenceTwo) ~= ACTION_STUN) then
            -- if (GetMobByID(PrudenceTwo):checkDistance(mob) <= 10) then
                -- GetMobByID(PrudenceTwo):useMobAbility(ability:getID());
            -- end            
        -- elseif (mob:getID() == PrudenceTwo and GetMobAction(PrudenceOne) > 0 and GetMobAction(PrudenceOne) ~= ACTION_SLEEP and GetMobAction(PrudenceOne) ~= ACTION_STUN) then
            -- if (GetMobByID(PrudenceOne):checkDistance(mob) <= 10) then
                -- GetMobByID(PrudenceOne):useMobAbility(ability:getID());
            -- end
        -- end
    -- end
-- end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local firstPrudence     = GetMobByID(PrudenceOne);
    local secondPrudence    = GetMobByID(PrudenceTwo);
    if (mob:getID() == PrudenceOne) then
        secondPrudence:setMobMod(dsp.mobMod.NO_DROPS, 0);
        secondPrudence:AnimationSub(3); -- Mouth Open
        secondPrudence:addMod(dsp.mod.ATTP, 100);
        secondPrudence:delMod(dsp.mod.DEFP, -50);
    else
        firstPrudence:setMobMod(dsp.mobMod.NO_DROPS, 0);
        firstPrudence:AnimationSub(3); -- Mouth Open
        firstPrudence:addMod(dsp.mod.ATTP, 100);
        firstPrudence:delMod(dsp.mod.DEFP, -50);
    end;
	
        player:setVar("Prude_Win",1);
	    player:addCurrency('zeni_point',700);
	    player:PrintToPlayer("You obtain 700 Zeni Points.", 0x15);		


end;
