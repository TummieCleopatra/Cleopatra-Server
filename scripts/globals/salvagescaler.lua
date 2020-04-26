-------------------------------------------
-- Mob Scaler
-- This Function scales Notorious Monsters
-- level based on the amount of players present
-- in the party.  Set local variable
-- based on what the expected full level
-- of players needed to fight naturally
-- would be
-------------------------------------------

-------------------------------------------
-- Scale Chart
-- 1 = 1-3 Players
-- 2 = 4-6 Players
-- 3 = 7-9 Players
-- 4 = 10-12 Players
-- 5 = 13-15 Players
-- 6 = 16-18 Players
-------------------------------------------
require("scripts/globals/settings");

local nmblue = 5
local nmred = 15
local nmgold = 30

local ssnmblue = 90
local ssnmred = 85


-----------------------------------
-- mobScaler
-----------------------------------

function restoreStats(player)
    local party = player:getParty()
    for _,member in ipairs(party) do
        local mpamt = member:getMaxMP() - member:getMP()
        member:restoreMP(mpamt)
        member:messageBasic(dsp.msg.basic.RECOVERS_MP, 0, mpamt)
        local hpamt = member:getMaxHP() - member:getHP()
        member:restoreHP(hpamt)
        member:messageBasic(dsp.msg.basic.RECOVERS_HP, 0, hpamt)
    end
end

function hpScaler(mob)

	local floorcount = mob:getLocalVar("Floor");

	local sizediff = (floorcount - 9);
	printf("Size Difference: %s",sizediff);
    local scale = mob:getLocalVar("Scale");

    if (scale == 1) then
	    local hpboost = (4 * sizediff);
	    mob:addStatusEffect(dsp.effect.MAX_HP_BOOST,hpboost,0,5000);
	    mob:setLocalVar("Scale",2);
	end


end

