-----------------------------------
--	Area: Port Bastok
--	NPC:  Greeter Moogle
--  Rewards for ZNM Paragon Chapter 3 Path 2
--	Working 100%
-----------------------------------

require("scripts/globals/settings");
local ID = require("scripts/zones/Port_Bastok/IDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
    local therion = player:getCurrency("therion_ichor");
    -- First lets see what wins the player has
    local t1nm1 = player:getVar("Brass_Borer_Win");
	local t1nm2 = player:getVar("Claret_Win");
	local t1nm3 = player:getVar("Ob_Win");

    local t2nm1 = player:getVar("Anantaboga_Win");
    local t2nm2 = player:getVar("Reacton_Win");
    local t3nm3 = player:getVar("Dextrose_Win");

    local t3nm1 = player:getVar("Nosferatu_Win");
    local t3nm2 = player:getVar("Khrom_Win");
    local t3nm3 = player:getVar("Achamoth_Win");

    local t4nm1 = player:getVar("Sarameya_Win");

    if ((t1nm1 == 1) or (t1nm2 == 1) or (t1nm3 == 1) or (t2nm1 == 1) or (t2nm2 == 1) or
	    (t2nm3 == 1) or (t3nm1 == 1) or (t3nm2 == 1) or (t3nm3 == 1) or (t4nm1 == 1)) then
		player:PrintToPlayer("Greeter Moogle : Lets see what we got here...", 0xD);
	    player:startEvent(0x1a9,10,therion,5000,10000,15000,25000,170,0);
	else
	    player:PrintToPlayer("Greeter Moogle : Sorry, I can't help you at this time.", 0xD);
	end
end






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

-- First lets see what wins the player has
    local t1nm1 = player:getVar("Brass_Borer_Win");
	local t1nm2 = player:getVar("Claret_Win");
	local t1nm3 = player:getVar("Ob_Win");

    local t2nm1 = player:getVar("Anantaboga_Win");
    local t2nm2 = player:getVar("Reacton_Win");
    local t3nm3 = player:getVar("Dextrose_Win");

    local t3nm1 = player:getVar("Nosferatu_Win");
    local t3nm2 = player:getVar("Khrom_Win");
    local t3nm3 = player:getVar("Achamoth_Win");

    local t4nm1 = player:getVar("Sarameya_Win");


	if (t1nm1 == 1) then
	    m1a1 = 17961;  -- Lion Tamer
        m1a2 = 15018;  -- Ritterhantzez
	    m1a3 = 2626;   -- Brass Borrer Cocoon
	end

	if (t1nm2 == 1) then
	    m1a4 = 18859;  -- Kerykeion
	    m1a5 = 16274;  -- Almah Torque
		m1a6 = 2627;   -- Claret Gloubule
	end

	if (t1nm3 == 1) then
	    m1a7 = 15999;  -- Guignol Earring
	    m1a8 = 8615;  -- Steam Jacket
		m1a9 = 2628;   -- Ob's Arm
	end

	-- Tier II
	if (t2nm1 == 1) then
	    m2a1 = 19109;  -- Trilling Dagger
        m2a2 = 18448;  -- Hacchonebutsu Dan
	    m2a3 = 2623;   -- Anantonboga's Heart
	end

	if (t2nm2 == 1) then
	    m2a4 = 19211;  -- Reacton Arm
	    m2a5 = 19028;  -- Magic Strap
		m2a6 = 2624;   -- Reactons Ashes
	end

	if (t2nm3 == 1) then
	    m2a7 = 18127;  -- Achille's Spear
	    m2a8 = 16338;  -- Ruby Seraweels
		m2a9 = 2625;   -- Dextros Bubbler
	end

	-- Tier III
	if (t3nm1 == 1) then
	    m3a1 = 17960;  -- Labrys
        m3a2 = 15021;  -- Aurum Gauntlets
	    m3a3 = 11378;  -- Enkidu's Leggings

	end

	if (t3nm2 == 1) then
	    m3a4 = 16176;  -- Simba Buckler
	    m3a5 = 15022;  -- Oracles Gloves
		m3a6 = 16343;  -- Enkidu's Subligar
	end

	if (t3nm3 == 1) then
	    m3a7 = 17753;  -- Oragnics
	    m3a8 = 16342;  -- Oracles Bracconi
		m3a9 = 11376;  -- Aurum Sabatons
	end

	if (t3nm1 == 1 and t3nm2 == 1 and t3nm3 == 1) then
		m3a10 = 2573; -- Monkey Wine
	end

	-- Tier IV
	if (t4nm1 == 1) then
	    m4a1 = 18497;  -- Foolkiller
        m4a2 = 18446;  -- Pachipachio
	    m4a3 = 16155;  -- Aurum Armet
	    m4a4 = 16156;  -- Oracles Cap
	    m4a5 = 11283;  -- Oracles Robe
		m4a6 = 16337;  -- Hachiryu Haidate
	    m4a7 = 2168;  -- Cerb Claw
	    m4a8 = 2169;  -- Cerb hide
		m4a9 = 5565;  -- Cerb Meat
		m4a10 = 2619;  -- Sarameya Hide
	end

 -- Choice 1
	if (option == 1) then
	    player:updateEvent(m1a1,m1a2,m1a3,m1a4,m1a5,m1a6,m1a7,m1a8);
	end

	if (option == 2) then
	   player:updateEvent(m1a9,m1a10,699050,5000);
	end

 -- Choice 2
	if (option == 9) then
	    player:updateEvent(m2a1,m2a2,m2a3,m2a4,m2a5,m2a6,m2a7,m2a8);
	end

	if (option == 10) then
	   player:updateEvent(m2a9,m2a10,699050,10000);
	end

 -- Choice 3
	if (option == 17) then
	    player:updateEvent(m3a1,m3a2,m3a3,m3a4,m3a5,m3a6,m3a7,m3a8);
	end

	if (option == 18) then
	   player:updateEvent(m3a9,m3a10,699050,15000);
	end

  -- Choice 4
	if (option == 25) then
	    player:updateEvent(m4a1,m4a2,m4a3,m4a4,m4a5,m4a6,m4a7,m4a8);
	end

	if (option == 26) then
	   player:updateEvent(m4a9,m4a10,699050,25000);
	end

 -----------------------------------
  --          Chocies              --
  -----------------------------------


    -- T1_NM1
    if (option == 2051) and (t1nm1 == 1) then
	    if (player:hasItem(m1a1) == false) then
           player:addItem(m1a1,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a1,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (t1nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t1nm1 == 1) then
	    if (player:hasItem(m1a2) == false) then
           player:addItem(m1a2,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a2,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t1nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t1nm1 == 1) then
	    if (player:hasItem(m1a3) == false) then
           player:addItem(m1a3,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a3,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t1nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T1_NM2 --
    elseif (option == 2243) and (t1nm2 == 1) then
	    if (player:hasItem(m1a4) == false) then
           player:addItem(m1a4,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a4,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (t1nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    elseif (option == 2307) and (t1nm2 == 1) then
	    if (player:hasItem(m1a5) == false) then
           player:addItem(m1a5,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a5,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (t1nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t1nm2 == 1) then
	    if (player:hasItem(m1a6) == false) then
           player:addItem(m1a6,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a6,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t1nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T1_NM3

    elseif (option == 2435) and (t1nm3 == 1) then
	    if (player:hasItem(m1a7) == false) then
           player:addItem(m1a7,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a7,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (t1nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t1nm3 == 1) then
	    if (player:hasItem(m1a8) == false) then
           player:addItem(m1a8,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a8,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t1nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t1nm3 == 1) then
	    if (player:hasItem(m1a9) == false) then
           player:addItem(m1a9,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a9,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t1nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t1nm3 == 1) then
	    if (player:hasItem(m1a10) == false) then
           player:addItem(m1a10,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m1a10,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t1nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 5000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    else
       -- player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	end

    -- T2_NM1
    if (option == 2051) and (t2nm1 == 1) then
	    if (player:hasItem(m2a1) == false) then
           player:addItem(m2a1,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a1,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (t2nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t2nm1 == 1) then
	    if (player:hasItem(m2a2) == false) then
           player:addItem(m2a2,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a2,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t2nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t2nm1 == 1) then
	    if (player:hasItem(m2a3) == false) then
           player:addItem(m2a3,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a3,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t2nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T2_NM2 --
    elseif (option == 2243) and (t2nm2 == 1) then
	    if (player:hasItem(m2a4) == false) then
           player:addItem(m2a4,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a4,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (t2nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    elseif (option == 2307) and (t2nm2 == 1) then
	    if (player:hasItem(m2a5) == false) then
           player:addItem(m2a5,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a5,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (t2nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t2nm2 == 1) then
	    if (player:hasItem(m2a6) == false) then
           player:addItem(m2a6,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a6,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t2nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T2_NM3

    elseif (option == 2435) and (t2nm3 == 1) then
	    if (player:hasItem(m2a7) == false) then
           player:addItem(m2a7,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a7,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (t2nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t2nm3 == 1) then
	    if (player:hasItem(m2a8) == false) then
           player:addItem(m2a8,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a8,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t2nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t2nm3 == 1) then
	    if (player:hasItem(m2a9) == false) then
           player:addItem(m2a9,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a9,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t2nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t2nm3 == 1) then
	    if (player:hasItem(m2a10) == false) then
           player:addItem(m2a10,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m2a10,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t2nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    else
       -- player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	end

    -- T3_NM1
    if (option == 2051) and (t3nm1 == 1) then
	    if (player:hasItem(m3a1) == false) then
           player:addItem(m3a1,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a1,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (t3nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t3nm1 == 1) then
	    if (player:hasItem(m3a2) == false) then
           player:addItem(m3a2,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a2,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t3nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t3nm1 == 1) then
	    if (player:hasItem(m3a3) == false) then
           player:addItem(m3a3,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a3,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t3nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T3_NM2 --
    elseif (option == 2243) and (t3nm2 == 1) then
	    if (player:hasItem(m3a4) == false) then
           player:addItem(m3a4,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a4,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (t3nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    elseif (option == 2307) and (t3nm2 == 1) then
	    if (player:hasItem(m3a5) == false) then
           player:addItem(m3a5,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a5,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (t3nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t3nm2 == 1) then
	    if (player:hasItem(m3a6) == false) then
           player:addItem(m3a6,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a6,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t3nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- T3_NM3

    elseif (option == 2435) and (t3nm3 == 1) then
	    if (player:hasItem(m3a7) == false) then
           player:addItem(m3a7,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a7,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (t3nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t3nm3 == 1) then
	    if (player:hasItem(m3a8) == false) then
           player:addItem(m3a8,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a8,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t3nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t3nm3 == 1) then
	    if (player:hasItem(m3a9) == false) then
           player:addItem(m3a9,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a9,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t3nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t3nm3 == 1) then
	    if (player:hasItem(m3a10) == false) then
           player:addItem(m3a10,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m3a10,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t3nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 15000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    else
       -- player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	end

    -- T4_NM
    if (option == 2051) and (t4nm1 == 1) then
	    if (player:hasItem(m4a1) == false) then
           player:addItem(m4a1,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a1,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2051) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t4nm1 == 1) then
	    if (player:hasItem(m4a2) == false) then
           player:addItem(m4a2,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a2,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2115) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t4nm1 == 1) then
	    if (player:hasItem(m4a3) == false) then
           player:addItem(m4a3,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a3,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2179) and (t4nm1 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (t4nm2 == 1) then
	    if (player:hasItem(m4a4) == false) then
           player:addItem(m4a4,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a4,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2243) and (t4nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    elseif (option == 2307) and (t4nm2 == 1) then
	    if (player:hasItem(m4a5) == false) then
           player:addItem(m4a5,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a5,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2307) and (t4nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t4nm2 == 1) then
	    if (player:hasItem(m4a6) == false) then
           player:addItem(m4a6,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a6,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2371) and (t4nm2 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (t4nm3 == 1) then
	    if (player:hasItem(m4a7) == false) then
           player:addItem(m4a7,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a7,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2435) and (t4nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t4nm3 == 1) then
	    if (player:hasItem(m4a8) == false) then
           player:addItem(m4a8,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a8,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2499) and (t4nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t4nm3 == 1) then
	    if (player:hasItem(m4a9) == false) then
           player:addItem(m4a9,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a9,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2563) and (t4nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t4nm3 == 1) then
	    if (player:hasItem(m4a10) == false) then
           player:addItem(m4a10,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,m4a10,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2627) and (t4nm3 == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("therion_ichor", 25000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    else
       -- player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	end

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
  printf("CSID: %u",csid);
  printf("RESULT: %u",option);
end;