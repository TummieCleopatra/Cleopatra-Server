

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, choice)
    local currentSetting = player:getVar("TrustWSTime")
    if (choice == nil) then
        player:PrintToPlayer("Use !trustws # to set the amount of seconds before Trust use WS at the start of a fight" ,0x1C);
        player:PrintToPlayer("0: Default - 30 seconds" ,0x1C);
        player:PrintToPlayer("1: Set to 15 seconds" ,0x1C);
        player:PrintToPlayer("2: Do not wait" ,0x1C);
        if (currentSetting == -15) then
            currentSetting = 1
        elseif (currentSetting == -30) then
            currentSetting = 2
        end
        player:PrintToPlayer("Current Setting: "..currentSetting.."",0x1C);
    elseif (tonumber(choice) == 0) then
        player:setVar("TrustWSTime",0)
        player:PrintToPlayer("Trust will wait 30 seconds at the start of a fight before using WS" ,0x1C);
    elseif (tonumber(choice) == 1) then
        player:setVar("TrustWSTime",-15)
        player:PrintToPlayer("Trust will wait 15 seconds at the start of a fight before using WS" ,0x1C);
    elseif (tonumber(choice) == 2) then
        player:setVar("TrustWSTime",-30)
        player:PrintToPlayer("Trust will not wait to use WS at the start of a fight" ,0x1C);
    else
        player:PrintToPlayer("Please choose a value 0-2!" ,0x1C);
    end
end