function salvageChestZ(mob, isKiller)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();


	local blue1 = GetNPCByID(17076579);
	local blue2 = GetNPCByID(17076580);
	local blue3 = GetNPCByID(17076581);
	local blue4 = GetNPCByID(17076582);
	local blue5 = GetNPCByID(17076583);
	local blue6 = GetNPCByID(17076584);
	local red1 = GetNPCByID(17076585);
	local red2 = GetNPCByID(17076586);
	local red3 = GetNPCByID(17076587);
	local gold1 = GetNPCByID(17076588);
	local gold2 = GetNPCByID(17076589);

	-- Decide which chest to drop.
	-- Blue is low quality items
	-- red is HQ meds
	-- Gold is Alexandrite

	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CEST FREQUENCY IS: %s",chestdrop);
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 15) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= dsp.status.NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            -- gold1:setStatus(dsp.status.NORMAL);
				gold1:showNPC(60);
		    elseif (gold2:getStatus() ~= dsp.status.NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            -- gold2:setStatus(dsp.status.NORMAL);
				gold2:showNPC(60);
            end
	    elseif (chesttype < 45) then
		    printf("red");
	        if (red1:getStatus() ~= dsp.status.NORMAL) then
	            red1:setPos(killx+1,killy,killz);
	            -- red1:setStatus(dsp.status.NORMAL);
				red1:showNPC(60);
		    elseif (red2:getStatus() ~= dsp.status.NORMAL) then
	            red2:setPos(killx+1,killy,killz);
	            -- red2:setStatus(dsp.status.NORMAL);
				red2:showNPC(60);
		    elseif (red3:getStatus() ~= dsp.status.NORMAL) then
	            red3:setPos(killx+1,killy,killz);
	            -- red3:setStatus(dsp.status.NORMAL);
				red3:showNPC(60);
            end
	    else
		    printf("BLUE");
	        if (blue1:getStatus() ~= dsp.status.NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            -- blue1:setStatus(dsp.status.NORMAL);
				blue1:showNPC(60);
		    elseif (blue2:getStatus() ~= dsp.status.NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            -- blue2:setStatus(dsp.status.NORMAL);
				blue2:showNPC(60);
		    elseif (blue3:getStatus() ~= dsp.status.NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            -- blue3:setStatus(dsp.status.NORMAL);
				blue3:showNPC(60);
		    elseif (blue4:getStatus() ~= dsp.status.NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	           -- blue4:setStatus(dsp.status.NORMAL);
				blue4:showNPC(60);
		    elseif (blue5:getStatus() ~= dsp.status.NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	           -- blue5:setStatus(dsp.status.NORMAL);
				blue5:showNPC(60);
		    elseif (blue6:getStatus() ~= dsp.status.NORMAL) then
	            blue6:setPos(killx+1,killy,killz);
	            -- blue6:setStatus(dsp.status.NORMAL);
				blue6:showNPC(60);
            end
	    end
    end
end


function salvageChestA(mob, isKiller)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();


	local blue1 = GetNPCByID(17080586);
	local blue2 = GetNPCByID(17080587);
	local blue3 = GetNPCByID(17080588);
	local blue4 = GetNPCByID(17080589);
	local blue5 = GetNPCByID(17080590);
	local blue6 = GetNPCByID(17080591);
	local red1 = GetNPCByID(17080592);
	local red2 = GetNPCByID(17080593);
	local red3 = GetNPCByID(17080594);
	local gold1 = GetNPCByID(17080595);
	local gold2 = GetNPCByID(17080598);

	-- Decide which chest to drop.
	-- Blue is low quality items
	-- red is HQ meds
	-- Gold is Alexandrite

	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CEST FREQUENCY IS: %s",chestdrop);
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 35) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= dsp.status.NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            -- gold1:setStatus(dsp.status.NORMAL);
				gold1:showNPC(60);
		    elseif (gold2:getStatus() ~= dsp.status.NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            -- gold2:setStatus(dsp.status.NORMAL);
				gold2:showNPC(60);
            end
	    elseif (chesttype < 45) then
		    printf("red");
	        if (red1:getStatus() ~= dsp.status.NORMAL) then
	            red1:setPos(killx+1,killy,killz);
	            -- red1:setStatus(dsp.status.NORMAL);
				red1:showNPC(60);
		    elseif (red2:getStatus() ~= dsp.status.NORMAL) then
	            red2:setPos(killx+1,killy,killz);
	            -- red2:setStatus(dsp.status.NORMAL);
				red2:showNPC(60);
		    elseif (red3:getStatus() ~= dsp.status.NORMAL) then
	            red3:setPos(killx+1,killy,killz);
	            -- red3:setStatus(dsp.status.NORMAL);
				red3:showNPC(60);
            end
	    else
		    printf("BLUE");
	        if (blue1:getStatus() ~= dsp.status.NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            -- blue1:setStatus(dsp.status.NORMAL);
				blue1:showNPC(60);
		    elseif (blue2:getStatus() ~= dsp.status.NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            -- blue2:setStatus(dsp.status.NORMAL);
				blue2:showNPC(60);
		    elseif (blue3:getStatus() ~= dsp.status.NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            -- blue3:setStatus(dsp.status.NORMAL);
				blue3:showNPC(60);
		    elseif (blue4:getStatus() ~= dsp.status.NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	           -- blue4:setStatus(dsp.status.NORMAL);
				blue4:showNPC(60);
		    elseif (blue5:getStatus() ~= dsp.status.NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	           -- blue5:setStatus(dsp.status.NORMAL);
				blue5:showNPC(60);
		    elseif (blue6:getStatus() ~= dsp.status.NORMAL) then
	            blue6:setPos(killx+1,killy,killz);
	            -- blue6:setStatus(dsp.status.NORMAL);
				blue6:showNPC(60);
            end
	    end
    end
end


function salvageChestB(mob, player, isKiller)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();


	local blue1 = GetNPCByID(17084417);
	local blue2 = GetNPCByID(17084418);
	local blue3 = GetNPCByID(17084419);
	local blue4 = GetNPCByID(17084420);
	local blue5 = GetNPCByID(17084421);
	local red1 = GetNPCByID(17084422);
	local red2 = GetNPCByID(17084423);
	local red3 = GetNPCByID(17084424);
	local gold1 = GetNPCByID(17084425);
	local gold2 = GetNPCByID(17084426);

	-- Decide which chest to drop.
	-- Blue is low quality items
	-- red is HQ meds
	-- Gold is Alexandrite
    local healChance = math.random(1,100)
    if (healChance < 25) then
        restoreStats(player)
    end

	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CEST FREQUENCY IS: %s",chestdrop);
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= CHEST_CHANCE) then
	    if (chesttype < GOLD_CHEST) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= dsp.status.NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            -- gold1:setStatus(dsp.status.NORMAL);
				gold1:showNPC(60);
		    elseif (gold2:getStatus() ~= dsp.status.NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            -- gold2:setStatus(dsp.status.NORMAL);
				gold2:showNPC(60);
            end
	    elseif (chesttype < RED_CHEST) then
		    printf("red");
	        if (red1:getStatus() ~= dsp.status.NORMAL) then
	            red1:setPos(killx+1,killy,killz);
	            -- red1:setStatus(dsp.status.NORMAL);
				red1:showNPC(60);
                red1:setAnimation(0)
                red1:AnimationSub(4)
		    elseif (red2:getStatus() ~= dsp.status.NORMAL) then
	            red2:setPos(killx+1,killy,killz);
	            -- red2:setStatus(dsp.status.NORMAL);
				red2:showNPC(60);
                red2:setAnimation(0)
                red2:AnimationSub(4)
		    elseif (red3:getStatus() ~= dsp.status.NORMAL) then
	            red3:setPos(killx+1,killy,killz);
	            -- red3:setStatus(dsp.status.NORMAL);
				red3:showNPC(60);
                red3:setAnimation(0)
                red3:AnimationSub(4)
            end
	    else
		    printf("BLUE");
	        if (blue1:getStatus() ~= dsp.status.NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            -- blue1:setStatus(dsp.status.NORMAL);
				blue1:showNPC(60);
                blue1:setAnimation(0)
                blue1:AnimationSub(4)
		    elseif (blue2:getStatus() ~= dsp.status.NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            -- blue2:setStatus(dsp.status.NORMAL);
				blue2:showNPC(60);
                blue2:setAnimation(0)
                blue2:AnimationSub(4)
		    elseif (blue3:getStatus() ~= dsp.status.NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            -- blue3:setStatus(dsp.status.NORMAL);
				blue3:showNPC(60);
                blue3:setAnimation(0)
                blue3:AnimationSub(4)
		    elseif (blue4:getStatus() ~= dsp.status.NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	           -- blue4:setStatus(dsp.status.NORMAL);
				blue4:showNPC(60);
                blue4:setAnimation(0)
                blue4:AnimationSub(4)
		    elseif (blue5:getStatus() ~= dsp.status.NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	           -- blue5:setStatus(dsp.status.NORMAL);
				blue5:showNPC(60);
                blue5:setAnimation(0)
                blue5:AnimationSub(4)
            end
	    end
    end
end
















function salvageChestAlways(mob, isKiller)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();

	printf("Killer X Pos is: %s",killx);
	local blue1 = GetNPCByID(17076579);
	local blue2 = GetNPCByID(17076580);
	local blue3 = GetNPCByID(17076581);
	local blue4 = GetNPCByID(17076582);
	local blue5 = GetNPCByID(17076583);
	local blue6 = GetNPCByID(17076584);
	local red1 = GetNPCByID(17076585);
	local red2 = GetNPCByID(17076586);
	local red3 = GetNPCByID(17076587);
	local gold1 = GetNPCByID(17076588);
	local gold2 = GetNPCByID(17076589);

	-- Decide which chest to drop.
	-- Blue is low quality items
	-- red is HQ meds
	-- Gold is Alexandrite

	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 40%
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 35) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= dsp.status.NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            gold1:setStatus(dsp.status.NORMAL);
		    elseif (gold2:getStatus() ~= dsp.status.NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            gold2:setStatus(dsp.status.NORMAL);
            end
	    elseif (chesttype < 40) then
		    printf("RED");
	        if (red1:getStatus() ~= dsp.status.NORMAL) then
	            red1:setPos(killx+1,killy,killz);
	            red1:setStatus(dsp.status.NORMAL);
		    elseif (red2:getStatus() ~= dsp.status.NORMAL) then
	            red2:setPos(killx+1,killy,killz);
	            red2:setStatus(dsp.status.NORMAL);
		    elseif (red3:getStatus() ~= dsp.status.NORMAL) then
	            red3:setPos(killx+1,killy,killz);
	            red3:setStatus(dsp.status.NORMAL);
            end
	    else
		    printf("BLUE");
	        if (blue1:getStatus() ~= dsp.status.NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            blue1:setStatus(dsp.status.NORMAL);
		    elseif (blue2:getStatus() ~= dsp.status.NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            blue2:setStatus(dsp.status.NORMAL);
		    elseif (blue3:getStatus() ~= dsp.status.NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            blue3:setStatus(dsp.status.NORMAL);
		    elseif (blue4:getStatus() ~= dsp.status.NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	            blue4:setStatus(dsp.status.NORMAL);
		    elseif (blue5:getStatus() ~= dsp.status.NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	            blue5:setStatus(dsp.status.NORMAL);
		    elseif (blue6:getStatus() ~= dsp.status.NORMAL) then
	            blue6:setPos(killx+1,killy,killz);
	           blue6:setStatus(dsp.status.NORMAL);
            end
	    end
    end
end


function salvageChestRed(mob, isKiller)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();

	printf("Killer X Pos is: %s",killx);

	local red1 = GetNPCByID(17076585);
	local red2 = GetNPCByID(17076586);
	local red3 = GetNPCByID(17076587);


	-- Decide which chest to drop.
	-- Blue is low quality items
	-- red is HQ meds
	-- Gold is Alexandrite

	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 50) then
	    if (red1:getStatus() ~= dsp.status.NORMAL) then
	        red1:setPos(killx+1,killy,killz);
	        red1:showNPC(60);
		elseif (red2:getStatus() ~= dsp.status.NORMAL) then
	        red2:setPos(killx+1,killy,killz);
	        red2:showNPC(60);
	    elseif (red3:getStatus() ~= dsp.status.NORMAL) then
	        red3:setPos(killx+1,killy,killz);
	        red3:showNPC(60);
        end
    end
end


function salvageLoot(player,npc)
    local item = 0;
    local npcID = npc:getID();
	local slvl = player:getVar("Salvage_Level");
    -- Common Drops
    if (player:getZoneID() == 75) then -- Bhaflau Zone
        local commonrand = math.random(1,6)
        local commondrop = 15712
        if (commonrand == 1) then
            commondrop = 15712-- Enyo's Leggings
        elseif (commonrand == 1) then
            commondrop = 16097 -- Anu's Tiara
        elseif (commonrand == 1) then
            commondrop = 14559 -- Anu's Doublet
        elseif (commonrand == 1) then
            commondrop = 15630 -- Njord's Trousers
        elseif (commonrand == 1) then
            commondrop = 15728 -- Nemains Sabots
        elseif (commonrand == 1) then
            commondrop = 14970 -- Hoshikazu Tekko
        end
    end


    if ((npcID <= 17076584 and npcID >= 17076579) or (npcID <= 17080586 and npcID >= 17080591) or
	    (npcID <= 17084417 and npcID >= 17084421) or (npcID <= 17088809 and npcID >= 17088814)) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (slvl <= 25) then
		    if (itemchance < 5) then
			    item = 5322; -- Healing Powder
		    elseif (itemchance < 10) then
			    item = 4255; -- Mana Powder
		    elseif (itemchance < 55) then
		   	    item = 5432;  -- Dusty Ether
		    else
		        item = 5431;  -- Dusty Potion
			end
		elseif (slvl <= 45) then
		    if (itemchance < 5) then
			    item = 5322; -- Healing Powder
		    elseif (itemchance < 10) then
			    item = 4255; -- Mana Powder
		    elseif (itemchance < 25) then
		   	    item = 5827;  -- Lucid Ether
		    elseif (itemchance < 35) then
		        item = 5824;  -- Lucid Potion
            else
                item = commondrop
			end
		elseif (slvl <= 55) then
		    if (itemchance < 15) then
			    item = 5322; -- Healing Powder
		    elseif (itemchance < 30) then
			    item = 4255; -- Mana Powder
		    elseif (itemchance < 45) then
		   	    item = 5828;  -- Lucid Ether II
		    elseif (itemchance < 60) then
		        item = 5825;  -- Lucid Potion II
			else
                item = commondrop
            end
		elseif (slvl <= 75) then
		    if (itemchance < 10) then
			    item = 5322; -- Healing Powder
		    elseif (itemchance < 20) then
			    item = 4255; -- Mana Powder
			elseif (itemchance < 30) then
			    item = 4254;
		    elseif (itemchance < 40) then
		   	    item = 5829;  -- Lucid Ether III
		    elseif (itemchance < 50) then
		        item = 5826;  -- Lucid Potion III
			else
                item = commondrop
			end
		end
    end

    if ((npcID <= 17076578 and npcID >= 17076585) or (npcID <= 17080592 and npcID >= 17080594) or
	    (npcID <= 17084422 and npcID >= 17084424) or (npcID <= 17088815 and npcID >= 17088817)) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (slvl <= 25) then
		    if (itemchance < 5) then
			    item = 5436; -- Instant Reraise
		    elseif (itemchance < 45) then
		        item = 5439;  -- Vicar's Drink (erase status ailments)
			else
                item = commondrop
			end
		elseif (slvl <= 35) then
		    if (itemchance < 5) then
			    item = 5436; -- Instant Reraise
		    elseif (itemchance < 20) then
			    item = 5439 -- Vicar's Drink (erase status ailments
		    elseif (itemchance < 35) then
		   	    item = 5388;  -- Assasins Drink (Magic Acc)
		    elseif (itemchance < 50) then
		   	    item = 5386;  -- Fighters Drink (increased acc)
			else
                item = commondrop
            end
		elseif (slvl <= 55) then
		    if (itemchance < 5) then
			    item = 5436; -- Instant Reraise
		    elseif (itemchance < 20) then
			    item = 5439 -- Vicar's Drink (erase status ailments
		    elseif (itemchance < 30) then
		   	    item = 5388;  -- Assasins Drink (magic acc)
		    elseif (itemchance < 45) then
		   	    item = 5386;  -- Fighters Drink (melee Acc)
		    elseif (itemchance < 60) then
		   	    item = 5385;  -- Barbarians Drink (Attack Power)
			else
                item = commondrop
            end
		elseif (slvl <= 75) then
		    if (itemchance < 5) then
			    item = 5389; -- Spys Drink

		    elseif (itemchance < 10) then
			    item = 5436; -- Instant Reraise
		    elseif (itemchance < 20) then
			    item = 6575;  -- Lucid Wings II
		    elseif (itemchance < 30) then
			    item = 5439 -- Vicar's Drink (erase status ailments
		    elseif (itemchance < 40) then
		   	    item = 5388;  -- Assasins Drink (magic acc)
		    elseif (itemchance < 50) then
		   	    item = 5386;  -- Fighters Drink (melee Acc)
		    elseif (itemchance < 60) then
		   	    item = 5385;  -- Barbarians Drink (Attack Power)
			else
                item = commondrop
			end
        end
    end

	if ((npcID >= 17076588 and npcID <= 17076589) or (npcID == 17080595 or npcID == 17080598) or
        (npcID >= 17084425 and npcID <= 17084426) or (npcID >= 17088818 and npcID <= 17088819)) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = 5735;
		end
	end
	return item;
end

function salvageScaler(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100);
  -- Global because mobs are too defensive at the moment when porting up
    mob:addMod(dsp.mod.DEFP, -10);
    mob:addMod(dsp.mod.EVA, -20);


end

function salvageRampart(mob,target)
    local mobID = mob:getID();
	-- Zhalyom Remnants
	if (mobID == 17076515) then  --Floor 5 South
	    mob:setLocalVar("SpawnID",17076670);
		mob:setLocalVar("NmID",17076558);
	end
end

function salvageAmbient(mob,player)

	local salvagelvl = player:getVar("Salvage_Level");
	local salvagefloor = 0;
	local playerzone = player:getZoneID();
    local factor = 0.82

	local multiplier = AMBIENCE_MULT;
	local additive = 0;
	if (playerzone == 73) then
	    salvagefloor = player:getVar("Zhayolm_Floor");
	elseif (playerzone == 74) then
	    salvagefloor = player:getVar("Arrapago_Floor");
	elseif (playerzone == 75) then
	    salvagefloor = player:getVar("Bhaflau_Floor");
	elseif (playerzone == 76) then
	    salvagefloor = player:getVar("Silver_Floor");
	end
	printf("Salvage floor %s",salvagefloor);
	local lvldif = (mob:getMainLvl() - player:getMainLvl());
	local ambpts = player:getVar("Ambience_Points");

	additive = math.random(95,110);
    if (mob:getPool() == 218 or mob:getPool() == 219) then  -- bonus to gears
        additive = math.random(115,125);
    end


    local ambience = math.floor(((((lvldif * 2) + additive) * multiplier)) * (factor ^ (10 - lvldif)));

    -- Increase required ambience points based on floor
    local ambscap = 1000 + (salvagefloor * 500)
    if (player:getObjType() == dsp.objType.PC) then
        local ambiencetot = ambpts + ambience;
        player:setVar("Ambience_Points", ambiencetot);
        if (player:getVar("Ambience_Points") >= ambscap) then
	        ambiencetot = ambiencetot - ambscap;
	        player:setVar("Ambience_Points",ambiencetot);
	        salvagelvl = salvagelvl + 1;
            if (playerzone == 73 or playerzone == 74) then
	            if (salvagefloor == 1) and (salvagelvl > 25) then
	                salvagelvl = 25;
	            elseif (salvagefloor == 2) and (salvagelvl > 35) then
	                salvagelvl = 35;
	            elseif (salvagefloor == 3) and (salvagelvl > 45) then
	                salvagelvl = 45;
	            elseif (salvagefloor == 4) and (salvagelvl > 55) then
	                salvagelvl = 55;
	            elseif (salvagefloor == 5) and (salvagelvl > 65) then
	                salvagelvl = 65;
	            elseif (salvagefloor == 6) and (salvagelvl > 75) then
	                salvagelvl = 75;
	            end
            elseif (playerzone == 75 or playerzone == 76) then
	            if (salvagefloor == 1) and (salvagelvl > 45) then
	                salvagelvl = 45;
	            elseif (salvagefloor == 2) and (salvagelvl > 55) then
	                salvagelvl = 55;
	            elseif (salvagefloor == 3) and (salvagelvl > 65) then
	                salvagelvl = 65;
	            elseif (salvagefloor == 4) and (salvagelvl > 75) then
	                salvagelvl = 75;
	            end
            end
			ambpts = player:getVar("Ambience_Points");
			player:PrintToPlayer(string.format("%s gains "..ambience.." Ambience Points ("..ambpts.."/"..ambscap..")", player:getName()), 0x15);
	        if (player:getObjType() == dsp.objType.PC) then
			    local duration = player:getStatusEffect(dsp.effect.LEVEL_RESTRICTION):getTimeRemaining();
				duration = duration / 1000;
				-- Check to see if players got healed
                local party = player:getParty()
                for _,member in ipairs(party) do
                    local mpamt = member:getMaxMP() - member:getMP()
                    local hpamt = member:getMaxHP() - member:getHP()
                    if (mpamt > 0 and hpamt > 0) then
                        restoreStats(player)
                        break
                    end
                end


	            player:PrintToPlayer("The dark energy has weakened around you.  You are now Level "..salvagelvl..".", 0x15);
	            player:setVar("Salvage_Level",salvagelvl);

	            player:addStatusEffect(dsp.effect.LEVEL_RESTRICTION,salvagelvl,3,duration);
	        end
		else
		    ambpts = player:getVar("Ambience_Points");
		    player:PrintToPlayer(string.format("%s gains "..ambience.." Ambience Points ("..ambpts.."/"..ambscap..")", player:getName()), 0x15);
        end
	end

end;

function checkSpawn(mob, player,killx, killy, killz, nm, chance, moblow, mobhigh, lvlmin, lvlmax)
	if (mob:getID() >= moblow and mob:getID() <= mobhigh) then
	if (player:getObjType() ~= dsp.objType.PC) then
	    local master = player:getMaster();
		local level = master:getVar("Salvage_Level");
		if (level >= 30 and level <= 35 and GetNPCByID(nm):getStatus() ~= dsp.status.NORMAL) then
            if (chance < math.random(0,99)) then
                master:PrintToPlayer("You feel an unknown presense...",0x15);
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(player);
            end
		else
            printf("Not of the correct level yet");
    	end
    else
        local plvl = player:getVar("Salvage_Level");
		if (plvl >= 30 and plvl <= 35 and GetNPCByID(nm):getStatus() ~= dsp.status.NORMAL) then
            if (chance < math.random(0,99)) then
	            if (player:getObjType() == dsp.objType.PC) then
                    player:PrintToPlayer("You feel an unknown presense...",0x15);
	            end
	            SpawnMob(nm):setPos(killx+1,killy,killz);
                GetMobByID(nm):updateClaim(player);
	        end
		else
		    printf("Not of the correct level yet");
        end
    end
    end
end

-- Settings for NM drops


-- ------------------------------ --
--       Bhaflau Remnants         --
-- ------------------------------ --



function gateWidow(player,npc)
    local item = 0;
    local mods = 0
    if (mob:getID() ~= 17084698) then
        mods = 4
    end

    local nmdrop = 14980;

    local pickdrop = math.random(1,2)
    if (pickdrop == 1) then
        nmdrop = 14980 -- Macha's Cuffs
    else
        nmdrop = 15640 -- Enlils Brayettes
    end

    local npcID = npc:getID();
    if (npcID >= 17084417 and npcID <= 17084421) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < nmblue - mods) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17084422 and npcID <= 17084424) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < nmred - (mods * 2)) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17084425 and npcID <= 17084426) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end

function zebra(player,npc)
    local item = 0;
    local mods = 0
    if (mob:getID() ~= 17084712) then
        mods = 4
    end

    local nmdrop = 14964;  -- Deimos Gauntles
    local pickdrop = math.random(1,2)
    if (pickdrop == 1) then
        nmdrop = 14964 -- Deimos Gauntles
    else
        nmdrop = 16091 -- Freya's Mask
    end


    local npcID = npc:getID();
    if (npcID >= 17084417 and npcID <= 17084421) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < nmblue - mods) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17084422 and npcID <= 17084424) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < nmred - (mods * 2)) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17084425 and npcID <= 17084426) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end


function peryton(player,npc)
    local item = 0;
    local mods = 0
    if (mob:getID() ~= 17084719) then
        mods = 4
    end

    local nmdrop = 14553;

    local pickdrop = math.random(1,2)
    if (pickdrop == 1) then
        nmdrop = 14553 -- Freya's Jerkin
    else
        nmdrop = 15640 -- Enlils Brayettes
    end

    local npcID = npc:getID();
    if (npcID >= 17084417 and npcID <= 17084421) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < nmblue - mods) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17084422 and npcID <= 17084424) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < nmred - (mods * 2)) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17084425 and npcID <= 17084426) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end


function pephredo(player,npc)
    local item = 0;
    local mods = 0
    if (mob:getID() ~= 17084705) then
        mods = 4
    end

    local nmdrop = 14553;

    local pickdrop = math.random(1,2)
    if (pickdrop == 1) then
        nmdrop = 14553 -- Freya's Mask
    else
        nmdrop = 15722 -- Hikazu Sune-Ate
    end

    local npcID = npc:getID();
    if (npcID >= 17084417 and npcID <= 17084421) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < nmblue - mods) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17084422 and npcID <= 17084424) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < nmred - (mods * 2)) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17084425 and npcID <= 17084426) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end



function salvageChestBBoss(mob, isKiller)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();


	local blue1 = GetNPCByID(17084417);
	local blue2 = GetNPCByID(17084418);
	local blue3 = GetNPCByID(17084419);
	local blue4 = GetNPCByID(17084420);
	local blue5 = GetNPCByID(17084421);
	local red1 = GetNPCByID(17084422);
	local red2 = GetNPCByID(17084423);
	local red3 = GetNPCByID(17084424);
	local gold1 = GetNPCByID(17084425);
	local gold2 = GetNPCByID(17084426);


    -- 1 = gateWidow
    -- 2 = zebra
    -- 3 = peryton
    -- 4 = pephredo
    -- 5 = Long Armed Charriot
    if (mob:getID() == 17084698) then
        nm = 1
    elseif (mob:getID() == 17084712) then
        nm = 2
    elseif (mob:getID() == 17084719) then
        nm = 3
    elseif (mob:getID() == 17084705) then
        nm = 4
    elseif (mob:getID() == 17084687) then
        nm = 5
    end


    -- Boss Always drops chest
    if (gold2:getStatus() ~= dsp.status.NORMAL) then
        gold2:setPos(killx+1,killy,killz);
        gold2:showNPC(60);
        gold2:setLocalVar("Boss",nm)
    elseif (gold1:getStatus() ~= dsp.status.NORMAL) then
        gold1:setPos(killx+1,killy,killz);
        gold1:showNPC(60);
        gold1:setLocalVar("Boss",nm)
    elseif (red3:getStatus() ~= dsp.status.NORMAL) then
        red3:setPos(killx+1,killy,killz);
        red3:showNPC(60);
        red3:setLocalVar("Boss",nm)
    elseif (red2:getStatus() ~= dsp.status.NORMAL) then
        red2:setPos(killx+1,killy,killz);
        red2:showNPC(60);
        red2:setLocalVar("Boss",nm)
    elseif (red1:getStatus() ~= dsp.status.NORMAL) then
        red1:setPos(killx+1,killy,killz);
        red1:showNPC(60);
        red1:setLocalVar("Boss",nm)
    elseif (blue5:getStatus() ~= dsp.status.NORMAL) then
        blue5:setPos(killx+1,killy,killz);
        blue5:showNPC(60);
        blue5:setLocalVar("Boss",nm)
    elseif (blue4:getStatus() ~= dsp.status.NORMAL) then
        blue4:setPos(killx+1,killy,killz);
        blue4:showNPC(60);
        blue4:setLocalVar("Boss",nm)
    elseif (blue3:getStatus() ~= dsp.status.NORMAL) then
        blue3:setPos(killx+1,killy,killz);
        blue3:showNPC(60);
        blue3:setLocalVar("Boss",nm)
    elseif (blue2:getStatus() ~= dsp.status.NORMAL) then
        blue2:setPos(killx+1,killy,killz);
        blue2:showNPC(60);
        blue2:setLocalVar("Boss",nm)
    elseif (blue1:getStatus() ~= dsp.status.NORMAL) then
        blue1:setPos(killx+1,killy,killz);
        blue1:showNPC(60);
        blue1:setLocalVar("Boss",nm)
    end
end


function longBowedChariot(player,npc)
    local item = 0;
    local mods = 0


    local nmdrop = 14553;

    local pickdrop = math.random(1,7)
    if (pickdrop == 1) then
        nmdrop = 14548 -- Phobos Cuirass
    elseif (pickdrop == 2) then
        nmdrop = 16086 -- Phobos  Mask
    elseif (pickdrop == 3) then
        nmdrop = 14975 -- Ea's Dastanas
    elseif (pickdrop == 4) then
        nmdrop = 15717 -- Freyr's Ledelsens
    elseif (pickdrop == 5) then
        nmdrop = 16102 -- Bodb's Crown
    elseif (pickdrop == 6) then
        nmdrop = 14564 -- Bodb's Robe
    else
        nmdrop = 15635 -- Tsukikazu Haidate
    end

    item = nmdrop

	return item;
end




-- ------------------------------ --
--          Silver Sea            --
-- ------------------------------ --

function salvageChestS(mob, isKiller)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();


	local blue1 = GetNPCByID(17088809);
	local blue2 = GetNPCByID(17088810);
	local blue3 = GetNPCByID(17088811);
	local blue4 = GetNPCByID(17088812);
	local blue5 = GetNPCByID(17088813);
	local blue6 = GetNPCByID(17088814);
	local red1 = GetNPCByID(17088815);
	local red2 = GetNPCByID(17088816);
	local red3 = GetNPCByID(17088817);
	local gold1 = GetNPCByID(17088818);
	local gold2 = GetNPCByID(17088819);

	-- Decide which chest to drop.
	-- Blue is low quality items
	-- red is HQ meds
	-- Gold is Alexandrite

	local chestdrop = math.random(1,100);
	local chesttype = math.random(1,100);
	-- Set chest frequency to 20%?
	printf("CEST FREQUENCY IS: %s",chestdrop);
	printf("CHEST TYPE IS: %s", chesttype);
	if (chestdrop <= 35) then
	    if (chesttype < 10) then
		    printf("GOLD");
	        if (gold1:getStatus() ~= dsp.status.NORMAL) then
	            gold1:setPos(killx+1,killy,killz);
	            -- gold1:setStatus(dsp.status.NORMAL);
				gold1:showNPC(60);
		    elseif (gold2:getStatus() ~= dsp.status.NORMAL) then
	            gold2:setPos(killx+1,killy,killz);
	            -- gold2:setStatus(dsp.status.NORMAL);
				gold2:showNPC(60);
            end
	    elseif (chesttype < 45) then
		    printf("red");
	        if (red1:getStatus() ~= dsp.status.NORMAL) then
	            red1:setPos(killx+1,killy,killz);
	            -- red1:setStatus(dsp.status.NORMAL);
				red1:showNPC(60);
		    elseif (red2:getStatus() ~= dsp.status.NORMAL) then
	            red2:setPos(killx+1,killy,killz);
	            -- red2:setStatus(dsp.status.NORMAL);
				red2:showNPC(60);
		    elseif (red3:getStatus() ~= dsp.status.NORMAL) then
	            red3:setPos(killx+1,killy,killz);
	            -- red3:setStatus(dsp.status.NORMAL);
				red3:showNPC(60);
            end
	    else
		    printf("BLUE");
	        if (blue1:getStatus() ~= dsp.status.NORMAL) then
	            blue1:setPos(killx+1,killy,killz);
	            -- blue1:setStatus(dsp.status.NORMAL);
				blue1:showNPC(60);
		    elseif (blue2:getStatus() ~= dsp.status.NORMAL) then
	            blue2:setPos(killx+1,killy,killz);
	            -- blue2:setStatus(dsp.status.NORMAL);
				blue2:showNPC(60);
		    elseif (blue3:getStatus() ~= dsp.status.NORMAL) then
	            blue3:setPos(killx+1,killy,killz);
	            -- blue3:setStatus(dsp.status.NORMAL);
				blue3:showNPC(60);
		    elseif (blue4:getStatus() ~= dsp.status.NORMAL) then
	            blue4:setPos(killx+1,killy,killz);
	           -- blue4:setStatus(dsp.status.NORMAL);
				blue4:showNPC(60);
		    elseif (blue5:getStatus() ~= dsp.status.NORMAL) then
	            blue5:setPos(killx+1,killy,killz);
	           -- blue5:setStatus(dsp.status.NORMAL);
				blue5:showNPC(60);
		    elseif (blue6:getStatus() ~= dsp.status.NORMAL) then
	            blue6:setPos(killx+1,killy,killz);
	            -- blue6:setStatus(dsp.status.NORMAL);
				blue5:showNPC(60);
            end
	    end
    end
end


function hammer(player,npc)
    local item = 0;
    local mods = 0

    local nmdrop = 16095; -- Hikazu Kabuto

    local npcID = npc:getID();
    if (npcID >= 17088809 and npcID <= 17088814) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmblue) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17088815 and npcID <= 17088817) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmred) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17088818 and npcID <= 17088819) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end

