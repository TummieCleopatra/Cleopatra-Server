---------------------------------------------------------------------------------------------------
-- func: godmode
-- desc: Toggles god mode on the player, granting them several special abilities.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    if (player:getVar("GodMode") == 0) then
        -- Toggle GodMode on..
        player:setVar("GodMode", 1);

        -- Add bonus effects to the player..
        player:addStatusEffect(dsp.effect.MAX_HP_BOOST,1000,0,0);
        player:addStatusEffect(dsp.effect.MAX_MP_BOOST,1000,0,0);

        player:addStatusEffect(dsp.effect.REFRESH,99,0,0);
        player:addStatusEffect(dsp.effect.REGEN,99,0,0);

        -- Add bonus mods to the player..


        -- Heal the player from the new buffs..
        player:addHP( 50000 );
        player:setMP( 50000 );
    else
        -- Toggle GodMode off..
        player:setVar("GodMode", 0);

        -- Remove bonus effects..
        player:delStatusEffect(dsp.effect.MAX_HP_BOOST);
        player:delStatusEffect(dsp.effect.MAX_MP_BOOST);

        player:delStatusEffect(dsp.effect.REFRESH);
        player:delStatusEffect(dsp.effect.REGEN);

        -- Remove bonus mods..

    end
end