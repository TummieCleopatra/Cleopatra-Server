-----------------------------------
-- Area: Bhaflau Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Remnants/IDs"] = nil;


require("scripts/zones/Bhaflau_Remnants/TextIDs");
require("scripts/globals/treasure");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/salvagescaler");

function onTrigger(player,npc,trade)
    local npcID = npc:getID()
	-- Open
    if (npc:getAnimation() == 90) then
	    -- Determine Loot

		-- Gold Boxes contain Alexandrite very rare
		local chance = math.random(1,100);
		local item = salvageLoot(player,npc)
		local alex = 2488;
		local purse = 5735;
		local purse2 = 5736;
		local chest = GetNPCByID(npcID);
		-- player:addItem(item,1);
		if (chance < 10) then
		    player:addTreasure(purse2,chest);
		elseif (chance < 25) then
		    player:addTreasure(item,chest);
			player:addTreasure(purse,chest);
		elseif (chance < 50) then
		    player:addTreasure(item,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
		else
		    player:addTreasure(item,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
			player:addTreasure(alex,chest);
		end
	    -- player:messageSpecial(ITEM_OBTAINED,item);
	    GetNPCByID(npcID):setAnimation(0);


	    GetNPCByID(npcID):setStatus(dsp.status.DISAPPEAR);
	elseif (npc:getAnimation() ~= 90) then
	    local ani = npc:getAnimation();
		printf("Aniatmion is: %s",ani);
	    GetNPCByID(npcID):setAnimation(90);
	end


    -- player:messageSpecial(ITEM_OBTAINED,5145);
	-- GetNPCByID(17076579):setAnimation(90);
	--GetNPCByID(17076579):setStatus(STATUS_DISAPPEAR);

end;