function powderkeg(player,npc)
    local item = 0;
    local mods = 0

    local nmdrop = 15644; -- Macha's Slops
    local pickdrop = math.random(1,2)
    if (pickdrop == 1) then
        nmdrop = 15644; -- Macha's Slops
    else
        nmdrop = 15634 -- Hoshikazu Hakama
    end

    local npcID = npc:getID();
    if (npcID >= 17088809 and npcID <= 17088814) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmblue) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17088815 and npcID <= 17088817) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmred) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17088818 and npcID <= 17088819) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end


function dekka(player,npc)
    local item = 0;
    local mods = 0

    local nmdrop = 15726 -- Enlil's Crackows
    local pickdrop = math.random(1,2)
    if (pickdrop == 1) then
        nmdrop = 15726 -- Enlil's Crackows
    else
        nmdrop = 15716 -- Njord's Ledelsens
    end

    local npcID = npc:getID();
    if (npcID >= 17088809 and npcID <= 17088814) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmblue) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17088815 and npcID <= 17088817) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmred) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17088818 and npcID <= 17088819) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end


function citadel(player,npc)
    local item = 0;
    local mods = 0

    local nmdrop = 14557 -- Hikazu Hara-Ate

    local pickdrop = math.random(1,2)
    if (pickdrop == 1) then
        nmdrop = 14557 -- Hikazu Hara-Ate
    else
        nmdrop = 16101 -- Nemain's Crown
    end

    local npcID = npc:getID();
    if (npcID >= 17088809 and npcID <= 17088814) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmblue) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17088815 and npcID <= 17088817) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmred) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17088818 and npcID <= 17088819) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end


