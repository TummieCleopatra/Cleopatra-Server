-------------------------
-- Area: Dynamis - San d'Oria
-- NPC: Relic Armor Moogle
-- Sells -1 armor, discounted if player has zone win
-- -1 armor makes NQ.  NQ and -1 makes HQ through Sagheera
-------------------------

require("scripts/globals/keyitems");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER)) then
stock = {0x0F0D,1000,  -- Displacers
         0x07F5,30000,  -- WAR
		 0x07FA,30000,  -- MNK
		 0x07FB,30000,  -- WHM
		 0x0809,30000,  -- RDM
		 0x0811,30000,  -- PLD
		 0x081C,30000,  -- BST
		 0x081E,30000,  -- BRD
		 0x0826,30000,  -- RNG
		 0x07E1,30000,  -- SMN
		 0x0830,30000,  -- NIN
		 0x0836,30000,  -- DRG
		 0x0A68,30000,  -- BLU
		 0x0A6E,30000,  -- COR
		 0x0A74,30000,  -- PUP
		 0x0AA5,30000   -- SCH

}  
player:PrintToPlayer("Moogle : Discounts for you Kupo, for defeating that smelly Overlord Tombstone!!", 0xD);
showShop(player, STATIC, stock);  
else
stock = {0x0F0D,3500,  -- Displacers
         0x07F5,1000000,  -- WAR
		 0x07FA,1000000,  -- MNK
		 0x07FB,1000000,  -- WHM
		 0x0809,1000000,  -- RDM
		 0x0811,1000000,  -- PLD
		 0x081C,1000000,  -- BST
		 0x081E,1000000,  -- BRD
		 0x0826,1000000,  -- RNG
		 0x07E1,1000000,  -- SMN
		 0x0830,1000000,  -- NIN
		 0x0836,1000000,  -- DRG
		 0x0A68,1000000,  -- BLU
		 0x0A6E,1000000,  -- COR
		 0x0A74,1000000,  -- PUP
		 0x0AA5,1000000   -- SCH

}  
player:PrintToPlayer("Moogle : Kupo, I'll give you a discount if you defeat the Overlord Tombstone.", 0xD);
showShop(player, STATIC, stock);  
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