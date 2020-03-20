-----------------------------------
-- Area: Bhaflau Remnants
--  NPC: Treasure Chest
-- @zone 73
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Remnants/IDs"] = nil;


local ID = require("scripts/zones/Bhaflau_Remnants/IDs");
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
		local purse = 5735; -- Cotton Coin Purse
		local purse2 = 5736; -- Linen Coin Purse: can give 1-2 cotton coin purses
        local chest = GetNPCByID(npcID);
        local boss = npc:getLocalVar("Boss")

        if (boss == 1) then
            item = gateWidow(player,npc)
        elseif (boss == 2) then
            item = zebra(player,npc)
        elseif (boss == 3) then
            item = peryton(player,npc)
        elseif (boss == 4) then
            item = pephredo(player,npc)
        elseif (boss == 5) then -- Bhaflau Boss
            local item1 = longBowedChariot(player,npc)
            local item2 = longBowedChariot(player,npc)
            local item3 = longBowedChariot(player,npc)
            if (chance < 5) then
               player:addTreasure(purse2,chest);
               player:addTreasure(purse2,chest);
               player:addTreasure(item1,chest);
               player:addTreasure(item2,chest);
               player:addTreasure(item3,chest);
            else
               player:addTreasure(purse2,chest);
               player:addTreasure(item1,chest);
               player:addTreasure(item2,chest);
            end
        elseif (npc:getLocalVar("Boss") == 4) then -- Silver Sea Boss
            local item1 = longArmedChariot(player,npc)
            local item2 = longArmedChariot(player,npc)
            local item3 = longArmedChariot(player,npc)
            if (chance < 5) then
               player:addTreasure(purse2,chest);
               player:addTreasure(purse2,chest);
               player:addTreasure(item1,chest);
               player:addTreasure(item2,chest);
               player:addTreasure(item3,chest);
            else
               player:addTreasure(purse2,chest);
               player:addTreasure(item1,chest);
               player:addTreasure(item2,chest);
            end

        else
		    -- player:addItem(item,1);
		    if (chance < 5) then
		        player:addTreasure(purse2,chest);
		    elseif (chance < 16) then
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