function gyro(player,npc)
    local item = 0;
    local mods = 0


    local nmdrop = 15628;

    local pickdrop = math.random(1,4)
    if (pickdrop == 1) then
        nmdrop = 15628 -- Deimos's Cuisses
    elseif (pickdrop == 2) then
        nmdrop = 16085 -- Enyo's Mask
    elseif (pickdrop == 2) then
        nmdrop = 14974 -- Anu's Gages
    else
        nmdrop = 14968 -- Freya's Gloves
    end

    local npcID = npc:getID();
    if (npcID >= 17084417 and npcID <= 17084421) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmblue) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17084422 and npcID <= 17084424) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmred) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17084425 and npcID <= 17084426) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end

function donporoggo(player,npc)
    local item = 0;
    local mods = 0

    local nmdrop = 14547 -- Enyo's Breastplate
    local pickdrop = math.random(1,2)
    if (pickdrop == 1) then
        nmdrop = 14547 -- Enyo's Breastplate
    else
        nmdrop = 14563 -- Nemain's Robe
    end

    local npcID = npc:getID();
    if (npcID >= 17088809 and npcID <= 17088814) then -- Blue always Potions and Ethers based on floor
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmblue) then
			item = 5322; -- Healing Powder
		else
            item = nmdrop
		end
    end

    if (npcID >= 17088815 and npcID <= 17088817) then -- Red always HQ temp items and Alexandrite
	    local itemchance = math.random(1,100);
		if (itemchance < ssnmred) then
			item = 5436; -- Instant Reraise
		else
            item = nmdrop
        end
    end

	if (npcID >= 17088818 and npcID <= 17088819) then -- Gold
	    local itemchance = math.random(1,100);
		if (itemchance <= 100) then
		    item = nmdrop;
		end
	end
	return item;
