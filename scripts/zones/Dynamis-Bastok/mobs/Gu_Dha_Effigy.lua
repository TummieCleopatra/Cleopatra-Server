-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Gu'Dha Effigy
-- Mega Boss
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/dynamis");
require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------


function onMobSpawn(mob)
mob:addMod(dsp.mod.EVA,50);
mob:addMod(dsp.mod.ACC,50);
mob:setMod(dsp.mod.FASTCAST,50);

end;


function onMobEngaged(mob,target)

end;



function onSpellPrecast(mob, spell)
    if (spell:getID() == 367) then
        mob:setLocalVar("Spell",366)
    end
end

function onMobFight(mob, target)
    local spell = mob:getLocalVar("Spell")
    if (spell == 366) then
        mob:castSpell(366)
        mob:setLocalVar("Spell",0)
    end

end

function onMobRoam(mob)
    if (mob:getCurrentAction() == dsp.act.ROAMING) then
        DespawnMob(17539073);
    end


end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player)
player:setVar("DynaWeakener",0);

	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS) == false) then
		player:setVar("DynaBastok_Win",1);
		player:addKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_EYEGLASS);
		player:addTitle(dsp.title.DYNAMISBASTOK_INTERLOPER); -- Add title
	end




end;