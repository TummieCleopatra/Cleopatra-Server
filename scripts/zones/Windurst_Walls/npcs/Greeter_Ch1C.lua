-----------------------------------
--	Area: Windurst Walls
--	NPC:  Greeter Moogle
--	Working 100%
--  Kirin Rewards
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

   local kirin = player:getVar("Kirin_Win");

   if (kirin == 1) then
    local jetton = player:getCurrency("jetton");
	player:startEvent(0x210,10,jetton,1000,2400,2600,10000,191,0);
   else
   player:PrintToPlayer("Greeter Moogle : You do not have access to this.", 0xD);
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



  local kirin = player:getVar("Kirin_Win");



    if (option == 25) and (player:getVar("Kirin_Win") == 1) then
        player:updateEvent(1315,1340,1337,12562,17567,658,747,4818);
    end




  --  player:updateEvent(3404,3405,3406,3407,3408,3409,3410,3411);
    -- Second Menu

    if (option == 26) then
    -- player:updateEvent(4748,831,699050,10000,1);
	player:updateEvent(4748,831,831,699050,10000,1);
    end




-- *Kirin

    if (option == 2075) and (kirin == 1) then
	    if (player:hasItem(1315) == false) then
           player:addItem(1315);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1315,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2075) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Aquarian Abjuration Head
    elseif (option == 2139) and (kirin == 1) then
	    if (player:hasItem(1340) == false) then
           player:addItem(1340,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1340,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2139) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dryadic Abjuration Legs
    elseif (option == 2203) and (kirin == 1) then
	    if (player:hasItem(1337) == false) then
           player:addItem(1337,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,1337,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2203) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Earthen Feet
    elseif (option == 2267) and (kirin == 1) then
	    if (player:hasItem(12562) == false) then
           player:addItem(12562,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,12562,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2267) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Neptunal Abjuration Hands
    elseif (option == 2331) and (kirin == 1) then
	    if (player:hasItem(17567) == false) then
           player:addItem(17567,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,17567,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2331) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- kirin's Haidate
    elseif (option == 2395) and (kirin == 1) then
	    if (player:hasItem(658) == false) then
           player:addItem(658,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,658,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2395) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- kirin's Axe
    elseif (option == 2459) and (kirin == 1) then
	    if (player:hasItem(747) == false) then
           player:addItem(747,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,747,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2459) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Zephyr
    elseif (option == 2523) and (kirin == 1) then
	    if (player:hasItem(4818) == false) then
           player:addItem(4818,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,4818,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2523) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Behemoth Hide
    elseif (option == 2587) and (kirin == 1) then
	    if (player:hasItem(4748) == false) then
           player:addItem(4748,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,4748,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2587) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
	-- Dragon Talon
    elseif (option == 2651) and (kirin == 1) then
	    if (player:hasItem(831) == false) then
           player:addItem(831,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,831,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end
    elseif (option == 2651) and (kirin == 0) then
	    if (player:hasItem(613) == false) then
           player:addItem(613,1);
	       player:messageSpecial(ID.text.ITEM_OBTAINED,613,1);
	       player:delCurrency("jetton", 10000);
		else
		   player:PrintToPlayer("Greeter Moogle : You can only hold one of those at a time.  Try again.", 0xD);
		end


    else
       -- player:PrintToPlayer("Sholulu11111 : You can only hold one of those at a time.  Try again.", 0xD);
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


