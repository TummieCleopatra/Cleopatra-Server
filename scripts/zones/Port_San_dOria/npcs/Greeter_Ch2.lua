-----------------------------------
--	Area: Windurst Walls
--	NPC:  Greeter Moogle
--  Rewards for Genbu thru Byakko
--	Working 100%
-----------------------------------

require("scripts/globals/settings");
local ID = require("scripts/zones/Port_San_dOria/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local zenni = player:getCurrency("zeni_point");
    -- First lets see what wins the player has
    local temper = player:getVar("Temper_Win");
	local fort = player:getVar("Fort_Win");
	local faith = player:getVar("Faith_Win");
	local justice = player:getVar("Justice_Win");
	local hope = player:getVar("Hope_Win");
	local prude = player:getVar("Prude_Win");
	local love = player:getVar("Love_Win");



	if ((temper == 1) or (fort == 1) or (faith == 1) or (justice == 1) or (hope == 1) or (prude == 1) or (love == 1)) then
	player:PrintToPlayer("Greeter Moogle : Lets see what we got here...", 0xD);
	player:startEvent(0x326,10,zenni,1250,2500,5000,10000,170,0);
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
    local temper = player:getVar("Temper_Win");
	local fort = player:getVar("Fort_Win");
	local faith = player:getVar("Faith_Win");
	local justice = player:getVar("Justice_Win");
	local hope = player:getVar("Hope_Win");
	local prude = player:getVar("Prude_Win");
	local love = player:getVar("Love_Win");


-- List the items if they have won


	if (temper == 1) then
	    m1a1 = 1850;  -- First Virtue
        m1a2 = 17948;  -- Temperance Axe
	    m1a3 = 15513;  -- Temperance Torque
	    m1a4 = 15471;  -- Merciful Cape
	    m1a5 = 15473;  -- Astute Cape
	end

    if (fort == 1) then
	    m1a6 = 1853;  -- Second Virtue
	    m1a7 = 18222;  -- Fortitude Axe
	    m1a8 = 15511;  -- Fortitude Torque
	    m1a9 = 15472;  -- Altrustic Cape
	end

    if (faith == 1) then
		m2a1 = 1856;  -- Third Virtue
        m2a2 = 18360;  -- Faith h2h
	    m2a3 = 15512;  -- Faith Torque
	    m2a4 = 14905;  -- Homama Hands
	    m2a5 = 15662;  -- Nashira Feet
    end

	if (hope == 1) then
	    m2a6 = 1848;  -- Forth Virtue
	    m2a7 = 17595;  -- Hope Staff
	    m2a8 = 15509;  -- Hope Torque
	    m2a9 = 15661;  -- Homam Feet
	    m2a10 = 14906; -- Nashira Hands
    end

	if (justice == 1) then
        m3a1 = 1847;  -- Fifthe Virtue
	    m3a2 = 17710;  -- Justice Sword
	    m3a3 = 15508;  -- Justice Torque
	    m3a4 = 15576;  -- Homam Legs
	    m3a5 = 15577;  -- nashira Legs
	end

	if (prude == 1) then
	    m3a6 = 1849;  -- Sixth Virtue
	    m3a7 = 18397;  -- Prudence Rod
	    m3a8 = 15510;  -- Prudence Torque
	    m3a9 = 15240;  -- Homam Head
	    m3a10 = 15241;  -- Nashira Head
    end

    if (love == 1) then
        m4a1 = 18100;  -- Love Halberd
	    m4a2 = 15514;  -- Love Torque
	    m4a3 = 14488;  -- Homam Body
	    m4a4 = 14489;  -- Nashira Body
	    m4a5 = 14808;  -- Novio Earring
		m4a6 = 14809;  -- Novia Earring

	end

    if (av == 1) then
	    m4a7 = 18198;  -- Novia Earring
	    m4a8 = 18163;  -- Zephyr
	    m4a9 = 860;  -- Behemoth Hide
	    m4a10 = 658; -- Damascus Ingot
    end

 -- Choice 1
	if (option == 1) then
	    player:updateEvent(m1a1,m1a2,m1a3,m1a4,m1a5,m1a6,m1a7,m1a8);
	end

	if (option == 2) then
	   player:updateEvent(m1a9,m1a10,699050,1250);
	end

 -- Choice 2
	if (option == 9) then
	    player:updateEvent(m2a1,m2a2,m2a3,m2a4,m2a5,m2a6,m2a7,m2a8);
	end

	if (option == 10) then
	   player:updateEvent(m2a9,m2a10,699050,2500);
	end

 -- Choice 3
	if (option == 17) then
	    player:updateEvent(m3a1,m3a2,m3a3,m3a4,m3a5,m3a6,m3a7,m3a8);
	end

	if (option == 18) then
	   player:updateEvent(m3a9,m3a10,699050,5000);
	end

  -- Choice 4
	if (option == 25) then
	    player:updateEvent(m4a1,m4a2,m4a3,m4a4,m4a5,m4a6,m4a7,m4a8);
	end

	if (option == 26) then
	   player:updateEvent(m4a9,m4a10,699050,10000);
	end

  -----------------------------------
  --          Chocies              --
  -----------------------------------


    -- *Genbu
	-- Seal of Genbu
    if (option == 2051) and (temper == 1) then
	    if (player:hasItem(m1a1) == false) then
           player:addItem(m1a1,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a1,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (temper == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Seal of Aquarian Abj hands
    elseif (option == 2115) and (temper == 1) then
	    if (player:hasItem(m1a2) == false) then
           player:addItem(m1a2,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a2,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (temper == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Head
    elseif (option == 2179) and (temper == 1) then
	    if (player:hasItem(m1a3) == false) then
           player:addItem(m1a3,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a3,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (temper == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Martial Abjuration Hands
    elseif (option == 2243) and (temper == 1) then
	    if (player:hasItem(m1a4) == false) then
           player:addItem(m1a4,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a4,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (temper == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	--Wyrmal Abjuration Feet
    elseif (option == 2307) and (temper == 1) then
	    if (player:hasItem(m1a5) == false) then
           player:addItem(m1a5,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a5,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (temper == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

	-- Fortitude

    elseif (option == 2371) and (fort == 1) then
	    if (player:hasItem(m1a6) == false) then
           player:addItem(m1a6,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a6,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (fort == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Genbus Shield
    elseif (option == 2435) and (fort == 1) then
	    if (player:hasItem(m1a7) == false) then
           player:addItem(m1a7,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a7,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (fort == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Arctic Wind
    elseif (option == 2499) and (fort == 1) then
	    if (player:hasItem(m1a8) == false) then
           player:addItem(m1a8,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a8,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (fort == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Divine Log
    elseif (option == 2563) and (fort == 1) then
	    if (player:hasItem(m1a9) == false) then
           player:addItem(m1a9,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a9,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (fort == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Seal of Genbu
    elseif (option == 2627) and (fort == 1) then
	    if (player:hasItem(m1a10) == false) then
           player:addItem(m1a10,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m1a10,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (fort == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 1250);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end


    -- Faith/Hope

    if (option == 2059) and (faith == 1) then
	    if (player:hasItem(m2a1) == false) then
           player:addItem(m2a1,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a1,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2059) and (faith == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Legs
    elseif (option == 2123) and (faith == 1) then
	    if (player:hasItem(m2a2) == false) then
           player:addItem(m2a2,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a2,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2123) and (faith == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dryadic Abjuration Hands
    elseif (option == 2187) and (faith == 1) then
	    if (player:hasItem(m2a3) == false) then
           player:addItem(m2a3,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a3,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2187) and (faith == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Earthen Abjuration Head
    elseif (option == 2251) and (faith == 1) then
	    if (player:hasItem(m2a4) == false) then
           player:addItem(m2a4,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a4,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2251) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Neptunal Abjuration Feet
    elseif (option == 2315) and (suzaku == 1) then
	    if (player:hasItem(m2a5) == false) then
           player:addItem(m2a5,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a5,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2315) and (suzaku == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

	-----------------------------------
	--      Jailer of Hope          --
	-----------------------------------
    elseif (option == 2379) and (hope == 1) then
	    if (player:hasItem(m2a6) == false) then
           player:addItem(m2a6,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a6,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2379) and (hope == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Suzaku's Scythe
    elseif (option == 2443) and (hope == 1) then
	    if (player:hasItem(m2a7) == false) then
           player:addItem(m2a7,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a7,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2443) and (hope == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Antarctic Wind
    elseif (option == 2507) and (hope == 1) then
	    if (player:hasItem(m2a8) == false) then
           player:addItem(m2a8,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a8,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2507) and (hope == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Siren's Hair
    elseif (option == 2571) and (hope == 1) then
	    if (player:hasItem(m2a9) == false) then
           player:addItem(m2a9,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a9,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2571) and (hope == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Damascene Cloth
    elseif (option == 2635) and (hope == 1) then
	    if (player:hasItem(m2a10) == false) then
           player:addItem(m2a10,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m2a10,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2635) and (hope == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 2500);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end




    --------------------------------
	--     Jailer of Justice      --
	--------------------------------
    if (option == 2067) and (justice == 1) then
	    if (player:hasItem(m3a1) == false) then
           player:addItem(m3a1,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a1,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2067) and (justice == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Legs
    elseif (option == 2131) and (justice == 1) then
	    if (player:hasItem(m3a2) == false) then
           player:addItem(m3a2,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a2,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2131) and (justice == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dryadic Abjuration Head
    elseif (option == 2195) and (justice == 1) then
	    if (player:hasItem(m3a3) == false) then
           player:addItem(m3a3,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a3,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2195) and (justice == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Martial Abjuration Head
    elseif (option == 2259) and (justice == 1) then
	    if (player:hasItem(m3a4) == false) then
           player:addItem(m3a4,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a4,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2259) and (justice == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Wyrmal Abjuration Head
    elseif (option == 2323) and (justice == 1) then
	    if (player:hasItem(m3a5) == false) then
           player:addItem(m3a5,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a5,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2323) and (justice == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Seiryu's Kote
    elseif (option == 2387) and (prude == 1) then
	    if (player:hasItem(m3a6) == false) then
           player:addItem(m3a6,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a6,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2387) and (prude == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- prude's Sword
    elseif (option == 2451) and (prude == 1) then
	    if (player:hasItem(m3a7) == false) then
           player:addItem(m3a7,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a7,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2451) and (prude == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Eastern Wind
    elseif (option == 2515) and (prude == 1) then
	    if (player:hasItem(m3a8) == false) then
           player:addItem(m3a8,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a8,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2515) and (prude == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dragon Meat
    elseif (option == 2579) and (prude == 1) then
	    if (player:hasItem(m3a9) == false) then
           player:addItem(m3a9,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a9,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2579) and (prude == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dragon Talon
    elseif (option == 2643) and (prude == 1) then
	    if (player:hasItem(m3a10) == false) then
           player:addItem(m3a10,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m3a10,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2643) and (prude == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 5000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
	end



    ----------------------------------
	--     Jailer of Love          --
	----------------------------------

    if (option == 2075) and (love == 1) then
	    if (player:hasItem(m4a1) == false) then
           player:addItem(m4a1,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a1,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2075) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Head
    elseif (option == 2139) and (love == 1) then
	    if (player:hasItem(m4a2) == false) then
           player:addItem(m4a2,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a2,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2139) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dryadic Abjuration Legs
    elseif (option == 2203) and (love == 1) then
	    if (player:hasItem(m4a3) == false) then
           player:addItem(m4a3,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a3,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2203) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Earthen Feet
    elseif (option == 2267) and (love == 1) then
	    if (player:hasItem(m4a4) == false) then
           player:addItem(m4a4,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a4,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2267) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Neptunal Abjuration Hands
    elseif (option == 2331) and (love == 1) then
	    if (player:hasItem(m4a5) == false) then
           player:addItem(m4a5,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a5,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2331) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Byakko's Haidate
    elseif (option == 2395) and (love == 1) then
	    if (player:hasItem(m4a6) == false) then
           player:addItem(m4a6,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a6,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2395) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Byakko's Axe
    elseif (option == 2459) and (love == 1) then
	    if (player:hasItem(m4a7) == false) then
           player:addItem(m4a7,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a7,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2459) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Zephyr
    elseif (option == 2523) and (love == 1) then
	    if (player:hasItem(m4a8) == false) then
           player:addItem(m4a8,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a8,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2523) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Behemoth Hide
    elseif (option == 2587) and (love == 1) then
	    if (player:hasItem(m4a9) == false) then
           player:addItem(m4a9,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a9,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2587) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dragon Talon
    elseif (option == 2651) and (love == 1) then
	    if (player:hasItem(m4a10) == false) then
           player:addItem(m4a10,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,m4a10,1);
	       player:delCurrency("zeni_point", 10000);
           player:updateEvent(0);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2651) and (love == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEMS_OBTAINED,613,1);
	       player:delCurrency("zeni_point", 10000);
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
	 --  player:messageSpecial(ID.text.ITEM_OBTAINED,1423);
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



