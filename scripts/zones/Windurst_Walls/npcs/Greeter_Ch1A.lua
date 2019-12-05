-----------------------------------
--	Area: Windurst Walls
--	NPC:  Greeter Moogle A
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
    local steam = player:getVar("Steam_Win"); -- Gem of the East
	local globe = player:getVar("Globe_Win"); -- Springstone

	local zip = player:getVar("Zip_Win"); -- Gem of the North
	local olla = player:getVar("Olla_Win"); -- Winterstone

	local brig = player:getVar("Brig_Win"); -- Gem of the South
	local faust = player:getVar("Faust_Win"); -- Summerstone

	local desp = player:getVar("Despot_Win"); -- Gem of the West
	local ulli = player:getVar("Ulli_Win"); -- Autumnstone

	if ((steam == 1) or (globe == 1) or (zip == 1) or (olla == 1) or (brig == 1) or (faust == 1) or (desp == 1) or (ulli == 1)) then
	player:PrintToPlayer("Greeter Moogle : Lets see what we got here...", 0xD);
	player:startEvent(0x210,10,jetton,0,0,0,500,191,0);
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
    local steam = player:getVar("Steam_Win"); -- Gem of the East
	local globe = player:getVar("Globe_Win"); -- Springstone

	local zip = player:getVar("Zip_Win"); -- Gem of the North
	local olla = player:getVar("Olla_Win"); -- Winterstone

	local brig = player:getVar("Brig_Win"); -- Gem of the South
	local faust = player:getVar("Faust_Win"); -- Summerstone

	local desp = player:getVar("Despot_Win"); -- Gem of the West
	local ulli = player:getVar("Ulli_Win"); -- Autumnstone


-- First Choice 500 Point Items


	if (steam == 1) then
	    m1a1 = 1418;
		m1a10 = 1441;
	end

    if (globe == 1) then
	    m1a2 = 1419;
		m1a10 = 1441;
    end

	if (zip == 1) then
	    m1a3 = 1424;
		m1a9 = 1442;
    end

    if (olla == 1) then
	    m1a4 = 1425;
		m1a10 = 1441;
    end

	if (brig == 1) then
	    m1a5 = 1420;
 		m1a10 = 1441;
    end

	if (faust ==1) then
   	    m1a6 = 1421;
 		m1a9 = 1442;
    end

    if (desp == 1) then
	    m1a7 = 1422;
		m1a9 = 1442;
    end

    if (ulli == 1) then
		m1a8 = 1423;
		m1a9 = 1442;
    end



	if (option == 25) then
	    player:updateEvent(m1a1,m1a2,m1a3,m1a4,m1a5,m1a6,m1a7,m1a8);
	end

	if (option == 26) then
	   player:updateEvent(m1a9,m1a10,699050,500);
	end

  -----------------------------------
  --          Chocies              --
  -----------------------------------


    -- Gem of the East
    if (option == 2075) and (steam == 1) then
	    if (player:hasItem(1418) == false) then
           player:addItem(1418,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1418,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- elseif ((option - 2075) >= 2048) then
	  --  player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	-- end

    elseif (option == 2075) and (steam == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- elseif ((option - 2075) >= 2048) then
	  --  player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	-- end

    -- Springstone
   elseif (option == 2139) and (globe == 1) then
	    if (player:hasItem(1419) == false) then
           player:addItem(1419,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1419,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- elseif ((option - 2139) >= 2048) then
	  --  player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
	-- end

    elseif (option == 2139) and (globe == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


	-- Gem of the North
    elseif (option == 2203) and (zip == 1) then
	    if (player:hasItem(1424) == false) then
           player:addItem(1424,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1424,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2203) and (zip == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    -- Winterstone
    elseif (option == 2267) and (olla == 1) then
	    if (player:hasItem(1425) == false) then
           player:addItem(1425,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1425,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2267) and (olla == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

	-- Gem of the South
    elseif (option == 2331) and (brig == 1) then
	    if (player:hasItem(1420) == false) then
           player:addItem(1420,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1420,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2331) and (brig == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    -- Summerstone
    elseif (option == 2395) and (faust == 1) then
	    if (player:hasItem(1421) == false) then
           player:addItem(1421,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1421,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2395) and (faust == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    -- Gem of the West
    elseif (option == 2459) and (desp == 1) then
	    if (player:hasItem(1422) == false) then
           player:addItem(1422,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1422,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2459) and (desp == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    -- Autumnstone
    elseif (option == 2523) and (ulli == 1) then
	    if (player:hasItem(1423) == false) then
           player:addItem(1423,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1423,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2523) and (ulli == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

	-- Drink Abj
    elseif ((option == 2587) and ((steam == 1) or (globe == 1) or (zip == 1) or (olla == 1))) then
	    if (player:hasItem(1441) == false) then
           player:addItem(1441,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1441,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif ((option == 2587) and ((steam == 0) or (globe == 0) or (zip == 0) or (olla == 0))) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    -- Food Abj
    elseif ((option == 2651) and ((brig == 1) or (faust == 1) or (desp == 1) or (ulli == 1))) then
	    if (player:hasItem(1442) == false) then
           player:addItem(1442,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1442,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif ((option == 2651) and ((brig == 0) or (faust == 0) or (desp == 0) or (ulli == 0))) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 500);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end

    else
        player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
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







   if (option == 2499) and (ulli == 1) then
       player:addItem(1423,1);
	   player:messageSpecial(ID.text.ITEM_OBTAINED,1423);
	end

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


