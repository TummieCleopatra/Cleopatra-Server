-----------------------------------
--
--     dsp.effect.LEAVEGAME
--
-----------------------------------

function onEffectGain(target,effect)
    target:setAnimation(33)
    target:messageSystem(effect:getPower(),30)
end

function onEffectTick(target,effect)
    if not target:isInMogHouse() then
		if (effect:getTickCount() == 5) then
			target:PrintToServer(string.format("%s has logged out.", target:getName()), 0x1C);
		elseif (effect:getTickCount() > 5) then	
			target:setVar("logoutRestStart", os.time())
			target:setVar("logoutOK",1)
			target:leavegame()
		else
			target:messageSystem(effect:getPower(),30-effect:getTickCount()*5)
		end
	else
	    target:PrintToServer(string.format("%s has logged out.", target:getName()), 0x1C);
		target:setVar("logoutRestStart", os.time())
		target:setVar("logoutOK",1)
	end
end

function onEffectLose(target,effect)
    target:setAnimation(0)
end