end



function salvageChestSBoss(mob, isKiller)

    local killx = mob:getXPos();
    local killy = mob:getYPos();
    local killz = mob:getZPos();


	local blue1 = GetNPCByID(17084417);
	local blue2 = GetNPCByID(17084418);
	local blue3 = GetNPCByID(17084419);
	local blue4 = GetNPCByID(17084420);
	local blue5 = GetNPCByID(17084421);
	local red1 = GetNPCByID(17084422);
	local red2 = GetNPCByID(17084423);
	local red3 = GetNPCByID(17084424);
	local gold1 = GetNPCByID(17084425);
	local gold2 = GetNPCByID(17084426);

    local nm

    -- 1 = Gyro Gears
    -- 2 = Dekka
    -- 3 = Powderkeg
    -- 4 = Hammerblow
    -- 5 = Citadel
    -- 6 = Don Poroggo
    -- 7 = Long Armed Charriot
    if (mob:getID() == 17088717) then
        nm = 1
    elseif (mob:getID() == 17088595) then
        nm = 2
    elseif (mob:getID() == 17088557) then
        nm = 3
    elseif (mob:getID() == 17088617) then
        nm = 4
    elseif (mob:getID() == 17088785) then
        nm = 5
    elseif (mob:getID() == 17088786) then  --FIND!!!!
        nm = 6
    elseif (mob:getID() == 17088786) then
        nm = 7
    end

    -- Boss Always drops chest
    if (gold2:getStatus() ~= dsp.status.NORMAL) then
        gold2:setPos(killx+1,killy,killz);
        gold2:showNPC(60);
        gold2:setLocalVar("Boss",nm)
    elseif (gold1:getStatus() ~= dsp.status.NORMAL) then
        gold1:setPos(killx+1,killy,killz);
        gold1:showNPC(60);
        gold1:setLocalVar("Boss",nm)
    elseif (red3:getStatus() ~= dsp.status.NORMAL) then
        red3:setPos(killx+1,killy,killz);
        red3:showNPC(60);
        red3:setLocalVar("Boss",nm)
    elseif (red2:getStatus() ~= dsp.status.NORMAL) then
        red2:setPos(killx+1,killy,killz);
        red2:showNPC(60);
        red2:setLocalVar("Boss",nm)
    elseif (red1:getStatus() ~= dsp.status.NORMAL) then
        red1:setPos(killx+1,killy,killz);
        red1:showNPC(60);
        red1:setLocalVar("Boss",nm)
    elseif (blue5:getStatus() ~= dsp.status.NORMAL) then
        blue5:setPos(killx+1,killy,killz);
        blue5:showNPC(60);
        blue5:setLocalVar("Boss",nm)
    elseif (blue4:getStatus() ~= dsp.status.NORMAL) then
        blue4:setPos(killx+1,killy,killz);
        blue4:showNPC(60);
        blue4:setLocalVar("Boss",nm)
    elseif (blue3:getStatus() ~= dsp.status.NORMAL) then
        blue3:setPos(killx+1,killy,killz);
        blue3:showNPC(60);
        blue3:setLocalVar("Boss",nm)
    elseif (blue2:getStatus() ~= dsp.status.NORMAL) then
        blue2:setPos(killx+1,killy,killz);
        blue2:showNPC(60);
        blue2:setLocalVar("Boss",nm)
    elseif (blue1:getStatus() ~= dsp.status.NORMAL) then
        blue1:setPos(killx+1,killy,killz);
        blue1:showNPC(60);
        blue1:setLocalVar("Boss",nm)
    end
end


function longArmedChariot(player,npc)
    local item = 0;
    local mods = 0

    local nmdrop = 16090 -- Freyr's Mask

    local pickdrop = math.random(1,6)
    if (pickdrop == 1) then
        nmdrop = 14552 -- Freyr's Jerkin
    elseif (pickdrop == 2) then
        nmdrop = 14963 -- Phobos's Gauntlets
    elseif (pickdrop == 3) then
        nmdrop = 14979 -- Bodb's Cuffs
    elseif (pickdrop == 4) then
        nmdrop = 15639 -- Ea's Brais
    elseif (pickdrop == 5) then
        nmdrop = 15721 -- Tsukikazu Sune-Ate
    else
        nmdrop = 16090 -- Freyr's Mask
    end

    item = nmdrop

	return item;
end




