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

 if (player:hasKeyItem(dsp.ki.HYDRA_CORPS_TACTICAL_MAP)) then
stock = {0x0F0D,1000,  -- Displacers
         0x07F3,30000,  -- WAR
		 0x07F8,30000,  -- MNK
	     0x07FE,30000,  -- WHM
		 0x080E,30000,  -- THF
		 0x0808,30000,  -- RDM
		 0x0817,30000,  -- DRK
		 0x0822,30000,  -- BRD
		 0x0A6D,30000,  -- COR
		 0x0AA2,30000,  -- DNC
		 0x082C,30000,  -- SAM
		 0x0804,30000,  -- BLM
		 0x0834,30000,  -- DRG
		 0x0831,30000,  -- NIN
		 0x0A73,30000,  -- PUP
		 0x0823,30000   -- RNG


}  
player:PrintToPlayer("Moogle : Discounts for you Kupo, for defeating that ugly Gu Dha Effigy!!", 0xD);
showShop(player, STATIC, stock);  
else
stock = {0x0F0D,3500,  -- Displacers
         0x07F3,100000,  -- WAR
		 0x07F8,100000,  -- MNK
         0x07FE,100000,  -- WHM
		 0x080E,100000,  -- THF
		 0x0808,100000,  -- RDM
		 0x0817,100000,  -- DRK
		 0x0822,100000,  -- BRD
		 0x0A6D,100000,  -- COR
		 0x0AA2,100000,  -- DNC
		 0x082C,100000,  -- SAM
		 0x0804,100000,  -- BLM
		 0x0834,100000,  -- DRG
		 0x0831,100000,  -- NIN
		 0x0A73,100000,  -- PUP
		 0x0823,100000   -- RNG
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