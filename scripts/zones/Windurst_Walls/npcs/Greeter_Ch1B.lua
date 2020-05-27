-----------------------------------
--	Area: Windurst Walls
--	NPC:  Greeter Moogle
--  Rewards for Genbu thru Byakko
--	Working 100%
-----------------------------------

require("scripts/globals/settings");
local ID = require("scripts/zones/Windurst_Walls/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local jetton = player:getCurrency("jetton");
    -- First lets see what wins the player has
    local genbu = player:getVar("Genbu_Win");
	local suzaku = player:getVar("Suzaku_Win");

	local seiryu = player:getVar("Seiryu_Win");
	local byakko = player:getVar("Byakko_Win");



	if ((genbu == 1) or (suzaku == 1) or (seiryu == 1) or (byakko == 1)) then
	player:PrintToPlayer("Greeter Moogle : Lets see what we got here...", 0xD);
	player:startEvent(0x210,10,jetton,1500,1750,2000,2250,170,0);
	else
	player:PrintToPlayer("Greeter Moogle : Sorry, I can't help you at this time.", 0xD);
	end


	-- player:PrintToPlayer("Daruru : Here you go, enjoy your new weapon!", 0xD);

	-- Find the other numbers!!!!
	-- 191 is 4  option 25 and 26
	-- 190 is 1,4
	-- 234 is 1,2,3
	-- 170 1,2,3,4

	-- 1st choice = Option 1/2
	-- 2nd choice = option
	-- 3rd choice = option 17/18
    -- 4th choice = option 25/26

	-- Decide what menu to display


end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
  printf("CSID: %u",csid);
  printf("RESULT: %u",option);

  -- Menu 1
    local m1a1 = 613;
	local m1a2 = 613;
	local m1a3 = 613;
	local m1a4 = 613;
	local m1a5 = 613;
	local m1a6 = 613;
	local m1a7 = 613;
	local m1a8 = 613;
	local m1a9 = 613;
	local m1a10 = 613;

  -- Menu 2
    local m2a1 = 613;
	local m2a2 = 613;
	local m2a3 = 613;
	local m2a4 = 613;
	local m2a5 = 613;
	local m2a6 = 613;
	local m2a7 = 613;
	local m2a8 = 613;
	local m2a9 = 613;
	local m2a10 = 613;

  -- Menu 3
    local m3a1 = 613;
	local m3a2 = 613;
	local m3a3 = 613;
	local m3a4 = 613;
	local m3a5 = 613;
	local m3a6 = 613;
	local m3a7 = 613;
	local m3a8 = 613;
	local m3a9 = 613;
	local m3a10 = 613;

  -- Menu 4
    local m4a1 = 613;
	local m4a2 = 613;
	local m4a3 = 613;
	local m4a4 = 613;
	local m4a5 = 613;
	local m4a6 = 613;
	local m4a7 = 613;
	local m4a8 = 613;
	local m4a9 = 613;
	local m4a10 = 613;


-- First lets see what wins the player has
    local genbu = player:getVar("Genbu_Win");
	local suzaku = player:getVar("Suzaku_Win");

	local seiryu = player:getVar("Seiryu_Win");
	local byakko = player:getVar("Byakko_Win");


-- List the items if they have won


	if (genbu == 1) then
	    m1a1 = 1404;  -- Seal of Genbu
        m1a2 = 1326;  -- Aquarian Abjuration Hands
	    m1a3 = 1324;  -- Aquarian Abjuration Head
	    m1a4 = 1331;  -- Martial Abjuration Hands
	    m1a5 = 1338;  -- Wyrmal Abjuration Feet
	    m1a6 = 12434;  -- Genbu's Kabuto
	    m1a7 = 12296;  -- Genbu's Shield
	    m1a8 = 18161;  -- Actic Wind
	    m1a9 = 722;  -- Divine Log
	    m1a10 = 655; -- Adaman Ingot
	end

    if (suzaku == 1) then
		m2a1 = 1407;  -- Seal of Suzaku
        m2a2 = 1327;  -- Aquarian Abjuration Legs
	    m2a3 = 1316;  -- Dryadic Abjuration Hands
	    m2a4 = 1319;  -- Earthen Abjuration Head
	    m2a5 = 1343;  -- Neptunal Abjuration Feet
	    m2a6 = 12946;  -- Suzaku Sun Ate
	    m2a7 = 18043;  -- Suzaku's Scythe
	    m2a8 = 18164;  -- Antarctic Wind
	    m2a9 = 1313;  -- Siren's Hair
	    m2a10 = 836; -- Damascene Cloth
    end

	if (seiryu == 1) then
        m3a1 = 1405;  -- Seal of Seiryu
	    m3a2 = 1327;  -- Aquarian Abjuration Legs
	    m3a3 = 1314;  -- Dryadic Aburation Head
	    m3a4 = 1329;  -- Martial Abjuration Head
	    m3a5 = 1336;  -- Wyrmal Abjuration Hands
	    m3a6 = 12690;  -- Seiry's Kote
	    m3a7 = 17659;  -- Seiryu's Sword
	    m3a8 = 18162;  -- East Wind
	    m3a9 = 4272;  -- Dragon Meat
	    m3a10 = 903;  -- Dragon Talon
    end

    if (byakko == 1) then
        m4a1 = 1406;  -- Seal of Byakko
	    m4a2 = 1324;  -- Aquarian Abjuration Head
	    m4a3 = 1317;  -- Dryadic Abjuration Legs
	    m4a4 = 1323;  -- Earthen Abjuration Feet
	    m4a5 = 1341;  -- Neptunal Abjuration Hands
	    m4a6 = 12818;  -- Byakko's Haidate
	    m4a7 = 18198;  -- Byakko's Axe
	    m4a8 = 18163;  -- Zephyr
	    m4a9 = 860;  -- Behemoth Hide
	    m4a10 = 658; -- Damascus Ingot
    end

 -- Choice 1
	if (option == 1) then
	    player:updateEvent(m1a1,m1a2,m1a3,m1a4,m1a5,m1a6,m1a7,m1a8);
	end

	if (option == 2) then
	   player:updateEvent(m1a9,m1a10,699050,1500);
	end

 -- Choice 2
	if (option == 9) then
	    player:updateEvent(m2a1,m2a2,m2a3,m2a4,m2a5,m2a6,m2a7,m2a8);
	end

	if (option == 10) then
	   player:updateEvent(m2a9,m2a10,699050,1750);
	end

 -- Choice 3
	if (option == 17) then
	    player:updateEvent(m3a1,m3a2,m3a3,m3a4,m3a5,m3a6,m3a7,m3a8);
	end

	if (option == 18) then
	   player:updateEvent(m3a9,m3a10,699050,2000);
	end

  -- Choice 4
	if (option == 25) then
	    player:updateEvent(m4a1,m4a2,m4a3,m4a4,m4a5,m4a6,m4a7,m4a8);
	end

	if (option == 26) then
	   player:updateEvent(m4a9,m4a10,699050,2250);
	end

  -----------------------------------
  --          Chocies              --
  -----------------------------------


    -- *Genbu
	-- Seal of Genbu
    if (option == 2051) and (genbu == 1) then
	    if (player:hasItem(1404) == false) then
           player:addItem(1404,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1404,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Seal of Aquarian Abj hands
    elseif (option == 2115) and (genbu == 1) then
	    if (player:hasItem(1326) == false) then
           player:addItem(1326,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1326,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Head
    elseif (option == 2179) and (genbu == 1) then
	    if (player:hasItem(1324) == false) then
           player:addItem(1324,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1324,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Martial Abjuration Hands
    elseif (option == 2243) and (genbu == 1) then
	    if (player:hasItem(1331) == false) then
           player:addItem(1331,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1331,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	--Wyrmal Abjuration Feet
    elseif (option == 2307) and (genbu == 1) then
	    if (player:hasItem(1338) == false) then
           player:addItem(1338,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1338,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Genbu's Kabuto
    elseif (option == 2371) and (genbu == 1) then
	    if (player:hasItem(12434) == false) then
           player:addItem(12434,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,12434,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Genbus Shield
    elseif (option == 2435) and (genbu == 1) then
	    if (player:hasItem(12296) == false) then
           player:addItem(12296,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,12296,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Arctic Wind
    elseif (option == 2499) and (genbu == 1) then
	    if (player:hasItem(18161) == false) then
           player:addItem(18161,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,18161,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Divine Log
    elseif (option == 2563) and (genbu == 1) then
	    if (player:hasItem(722) == false) then
           player:addItem(722,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,722,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Seal of Genbu
    elseif (option == 2627) and (genbu == 1) then
	    if (player:hasItem(655) == false) then
           player:addItem(655,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,655,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (genbu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end


    -- *Suzaku
	-- Seal of Suzaku
    if (option == 2059) and (suzaku == 1) then
	    if (player:hasItem(1407) == false) then
           player:addItem(1407,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1407,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2059) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Legs
    elseif (option == 2123) and (suzaku == 1) then
	    if (player:hasItem(1327) == false) then
           player:addItem(1327,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1327,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2123) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dryadic Abjuration Hands
    elseif (option == 2187) and (suzaku == 1) then
	    if (player:hasItem(1316) == false) then
           player:addItem(1316,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1316,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2187) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Earthen Abjuration Head
    elseif (option == 2251) and (suzaku == 1) then
	    if (player:hasItem(1319) == false) then
           player:addItem(1319,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1319,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2251) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Neptunal Abjuration Feet
    elseif (option == 2315) and (suzaku == 1) then
	    if (player:hasItem(1343) == false) then
           player:addItem(1343,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1343,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2315) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Suzaku Sun Ate
    elseif (option == 2379) and (suzaku == 1) then
	    if (player:hasItem(12946) == false) then
           player:addItem(12946,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,12946,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2379) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Suzaku's Scythe
    elseif (option == 2443) and (suzaku == 1) then
	    if (player:hasItem(18043) == false) then
           player:addItem(18043,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,18043,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2443) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Antarctic Wind
    elseif (option == 2507) and (suzaku == 1) then
	    if (player:hasItem(18164) == false) then
           player:addItem(18164,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,18164,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2507) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Siren's Hair
    elseif (option == 2571) and (suzaku == 1) then
	    if (player:hasItem(1313) == false) then
           player:addItem(1313,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1313,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2571) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Damascene Cloth
    elseif (option == 2635) and (suzaku == 1) then
	    if (player:hasItem(836) == false) then
           player:addItem(836,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,836,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2635) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 1750);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end




 -- *Seiryu
	-- Seal of Seiryu
    if (option == 2067) and (seiryu == 1) then
	    if (player:hasItem(1405) == false) then
           player:addItem(1405,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1405,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2067) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Legs
    elseif (option == 2131) and (seiryu == 1) then
	    if (player:hasItem(1327) == false) then
           player:addItem(1327,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1327,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2131) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dryadic Abjuration Head
    elseif (option == 2195) and (seiryu == 1) then
	    if (player:hasItem(1314) == false) then
           player:addItem(1314,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1314,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2195) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Martial Abjuration Head
    elseif (option == 2259) and (seiryu == 1) then
	    if (player:hasItem(1329) == false) then
           player:addItem(1329,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1329,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2259) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Wyrmal Abjuration Head
    elseif (option == 2323) and (seiryu == 1) then
	    if (player:hasItem(1336) == false) then
           player:addItem(1336,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1336,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2323) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Seiryu's Kote
    elseif (option == 2387) and (seiryu == 1) then
	    if (player:hasItem(12690) == false) then
           player:addItem(12690,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,12690,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2387) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Seiryu's Sword
    elseif (option == 2451) and (seiryu == 1) then
	    if (player:hasItem(17659) == false) then
           player:addItem(17659,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,17659,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2451) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Eastern Wind
    elseif (option == 2515) and (seiryu == 1) then
	    if (player:hasItem(18162) == false) then
           player:addItem(18162,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,18162,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2515) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dragon Meat
    elseif (option == 2579) and (seiryu == 1) then
	    if (player:hasItem(4272) == false) then
           player:addItem(4272,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,4272,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2579) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dragon Talon
    elseif (option == 2643) and (seiryu == 1) then
	    if (player:hasItem(903) == false) then
           player:addItem(903,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,903,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2643) and (seiryu == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end



-- *Byakko
	-- Seal of Byakko
    if (option == 2075) and (byakko == 1) then
	    if (player:hasItem(1406) == false) then
           player:addItem(1406,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1406,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2075) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Head
    elseif (option == 2139) and (byakko == 1) then
	    if (player:hasItem(1324) == false) then
           player:addItem(1324,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1324,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2139) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dryadic Abjuration Legs
    elseif (option == 2203) and (byakko == 1) then
	    if (player:hasItem(1317) == false) then
           player:addItem(1317,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1317,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2203) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Earthen Feet
    elseif (option == 2267) and (byakko == 1) then
	    if (player:hasItem(1323) == false) then
           player:addItem(1323,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1323,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2267) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Neptunal Abjuration Hands
    elseif (option == 2331) and (byakko == 1) then
	    if (player:hasItem(1341) == false) then
           player:addItem(1341,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1341,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2331) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Byakko's Haidate
    elseif (option == 2395) and (byakko == 1) then
	    if (player:hasItem(12818) == false) then
           player:addItem(12818,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,12818,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2395) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Byakko's Axe
    elseif (option == 2459) and (byakko == 1) then
	    if (player:hasItem(18198) == false) then
           player:addItem(18198,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,18198,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2459) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Zephyr
    elseif (option == 2523) and (byakko == 1) then
	    if (player:hasItem(18163) == false) then
           player:addItem(18163,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,18163,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2523) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Behemoth Hide
    elseif (option == 2587) and (byakko == 1) then
	    if (player:hasItem(860) == false) then
           player:addItem(860,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,860,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2587) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dragon Talon
    elseif (option == 2651) and (byakko == 1) then
	    if (player:hasItem(658) == false) then
           player:addItem(658,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,658,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2651) and (byakko == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 2250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end


  -- 2139
  -- 2203
  -- 2267
  -- 2331
  -- 2395
  -- 2459
  -- 2523
  -- 2587
  -- 2651







  -- if (option == 2499) and (ulli == 1) then
    --   player:addItem(1423,1);
	 --  player:messageSpecial(ITEM_OBTAINED,1423);
	-- end

   --
   -- 1706   51370  46250
   -- 2730 1 thru 7
   -- Betweem 2730 and 3242?
   -- 10922 (1024 x 8 + 2730)
   -- 33450
   -- 39082
   -- 2730  is 1 thru 7  8192
   -- 10922 is 1-8    32768
   -- 43690 is 1 thru 9  131072 2^17
   -- 174,762 is 1 thru 10 with space 524288
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
  printf("CSID: %u",csid);
  printf("RESULT: %u",option);
end;


