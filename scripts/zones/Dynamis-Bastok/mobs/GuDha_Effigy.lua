-----------------------------------
-- Area: Dynamis Bastok
--  MOB: Gu'Dha Effigy
-- Mega Boss

local ID = require("scripts/zones/Dynamis-Bastok/IDs")
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/dynamis");
require("scripts/globals/keyitems");
-----------------------------------

function onMobRoam(mob)
    if (mob:getCurrentAction() == dsp.act.ROAMING) then
        DespawnMob(17539073);
    end


end

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,player)
printf("Correct")
player:setVar("DynaWeakener",0);

	if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS) == false) then
		player:setVar("DynaBastok_Win",1);
		player:addKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS);
		player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.HYDRA_CORPS_EYEGLASS);
		player:addTitle(dsp.title.DYNAMISBASTOK_INTERLOPER); -- Add title
	end

end;