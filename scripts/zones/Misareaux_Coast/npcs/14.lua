-----------------------------------
-- Area: Lufaise Meadows
-- NPC:  Blank Spot for obtaining Ulmia Trust
-- @pos -472 -31 338 25
-----------------------------------
local ID = require("scripts/zones/Lufaise_Meadows/IDs")

-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/settings");


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(604,1) and player:hasSpell(913) == false) then
	    player:PrintToPlayer("Prishe : I am ready to fight by your side", 0xD);
		player:PrintToPlayer("You are now able to summon  Prishe as a Trust!", 0x1C);
		player:addSpell(913);
		player:tradeComplete();
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:PrintToPlayer("You see something out of the corner of your eye, but now it's gone", 0x1C);
end;