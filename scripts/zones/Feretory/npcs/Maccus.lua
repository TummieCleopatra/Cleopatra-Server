-----------------------------------
-- Area: Ferretory
-- NPC: Maccus
-- Grants Aura Quests (aura is like fame)
-----------------------------------

-----------------------------------

local ID = require("scripts/zones/Feretory/IDs");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

local balance = 0;
local quest11 = 20000;
local quest12 = 30000;
local quest13 = 60000;
local pinfamy = player:getCurrency("infamy");

if (trade:hasItemQty( 613, 1 )) and (player:getVar("FerretoryQuest75noaura") == 11) then
    if (pinfamy >= quest11) then
    player:delCurrency("infamy", quest11);
    player:tradeComplete();
	player:PrintToPlayer("Your infamy cap and bonus multiplier have increased.  You can now access Achievement NPC's!", 0x15);
	player:setVar("infamymult",200);
	player:setVar("infamycap",30000);
	player:setVar("FerretoryQuest75",12); -- New Non Aura Quests
	else
    balance = quest11 - pinfamy;
    player:PrintToPlayer( "Macus : I'm sorry, you need "..balance.." more infamy.", 0xD);
    end
end

if (trade:hasItemQty(1419, 1 )) or (trade:hasItemQty(1421, 1)) or (trade:hasItemQty(1423, 1)) or (trade:hasItemQty(1425, 1)) and (player:getVar("FerretoryQuest75") == 12) then
    if (pinfamy >= quest12) then
    player:delCurrency("infamy", quest12);
    player:tradeComplete();
	player:PrintToPlayer("Your infamy cap has increased to 60,000!", 0x15);
	player:setVar("infamycap",60000);
	player:setVar("FerretoryQuest75",13); -- New Non Aura Quests
    pinfamy = pinfamy - quest12
    player:setCurrency("infamy",pinfamy)
	else
    balance = quest12 - pinfamy;
    player:PrintToPlayer( "Macus : I'm sorry, you need "..balance.." more infamy.", 0xD);
    end
end

if ((trade:getGil() == 300000) and player:getVar("FerretoryQuest75") == 13) then
    if (pinfamy >= quest13) then
    player:delCurrency("infamy", quest12);
    player:tradeComplete();
	player:PrintToPlayer("You can now summon a 5th Trust!", 0x15);
    player:setVar("Trustsize",2);
	player:setVar("FerretoryQuest75",14); -- New Non Aura Quests
	else
    balance = quest12 - pinfamy;
    player:PrintToPlayer( "Macus : I'm sorry, you need "..balance.." more infamy.", 0xD);
    end
end



