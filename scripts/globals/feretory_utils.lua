
function feretoryKills(mob, player)
	local mobfamily = mob:getSystem();
    local lvldif = (mob:getMainLvl() - player:getMainLvl());
    local kill = player:getVar("FerretoryPlantoid");
	local killa = player:getVar("FerretoryUndead");
	local killb = player:getVar("FerretoryArcana");
	local killc = player:getVar("FerretoryDragonDemon");
	local killd = player:getVar("FerretoryBeastmen");
	local job = player:getMainJob();
	local ferretoryblmquest = player:getVar("FerretoryBLM"); -- turns quest on
	local ferretoryblmkills = player:getVar("FerretoryBLMkills"); -- sets kill number
	local multiplier = 2;  -- 2 is normal and 4 is double
	local infamy = player:getVar("Infamy");
	local playerlvl = player:getMainLvl();
	local moblvl = mob:getMainLvl();
	local infamycap = player:getVar("infamycap");
	local infamymult = player:getVar("infamymult");
	local newinfamymult = (infamymult / 100) + 1;


	-------------------- Ferretory Quest #1 (Plantoid) -----------------------

	if (mobfamily == 17) and (player:getVar("FerretoryQuest1") == 1) and (mob:checkBaseExp()) then  -- check for plantoid, check if quest is active, and check if the level difference is less than 10
		if  (player:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
		    player:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
		    kill = player:getVar("FerretoryPlantoid");
		    if (player:getVar("FerretoryPlantoid") > 0) then
		        player:PrintToPlayer("Aura Quest #1 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryPlantoidComplete",1);
		    end
		end
    end

	-------------------- Ferretory Quest #2 (Lizard) -----------------------

	if (mobfamily == 14) and (player:getVar("FerretoryQuest1") == 2) and (mob:checkBaseExp()) then  -- check for plantoid, check if quest is active, and check if the level difference is less than 10
		if  (player:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
		    player:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
		    kill = player:getVar("FerretoryPlantoid");
		    if (player:getVar("FerretoryPlantoid") > 0) then
		        player:PrintToPlayer("Aura Quest #2 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryPlantoidComplete",2);
		    end
		end
    end

	-------------------- Ferretory Quest #3 (Birds) -----------------------

	if (mobfamily == 8) and (player:getVar("FerretoryQuest1") == 3) and (mob:checkBaseExp()) then  -- check for Birds, check if quest is active, and check if the level difference is less than 10
		if  (player:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
    		player:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
	    	kill = player:getVar("FerretoryPlantoid");
		    if (player:getVar("FerretoryPlantoid") > 0) then
		        player:PrintToPlayer("Aura Quest #3 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryPlantoidComplete",3);
		    end
		end
    end

	-------------------- Ferretory Quest #4 (Beast) -----------------------

	if (mobfamily == 6) and (player:getVar("FerretoryQuest1") == 4) and (mob:checkBaseExp()) then  -- check for Birds, check if quest is active, and check if the level difference is less than 10
		if  (player:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
    		player:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
	    	kill = player:getVar("FerretoryPlantoid");
		    if (player:getVar("FerretoryPlantoid") > 0) then
		        player:PrintToPlayer("Aura Quest #4 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryPlantoidComplete",4);
		    end
		end
    end

	-------------------- Ferretory Quest #5 (Amorph) -----------------------

	if (mobfamily == 1) and (player:getVar("FerretoryQuest1") == 5) and (mob:checkBaseExp())then  -- check for Amorph, check if quest is active, and check if the level difference is less than 10
		if  (player:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
    		player:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
	    	kill = player:getVar("FerretoryPlantoid");
		    if (player:getVar("FerretoryPlantoid") > 0) then
		        player:PrintToPlayer("Aura Quest #5 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryPlantoid") < 1) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryPlantoidComplete",5);
		    end
		end
    end

	-------------------- Ferretory Quest #6 (Vermin) -----------------------

	if (mobfamily == 20) and (player:getVar("FerretoryQuest1") == 6) and (mob:checkBaseExp())then  -- check for Vermin, check if quest is active, and check if the level difference is less than 10
		if  (player:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
    		player:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
	    	kill = player:getVar("FerretoryPlantoid");
		    if (player:getVar("FerretoryPlantoid") > 0) then
		        player:PrintToPlayer("Aura Quest #6 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryPlantoidComplete",6);
		    end
		end
    end

	-------------------- Ferretory Quest #7 (Aquan) -----------------------

	if (mobfamily == 2) and (player:getVar("FerretoryQuest1") == 7) and (mob:checkBaseExp())then  -- check for Birds, check if quest is active, and check if the level difference is less than 10
		if  (player:getVar("FerretoryPlantoid")) > 0 then  -- if the kills needed are greater than 0
    		player:setVar("FerretoryPlantoid",kill - 1);  -- Subtract kill
	    	kill = player:getVar("FerretoryPlantoid");
		    if (player:getVar("FerretoryPlantoid") > 0) then
		        player:PrintToPlayer("Aura Quest #7 Objectives Remaining: " ..kill..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryPlantoid") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryPlantoidComplete",7);
		    end
		end
    end

    -------------------- Ferretory Quest #8 (Undead and Arcana) -----------------------
    if (mobfamily == 19) and (player:getVar("FerretoryQuest75Exp") == 8) and (mob:checkBaseExp())then
	    if (player:getVar("FerretoryUndead")) > 0 then -- if the kills needed are greater than 0
            player:setVar("FerretoryUndead",killa - 1); -- subtract kill
	    	killa = player:getVar("FerretoryUndead")
        	killb = player:getVar("FerretoryArcana");
		    if (player:getVar("FerretoryUndead")) > 0 then
		        player:PrintToPlayer("Feretory Quest #8 Objectives Remaining: Undead(" ..killa..")/Arcana(" ..killb.."),", 0x15);  -- Print objectives remaining
            elseif (player:getVar("FerretoryUndead") == 0) and (player:getVar("FerretoryArcana") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objectives.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryLv75Complete",8);
            end
		end
    elseif (mobfamily == 3) and (player:getVar("FerretoryQuest75Exp") == 8) and (mob:checkBaseExp())then
	    if (player:getVar("FerretoryArcana")) > 0 then -- if the kills needed are greater than 0
            player:setVar("FerretoryArcana",killb - 1); -- subtract kill
	    	killa = player:getVar("FerretoryUndead");
		    killb = player:getVar("FerretoryArcana");
		    if (player:getVar("FerretoryArcana")) > 0 then
		        player:PrintToPlayer("Feretory Quest #8 Objectives Remaining: Undead(" ..killa..")/Arcana(" ..killb.."),", 0x15);  -- Print objectives remaining
            elseif (player:getVar("FerretoryUndead") == 0) and (player:getVar("FerretoryArcana") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objectives.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryLv75Complete",8);
            end
		end
    end


	-------------------- Ferretory Quest #9 (Demon/Dragon) -----------------------

	if ((mobfamily == 9) or (mobfamily == 10)) and (player:getVar("FerretoryQuest75Exp") == 9) and (mob:checkBaseExp())then  -- check for Birds, check if quest is active, and check if the level difference is less than 10
		if  (player:getVar("FerretoryDragonDemon")) > 0 then  -- if the kills needed are greater than 0
		    player:setVar("FerretoryDragonDemon",killc - 1);  -- Subtract kill
		    killc = player:getVar("FerretoryDragonDemon");
		    if (player:getVar("FerretoryDragonDemon") > 0) then
		        player:PrintToPlayer("Feretory Quest #9 Objectives Remaining: " ..killc..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryDragonDemon") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryLv75Complete",9);
		    end
		end
    end

	-------------------- Ferretory Quest #10 (Beastmen) -----------------------

	if ((mobfamily == 7) and (player:getVar("FerretoryQuest75Exp") == 10) and (mob:checkBaseExp())) then
		if (player:getVar("FerretoryBeastmen")) > 0 then  -- if the kills needed are greater than 0
	    	player:setVar("FerretoryBeastmen",killd - 1);  -- Subtract kill
		    killd = player:getVar("FerretoryBeastmen");
		    if (player:getVar("FerretoryBeastmen") > 0) then
		        player:PrintToPlayer("Feretory Quest #10 Objectives Remaining: " ..killd..".", 0x15);  -- Print objectives remaining
		    elseif (player:getVar("FerretoryBeastmen") == 0) then  -- check to see kills have been completed
		        player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
		        player:setVar("FerretoryLv75Complete",10);
		    end
		end
    end





    -- Black Mage Ferretory Quest

    if (job == 4) and (player:getVar("FerretoryBLM") == 1) and (mobfamily == 11) then
	    if  (player:getVar("FerretoryBLMkills")) > 0 then
	        player:setVar("FerretoryBLMkills",ferretoryblmkills - 1);  -- Subtract kill
	        ferretoryblmkills = player:getVar("FerretoryBLMkills");
	        if (player:getVar("FerretoryBLMkills") > 0) then
	            player:PrintToPlayer("Grimoire Black Mage Quest #1 Objectives Remaining: " ..ferretoryblmkills..".", 0x15);  -- Print objectives remaining
	        elseif (player:getVar("FerretoryBLMkills") == 0) then  -- check to see kills have been completed
	            player:PrintToPlayer("You have completed your objective.  Please report to Maccus for your reward", 0x15);  -- Print message to player
	            player:setVar("FerretoryBLMQ1",1);
	            player:setVar("FerretoryBLM",0);
	        end
	    end
	end


    --  Infamy Point Calculations
    -- Check to see if they have finished the respective mob family quest.  Only get infamy based on mob families you've quested.
    if ((mobfamily == 17) and (player:getVar("FerretoryExp") > 1)) or ((mobfamily == 14) and (player:getVar("FerretoryExp") > 2)) or
    ((mobfamily == 8) and (player:getVar("FerretoryExp") > 3)) or ((mobfamily == 6) and (player:getVar("FerretoryExp") > 4)) or
    ((mobfamily == 1) and (player:getVar("FerretoryExp") > 5)) or ((mobfamily == 20) and (player:getVar("FerretoryExp") > 6)) or
    ((mobfamily == 2) and (player:getVar("FerretoryExp") > 7)) or ((mobfamily == 3) and (player:getVar("FerretoryQuest75Exp") > 8)) or
    ((mobfamily == 19) and (player:getVar("FerretoryQuest75Exp") > 8)) or ((mobfamily == 9) and (player:getVar("FerretoryQuest75Exp") > 9)) or
    ((mobfamily == 10) and (player:getVar("FerretoryQuest75Exp") > 9)) or ((mobfamily == 15) and (player:getVar("FerretoryQuest75Exp") > 10)) or
    ((mobfamily == 16) and (player:getVar("FerretoryQuest75Exp") > 10) or ((mobfamily == 7) and (player:getVar("FerretoryQuest75Exp") >= 11))) then
        if (infamy == 1) and (playerlvl <= 75) and (mob:checkBaseExp()) then -- check if infamy is turned on
            if (lvldif < -11) then  -- EP
                multiplier = 1.2;
            elseif (lvldif <= -3) then
                multiplier = 1.3;
            elseif (lvldif <= -1) then
                multiplier = 1.5;
            elseif (lvldif == 0) then
                multiplier = 1.7;
            elseif (lvldif <= 4) then
                multiplier = 2;
            elseif (lvldif == 5) then
                multiplier = 2.5;
            else
                multiplier = 2.7;
            end
        end
    end



    local infamypoints = math.floor(((lvldif + 25) * multiplier) * newinfamymult);
    infamypoints = math.floor(infamypoints / 2)
    player:addCurrency("infamy",infamypoints);
    if (player:getCurrency("infamy") > infamycap) then
        player:setCurrency("infamy",infamycap);
    end

    if (infamypoints > 0) then
        player:PrintToPlayer(string.format("%s gains "..infamypoints.." infamy points.", player:getName()), 0x15);
        -- player:PrintToPlayer(lvldif);
    else
        -- player:PrintToPlayer(infamypoints);
        -- player:PrintToPlayer(lvldif);
    end

end
