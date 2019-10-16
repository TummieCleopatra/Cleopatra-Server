-----------------------------------
-- Area: Ferretory
-- NPC: Suibhne
-- Checks Feretory Aura
-----------------------------------

-----------------------------------

local ID = require("scripts/zones/Feretory/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local aura = player:getVar("FerretoryAura");
if (aura == 0) then
player:PrintToPlayer("Suibhne : I can't sense any Aura on you sadly.", 0xD);
end
if (aura > 0) and (aura < 4) then
player:PrintToPlayer("Suibhne : Hmmm, I sense that your Aura is currently at level " ..aura..". You should work harder to increase it.", 0xD);
end
if (aura > 3) and (aura < 9) then
player:PrintToPlayer("Suibhne : Your Aura is currently at level " ..aura..". Keep up the work.", 0xD);
end
if (aura == 10) then
player:PrintToPlayer("Suibhne : Wow!! Your Aura is at level " ..aura..". Fantastic!!", 0xD);
end

end;
-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



