-------------------------
-- Area: Dynamis - Windurst
-- NPC: Relic Armor Moogle
-- Trade 8000 Scyld and Artifact armor of the same time to receive Relic
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

 if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_LANTERN)) then
stock = {0x0F0D,1000,  -- Displacers
         0x07F1,30000,  -- WAR
		 0x07FF,30000,  -- WHM
         0x0802,30000,  -- BLM
		 0x080A,30000,  -- THF
		 0x0813,30000,  -- PLD
		 0x0816,30000,  -- DRK
		 0x0819,30000,  -- BST
		 0x0825,30000,  -- RNG
		 0x083A,30000,  -- SMN
		 0x082D,30000,  -- NIN
		 0x082B,30000,  -- SAM
		 0x0A6A,30000,  -- BLU
		 0x0A72,30000,  -- PUP
		 0x0AA0,30000,  -- DNC
		 0x0AA7,30000   -- SCH


}  
player:PrintToPlayer("Moogle : Discounts for you Kupo, for defeating that Tzee Xicu Idol!!", 0xD);
showShop(player, STATIC, stock);  
else
stock = {0x0F0D,3500,  -- Displacers
         0x07F1,1000000,  -- WAR
		 0x07FF,1000000,  -- WHM
         0x0802,1000000,  -- BLM
		 0x080A,1000000,  -- THF
		 0x0813,1000000,  -- PLD
		 0x0816,1000000,  -- DRK
		 0x0819,1000000,  -- BST
		 0x0825,1000000,  -- RNG
		 0x083A,1000000,  -- SMN
		 0x082D,1000000,  -- NIN
		 0x082B,1000000,  -- SAM
		 0x0A6A,1000000,  -- BLU
		 0x0A72,1000000,  -- PUP
		 0x0AA0,1000000,  -- DNC
		 0x0AA7,1000000   -- SCH

}  
player:PrintToPlayer("Moogle : Kupo, I'll give you a discount if you defeat the Tzee Xicu Idol!.", 0xD);
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