-----------------------------------
-- Area:  Dynamis Bastok
-- NPC:   qm0 (???)
-- Notes: Spawns Megaboss
-----------------------------------
local ID = require("scripts/zones/Dynamis-Bastok/IDs")
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Bastok/IDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
if ((trade:hasItemQty(3384,1)) and (trade:hasItemQty(3385,1)) and (trade:hasItemQty(3386,1)) and (trade:hasItemQty(3387,1))) then
player:addKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.ALABASTER_GRANULES_OF_TIME);
player:tradeComplete();
elseif ((trade:hasItemQty(3384,1)) and (trade:hasItemQty(3385,1)) and (trade:hasItemQty(3386,1))) then
player:addKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.AMBER_GRANULES_OF_TIME);
player:tradeComplete();
elseif ((trade:hasItemQty(3384,1)) and (trade:hasItemQty(3385,1))) then
player:addKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.AZURE_GRANULES_OF_TIME);
player:tradeComplete();
elseif (trade:hasItemQty(3384,1)) then
player:addKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);
player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CRIMSON_GRANULES_OF_TIME);
player:tradeComplete();
end

local mob = GetMobByID(17539073)

if (GetMobAction(17539073) == 0 and trade:hasItemQty(3410,1)) and trade:hasItemQty(3411,1) and trade:hasItemQty(3412,1) and trade:hasItemQty(3413,1) and player:hasKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME) then
	SpawnMob(17539073):updateClaim(player);
	player:tradeComplete();
	player:delKeyItem(dsp.ki.ALABASTER_GRANULES_OF_TIME);

    mob:setLocalVar("DynaWeakener",4);
    megaBossWeakener(mob, player)
elseif (GetMobAction(17539073) == 0 and trade:hasItemQty(3410,1)) and trade:hasItemQty(3411,1) and trade:hasItemQty(3412,1) and trade:hasItemQty(3413,1) and player:hasKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME) then
	SpawnMob(17539073):updateClaim(player);
	player:tradeComplete();
    player:delKeyItem(dsp.ki.AMBER_GRANULES_OF_TIME);

    mob:setLocalVar("DynaWeakener",3);
        megaBossWeakener(mob, player)
elseif (GetMobAction(17539073) == 0 and trade:hasItemQty(3410,1)) and trade:hasItemQty(3411,1) and trade:hasItemQty(3412,1) and trade:hasItemQty(3413,1) and player:hasKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME) then
	SpawnMob(17539073):updateClaim(player);
	player:tradeComplete();
	player:delKeyItem(dsp.ki.AZURE_GRANULES_OF_TIME);

    mob:setLocalVar("DynaWeakener",2);
        megaBossWeakener(mob, player)
elseif (GetMobAction(17539073) == 0 and trade:hasItemQty(3410,1)) and trade:hasItemQty(3411,1) and trade:hasItemQty(3412,1) and trade:hasItemQty(3413,1) and player:hasKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME) then
	SpawnMob(17539073):updateClaim(player);
	player:tradeComplete();
	player:delKeyItem(dsp.ki.CRIMSON_GRANULES_OF_TIME);

    mob:setLocalVar("DynaWeakener",1);
        megaBossWeakener(mob, player)
elseif (GetMobAction(17539073) == 0 and trade:hasItemQty(3410,1)) and trade:hasItemQty(3411,1) and trade:hasItemQty(3412,1) and trade:hasItemQty(3413,1) then
    player:tradeComplete();
	SpawnMob(17539073):updateClaim(player);
    mob:setLocalVar("DynaWeakener",0);
        megaBossWeakener(mob, player)
end

end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)



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