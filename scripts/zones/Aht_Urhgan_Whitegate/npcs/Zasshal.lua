-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC:  Zasshal
--  Type: Salvage
--  @pos 101.468 -1 -20.088 50
-----------------------------------

-----------------------------------

local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getVar("SALVAGE_PERMITED") == 1) then
        if (trade:hasItemQty(65535,10000)) then
		    local tags = player:getVar("SALVAGE_TAGS");
		    -- Make sure they don't have a permit already
			if (player:hasKeyItem(dsp.ki.REMNANTS_PERMIT)) then
		        player:PrintToPlayer("Zasshal : You can only hold one permit at a time!" ,0x0D);
	        -- Check if tags are available
		    elseif (tags > 0) then
		        player:tradeComplete();
			    player:setVar("SALVAGE_TAGS",tags - 1);
				player:setVar("SALVAGE_LAST_TAG",os.time());
				player:PrintToPlayer("Zasshal : Here you go, one Remnants Permit to explore the Undersea Remnants." ,0x0D);
				player:addKeyItem(dsp.ki.REMNANTS_PERMIT);
			    player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.REMNANTS_PERMIT);
			elseif (tags == 0) then
			    player:PrintToPlayer("Zasshal : I'm sorry, you don't have any Remnants Permits available.  Try again later." ,0x0D);
			end
		else
		    player:PrintToPlayer("Zasshal : Please trade me exactly 10,000g" ,0x0D);
		end
	else
	    player:PrintToPlayer("Zasshal : I am not accepting donations at this time." ,0x0D);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- player:startEvent(0x0331);
	local arrapago = 99999999;
	local bhaflau = 99999999;
	local silver = 99999999;
	local zhayolm = 99999999;

	if (player:getVar("Zhayolm_Card") == 1) then
	    zhayolm = 15000;
	end

	if (player:getVar("Arrapago_Card") == 1) then
	    arrapago = 15000;
	end

	if (player:getVar("Bhaflau_Card") == 1) then
	    bhaflau = 10000;
	end

	if (player:getVar("Silver_Card") == 1) then
	    silver = 10000;
	end

    local stock_1 =
    {
        2376,    arrapago,
	    2377,    bhaflau,
		2378,    silver,
		2375,    zhayolm
    };

    dsp.shop.general(player, stock_1);

    local hours = SALVAGE_REFRESH;
    local maxPlayerTags = SALVAGE_TAGS;
	local completedCoffin = player:hasCompletedMission(TOAU,dsp.mission.id.toau.THE_BLACK_COFFIN);
	local salvageOK = player:getVar("SALVAGE_PERMITED");
	local tags = player:getVar("SALVAGE_TAGS");
	local lasttag = player:getVar("SALVAGE_LAST_TAG");
	local localtime = os.time();
	local calctag = localtime - lasttag;  -- How much time has passed since player got a tag
	-- Calculate Tag Times
	calctag = math.floor(calctag / (hours * 60 * 60));
	tags = utils.clamp(tags + calctag,0,SALVAGE_TAGS);
	player:setVar("SALVAGE_TAGS",tags);


	-- First see if this is the first time the player has talked to Zasshal while meeting requirements
	if (salvageOK ~= 1 and completedCoffin) then
	    player:PrintToPlayer("Zasshal : Oh you want to explore the Remnants?  Well I have two Permits saved for you.  Just trade me 10,000g when ready.",0x0D);
		player:setVar("SALVAGE_PERMITED",1);
		player:setVar("SALVAGE_TAGS",2);  -- Auto set the players tags to 2
		player:PrintToPlayer("You are now able to enter Salvage with a Remnants Permit", 0x1C);
	elseif (salvageOK == 1 and completedCoffin) then
	    if (tags < maxPlayerTags - 1) then
			local remaining = math.floor(((lasttag + (hours * 60 * 60)) - localtime) / 60);
		    player:PrintToPlayer("Remnants Permits Available: "..tags..".", 0x1C);
		    player:PrintToPlayer("Next Remnants Permit Available in: "..remaining.." minutes.", 0x1C);
	        player:PrintToPlayer("Zasshal : You currently have "..tags.." Remnants Permit(s) available.  Just trade me 10,000g when you are ready." ,0x0D);
	    elseif (tags == maxPlayerTags) then
			local remaining = math.floor((localtime - lasttag) / 60);
		    player:PrintToPlayer("Remnants Permits Available: "..tags..".", 0x1C);
		    -- player:PrintToPlayer("Next Remnants Permit Available in: "..remaining.." minutes.", 0x1C);
	        player:PrintToPlayer("Zasshal : You currently have "..tags.." Remnants Permit(s) available.  Just trade me 10,000g when you are ready." ,0x0D);
        end
	else
	    player:PrintToPlayer("Zasshal : Once you've done enough work for the Empire, come back and talk to me.",0x0D);
	end


end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;