end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local aura = player:getVar("FerretoryAura");
local plvl = player:getMainLvl();
local trustdyna = player:getVar("TrustDynamis");

    -- Retroactively Fix Feretory Quest 3 Nation Warp
	if (player:getVar("Aura3WarpUnlock") ~= 1 and (player:getVar("FerretoryAura") >= 3)) then
	player:setVar("Aura3WarpUnlock",1);
	player:PrintToPlayer("All outpost warps except Tu'Lia and Tavnazia have been unlocked!", 0x15);
	end

    -- Retroactively Fix Feretory Caps
    if (player:getVar("FerretoryQuest75") == 12) then
        player:setVar("infamycap",30000);
    elseif (player:getVar("FerretoryQuest75") == 13) then
        player:setVar("infamycap",60000)
    end

    -- Fix 5th Trust quest set to wrong variable
    if (player:getVar("Trustsize") == 2 and player:getVar("FerretoryQuest75") == 13) then
        player:setVar("FerretoryQuest75",14);
    end


    if (player:getNation() == 0) and (trustdyna ~= 1) and (player:hasCompletedMission(SANDORIA,dsp.mission.id.sandoria.THE_SHADOW_LORD) == true) then
    player:PrintToPlayer("You may now summon Trusts inside Dynamis!", 0xD);
	player:setVar("TrustDynamis",1);
    elseif (player:getNation() == 1) and (trustdyna ~= 1) and (player:hasCompletedMission(BASTOK,dsp.mission.id.bastok.XARCABARD_LAND_OF_TRUTHS) == true) then
    player:PrintToPlayer("You may now summon Trusts inside Dynamis!", 0xD);
	player:setVar("TrustDynamis",1);
    elseif (player:getNation() == 2) and (trustdyna ~= 1) and (player:hasCompletedMission(WINDURST,dsp.mission.id.windurst.THE_SHADOW_AWAITS) == true) then
    player:PrintToPlayer("You may now summon Trusts inside Dynamis!", 0xD);
	player:setVar("TrustDynamis",1);
    end

    if (aura >= 6 and player:getVar("Trustsize") < 1) then
        player:PrintToPlayer("You now have the ability to summon a 4th Trust!", 0x15);
        player:setVar("Trustsize",1)
    end






	---------------- Start Ferretory Quest #1 -------------------
    if (player:getVar("FerretoryPlantoidComplete") == 1) then
    player:PrintToPlayer("Maccus : You've done well!  I feel your Aura getting stronger", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryExp",2);  -- Allow Exp to be gained from Monster Type
	player:setVar("FerretoryAura",1);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);
	player:PrintToPlayer("You are now able to collect Infamy Points", 0x15);
	player:setVar("infamy",1);
	player:setVar("infamymult",0); -- Infamy Multiplier
	player:setVar("infamycap",10000); -- Infamy Cap
	player:setVar("FerretoryMageBoon",1);
	player:setVar("FerretoryMeleeBoon",1);
	player:setVar("FerretoryTankBoon",1);
	player:setVar("FerretoryPetBoon",1);

	elseif (player:getVar("FerretoryQuest1") == 1) and (player:getVar("FerretoryAura") ~= 1) then
	player:PrintToPlayer("Maccus : Defeat 15 experience yielding plantoid monsters and report back to me", 0xD);  -- give the task for the quest

	elseif (player:getVar("FerretoryAura") == 0) and (plvl > 9) then -- check for ferretory aura if it is 0 start the initial quest
	player:PrintToPlayer("NPC : Hey, I don't sense an aura on you.  If you do some tasks for me, your aura will increase", 0xD);
	player:setVar("FerretoryQuest1",1); -- enable the quest
	player:setVar("FerretoryPlantoid",15); -- set the quest monster number needed to defeat
	player:PrintToPlayer("Maccus : Defeat 15 experience yielding plantoid monsters and report back to me", 0xD);  -- give the task for the quest


	---------------- Start Ferretory Quest #2 -------------------

	elseif (player:getVar("FerretoryPlantoidComplete") == 2) then
    player:PrintToPlayer("Maccus : You've done well!  I feel your Aura getting stronger", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryExp",3);
	player:setVar("FerretoryAura",2);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);
	player:PrintToPlayer("Signet Staff is now available in Mogshop #8", 0x15);

	elseif (player:getVar("FerretoryAura") == 1) and (plvl < 20) and (player:getVar("FerretoryQuest1") == 1) then
	player:PrintToPlayer("Maccus : Come back when you are level 20 for your next assignment.", 0xD);  -- Level Check

	elseif (player:getVar("FerretoryAura") == 1) and (plvl > 19) and (player:getVar("FerretoryQuest1") == 1) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 30 experience yielding lizard monsters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",2); -- enable the quest
	player:setVar("FerretoryPlantoid",30); -- set the quest monster number needed to defeat

	elseif (player:getVar("FerretoryAura") == 1) and (plvl > 19) and (player:getVar("FerretoryPlantoid") > 0) then -- Provide Text that says you have work to do
	player:PrintToPlayer("Maccus : Remember, defeat 30 experience yielding lizard monsters and report back to me", 0xD);









	---------------- Start Ferretory Quest #3 -------------------
	elseif (player:getVar("FerretoryAura") == 2) and (plvl < 30) and (player:getVar("FerretoryQuest1") == 2) then
	player:PrintToPlayer("Maccus : Come back when you are level 30 for your next assignment.", 0xD);  -- Level Check

	elseif (player:getVar("FerretoryAura") == 2) and (plvl > 29) and (player:getVar("FerretoryQuest1") == 2) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 50 experience yielding bird type monsters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",3); -- enable the quest
	player:setVar("FerretoryPlantoid",50); -- set the quest monster number needed to defeat


	elseif (player:getVar("FerretoryPlantoidComplete") == 3) then
    player:PrintToPlayer("Maccus : You've done well!  Your Aura isn't so weak now", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryExp",4);
	player:setVar("FerretoryAura",3);
	player:setVar("Aura3WarpUnlock", 1);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);
	player:PrintToPlayer("New items are available in Mogshop #8", 0x15);
	player:PrintToPlayer("You may now summon the Auction House anywhere with @ah.  Taxes are higher outside cities.", 0x15);
	player:PrintToPlayer("All outpost warps except Tu'Lia and Tavnazia have been unlocked!", 0x15);




		---------------- Start Ferretory Quest #4 -------------------
	elseif (player:getVar("FerretoryAura") == 3) and (plvl < 40) and (player:getVar("FerretoryQuest1") == 3) then
	player:PrintToPlayer("Maccus : Come back when you are level 40 for your next assignment.", 0xD);  -- Level Check

	elseif (player:getVar("FerretoryAura") == 3) and (plvl > 39) and (player:getVar("FerretoryQuest1") == 3) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 75 experience yielding beast type monsters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",4); -- enable the quest
	player:setVar("FerretoryPlantoid",75); -- set the quest monster number needed to defeat


	elseif (player:getVar("FerretoryPlantoidComplete") == 4) then
    player:PrintToPlayer("Maccus : You've done well!  Keep up the hard work", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryExp",5);
	player:setVar("FerretoryAura",4);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);
	player:PrintToPlayer("New items are available in Mogshop #5 and $7", 0x15);




			---------------- Start Ferretory Quest #5 -------------------
	elseif (player:getVar("FerretoryPlantoidComplete") == 5) then
    player:PrintToPlayer("Maccus : You've done well!  Your Aura is strong now!", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryExp",6);
	player:setVar("FerretoryAura",5);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);
	player:PrintToPlayer("New items are available in Mogshop #5", 0x15);

	elseif (player:getVar("FerretoryAura") == 4) and (plvl < 50) and (player:getVar("FerretoryQuest1") == 4) then
	player:PrintToPlayer("Maccus : Come back when you are level 50 for your next assignment.", 0xD);  -- Level Check

	elseif (player:getVar("FerretoryAura") == 4) and (plvl > 49) and (player:getVar("FerretoryQuest1") == 4) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 100 experience yielding Amorph type monsters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",5); -- enable the quest
	player:setVar("FerretoryPlantoid",100); -- set the quest monster number needed to defeat



			---------------- Start Ferretory Quest #6 -------------------

	elseif (player:getVar("FerretoryPlantoidComplete") == 6) then
    player:PrintToPlayer("Maccus : You've done well!  Your Aura is strong now!", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryExp",7);
	player:setVar("FerretoryAura",6);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);
	player:PrintToPlayer("New items are available in Mogshop #5 and #7", 0x15);
    player:setVar("Trustsize",1);
    player:PrintToPlayer("You now have the ability to summon a 4th Trust!", 0x15);

	elseif (player:getVar("FerretoryAura") == 5) and (plvl < 60) and (player:getVar("FerretoryQuest1") == 5) then
	player:PrintToPlayer("Maccus : Come back when you are level 60 for your next assignment.", 0xD);  -- Level Check

	elseif (player:getVar("FerretoryAura") == 5) and (plvl > 59) and (player:getVar("FerretoryQuest1") == 5) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 125 experience yielding Vermin type mosnters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",6); -- enable the quest
	player:setVar("FerretoryPlantoid",125); -- set the quest monster number needed to defeat



			---------------- Start Ferretory Quest #7 -------------------

	elseif (player:getVar("FerretoryPlantoidComplete") == 7) then
    player:PrintToPlayer("Maccus : You passed all of my tests.  Come back at see me when you are level 75.", 0xD);
	player:setVar("FerretoryPlantoidComplete",0);
	player:setVar("FerretoryExp",8);
	player:setVar("FerretoryQuest75Exp",8); -- New Non Aura Quests
	player:setVar("FerretoryAura",7);
	aura = player:getVar("FerretoryAura");
	player:PrintToPlayer("Your Aura has reached Level "..aura.."!", 0x15);
	player:PrintToPlayer("New items are available in Mogshop #8", 0x15);

	elseif (player:getVar("FerretoryAura") == 6) and (plvl < 70) and (player:getVar("FerretoryQuest1") == 6) then
	player:PrintToPlayer("Maccus : Come back when you are level 70 for your next assignment.", 0xD);  -- Level Check

	elseif (player:getVar("FerretoryAura") == 6) and (plvl > 69) and (player:getVar("FerretoryQuest1") == 6) then -- check for level of player and aura level
	player:PrintToPlayer("Maccus : Defeat 150 experience yielding Aquan type monsters and report back to me", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest1",7); -- enable the quest
	player:setVar("FerretoryQuest75noaura",7);
	player:setVar("FerretoryPlantoid",150); -- set the quest monster number needed to defeat


	-- The next set of quests do not increase Feretory Aura, but rather increase the amount of infamy points that can be earned, increase the cap on infamy, and opens up other mobs to earn infamy from.
			---------------- Start Ferretory Quest #8 -------------------

	elseif (player:getVar("FerretoryLv75Complete") == 8) then
	player:PrintToPlayer("Maccus : Great Job.  While I can't raise your aura yet, you can have this..", 0xD);
	player:setVar("FerretoryLv75Complete",0);
	player:setVar("FerretoryQuest75Exp",9); -- New Non Aura Quests
	player:setVar("infamycap",20000);
	player:setVar("infamymult",25);
	player:PrintToPlayer("Your infamy cap has increased to 20,000 and you now have a bonus infamy multiplier!", 0x15);

	elseif (player:getVar("FerretoryQuest75Exp") == 8) and (plvl < 75) then
	player:PrintToPlayer("Maccus : Come back when you are level 75 for your next assignment.", 0xD);  -- Level Check
	elseif (player:getVar("FerretoryQuest75Exp") == 8) and (plvl > 74) then
	player:PrintToPlayer("Maccus : Defeat 75 experience yielding Undead and 75 Arcana.  I'll give you something special.", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest75noaura",8); -- enable the quest
	player:setVar("FerretoryUndead",75); -- set the quest monster number needed to defeat
	player:setVar("FerretoryArcana",75); -- set the quest monster number needed to defeat


				---------------- Start Ferretory Quest #9 -------------------


	elseif (player:getVar("FerretoryLv75Complete") == 9) then
	player:PrintToPlayer("Maccus : Great Job.  While I can't raise your aura yet, you can have this..", 0xD);
	player:setVar("FerretoryLv75Complete",0);
	player:setVar("FerretoryQuest75Exp",10); -- New Non Aura Quests
	player:setVar("infamymult",50);
	player:PrintToPlayer("Your bonus infamy multiplier has increased!", 0x15);

	elseif (player:getVar("FerretoryQuest75Exp") == 9) and (plvl > 74)  and (player:getVar("FerretoryQuest75noaura") == 8) then
	player:PrintToPlayer("Maccus : Defeat 125 experience yielding Demon or Dragon type monsters.  I'll give you a nice surpise.", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest75noaura",9); -- enable the quest
	player:setVar("FerretoryDragonDemon",125); -- set the quest monster number needed to defeat


				---------------- Start Ferretory Quest #10 -------------------

	elseif (player:getVar("FerretoryLv75Complete") == 10) then
	player:PrintToPlayer("Maccus : Great Job.  While I can't raise your aura yet, you can have this..", 0xD);
	player:setVar("FerretoryLv75Complete",0);
	player:setVar("FerretoryQuest75Exp",11); -- New Non Aura Quests
	player:setVar("infamymult",100);
	player:PrintToPlayer("Your bonus infamy multiplier has increased!", 0x15);


	elseif (player:getVar("FerretoryQuest75Exp") == 10) and (plvl > 74)  and (player:getVar("FerretoryQuest75noaura") == 9) then
	player:PrintToPlayer("Maccus : Defeat 200 experience yielding Beastmen.  I'll give you a nice surpise.", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest75noaura",10); -- enable the quest
	player:setVar("FerretoryBeastmen",200); -- set the quest monster number needed to defeat


			  ---------------- Start Ferretory Quest #11 -------------------
	elseif (player:getVar("FerretoryQuest75Exp") == 11) and (plvl > 74)  and (player:getVar("FerretoryQuest75noaura") == 10) then
	player:PrintToPlayer("Maccus : Want to be stronger?  Trade me a Faded Crystal and 20,000 infamy points", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest75noaura",11); -- enable the quest

				  ---------------- Start Ferretory Quest #12 -------------------
	elseif (player:getVar("FerretoryQuest75") == 12) and (plvl > 74) then
	player:PrintToPlayer("Maccus : To increase your max infamy, give me a Summerstone, Springstone, Winterstone, or Autumnstone and 30,000 infamy.", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest75noaura",12); -- enable the quest

				  ---------------- Start Ferretory Quest #13 -------------------
	elseif (player:getVar("FerretoryQuest75") == 13) and (plvl > 74) then
	player:PrintToPlayer("Maccus : To increase the maximum amount of Trusts you can summon, bring me 60,000 infamy and 200,000 gil.", 0xD);  -- give the task for the quest
	player:setVar("FerretoryQuest75noaura",13); -- enable the quest

	elseif (player:getVar("FerretoryAura") == 0) and (plvl < 10) then -- check for ferretory aura if it is 0 start the initial quest
	player:PrintToPlayer("NPC : Sorry, I can only help adventurers level 10 and above.", 0xD);
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



