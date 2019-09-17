-------------------------
-- Area: Dynamis - Bastok
-- NPC: Relic Armor Moogle
-- Buy Damaged Artifact armor
-------------------------


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

 if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS)) then
stock = {0x0F0D,1000,  -- Displacers
         0x07FA,30000,  -- MNK
		 0x0803,30000,  -- BLM
         0x0807,30000,  -- RDM
		 0x080B,30000,  -- THF
		 0x080F,30000,  -- PLD
		 0x0818,30000,  -- DRK
		 0x081A,30000,  -- BST
		 0x0820,30000,  -- BRD
		 0x0839,30000,  -- SMN
		 0x0835,30000,  -- DRG
		 0x082A,30000,  -- SAM
		 0x0A69,30000,  -- BLU
		 0x0A6F,30000,  -- COR
		 0x0A9E,30000,  -- DNC
		 0x0AA6,30000   -- SCH


}  
player:PrintToPlayer("Moogle : Discounts for you Kupo, for defeating that ugly Gu Dha Effigy!!", 0xD);
showShop(player, STATIC, stock);  
else
stock = {0x0F0D,3500,  -- Displacers
         0x07FA,1000000,  -- MNK
		 0x0803,1000000,  -- BLM
         0x0807,1000000,  -- RDM
		 0x080B,1000000,  -- THF
		 0x080F,1000000,  -- PLD
		 0x0818,1000000,  -- DRK
		 0x081A,1000000,  -- BST
		 0x0820,1000000,  -- BRD
		 0x0839,1000000,  -- SMN
		 0x0835,1000000,  -- DRG
		 0x082A,1000000,  -- SAM
		 0x0A69,1000000,  -- BLU
		 0x0A6F,1000000,  -- COR
		 0x0A9E,1000000,  -- DNC
		 0x0AA6,1000000   -- SCH
}  
player:PrintToPlayer("Moogle : Kupo, I'll give you a discount if you defeat the Gu Dha Effigy that's been distrubing the Moogles.", 0xD);
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