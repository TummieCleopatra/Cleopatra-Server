-----------------------------------
--	Area: Mhaura
--	NPC:  Augment for Sea Items
-----------------------------------

-----------------------------------

-----------------------------------

require("scripts/zones/Mhaura/IDs");
require("scripts/globals/settings");

function onTrigger(player,npc)

local quest = player:getVar("FerretoryQuest75");


-- printf("%s just triggered Mogshop", player:getName());

    if (quest >= 14) then
        local stock_1 =
        {
            6011,   30000,   -- HQ Fire Crystal
            6012,   35000,   -- HQ Ice Crystal
            6013,   40000,   -- HQ Wind Crystal
            6014,   45000,   -- HQ Earth Crystal
            6015,   50000   -- HQ Lightning Crystal

        };
        dsp.shop.general(player, stock_1);
        player:PrintToPlayer( "Sojourn Pruveyor : To enter Sojourn, you will need one of these.  I have found that monsters inside react more negatively to higher tier rocks.", 0x1F);
    else
        player:PrintToPlayer( "Sojourn Pruveyor : Sojourn requires a high alignment of Feretory Aura to enter.  You might want to check with Maccus in Feretory.", 0x1F);
    end



end;