


dialog =
{
    start = "I can improve my skills further, but first you must trade me a sparkling stone while in posession of 5 Merits",
    remind = "Remember, I require a sparkling stone while in posession of 5 Merits",
    finish = "Thanks, I will now accept Trust Tokens",
}


job =
{
    PLD =
    {
        start =
        {
            [0] = "decrease my Dmg Taken under Holy Circle by 1",
            [1] = "raise my VIT by 1",
            [2] = "raise my STR by 1",
            [3] = "raise my MND by 1",
            [4] = "raise my Shield Bash Damage by 1",
            [5] = "raise my Sword Skill by 1",
            [6] = "raise my Shield Skill by 1",
            [7] = "raise my Healing Skill by 1",
            [8] = "raise my Enhancing Skill by 1",
            [9] = "raise my Sentinel Enmity by 1",
        },
        finish =
        {
            [0] = "Dmg Taken under Holy Circle has decreased by 1",
            [1] = "VIT has been raised by 1",
            [2] = "STR has been raised  by 1",
            [3] = "MND has been raised  by 1",
            [4] = "Shield Bash Damage has been raised  by 1",
            [5] = "Sword Skill has been raised by 1",
            [6] = "Shield Skill has been raised by 1",
            [7] = "Healing Skill has been raised by 1",
            [8] = "Enhancing Skill has been raised by 1",
            [9] = "Sentinel Enmity has been raised by 1",
        }
    }
}


--[[

1  Holy Circle dmg taken
2  VIT + 1
3  STR + 1
4  MND + 1
5  Shield Bash Dmg
6  Sword Skill + 1
7  Shield Skill + 1
8  Healing Skill + 1
9  Enhancing SKill +1
10  Sentinel Effect  ]]--
function rankConversion(player)

-- 1  = 0.1
-- 2  = 0.3
-- 3  = 0.6
-- 4  = 1.0
-- 5  = 1.2
-- 6  = 1.7
-- 7  = 2.3
-- 8  = 3.0
-- 9  = 3.7
-- 10 = 4.4
    local crank = player:getVar("TributeRank_Curilla")
    if (crank == 1) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",0)
        player:setVar("[TRUST]CurillaSubRank",1)
        player:setVar("[TRUST]CurillaTokensTotal",1)
    elseif (crank == 2) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",0)
        player:setVar("[TRUST]CurillaSubRank",3)
        player:setVar("[TRUST]CurillaTokensTotal",3)
    elseif (crank == 3) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",0)
        player:setVar("[TRUST]CurillaSubRank",6)
        player:setVar("[TRUST]CurillaTokensTotal",6)
    elseif (crank == 4) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",1)
        player:setVar("[TRUST]CurillaSubRank",0)
        player:setVar("[TRUST]CurillaTokensTotal",10)
    elseif (crank == 5) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",1)
        player:setVar("[TRUST]CurillaSubRank",2)
        player:setVar("[TRUST]CurillaTokensTotal",14)
    elseif (crank == 6) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",1)
        player:setVar("[TRUST]CurillaSubRank",7)
        player:setVar("[TRUST]CurillaTokensTotal",24)
    elseif (crank == 7) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",2)
        player:setVar("[TRUST]CurillaSubRank",3)
        player:setVar("[TRUST]CurillaTokensTotal",39)
    elseif (crank == 8) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",3)
        player:setVar("[TRUST]CurillaSubRank",0)
        player:setVar("[TRUST]CurillaTokensTotal",60)
    elseif (crank == 9) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",3)
        player:setVar("[TRUST]CurillaSubRank",7)
        player:setVar("[TRUST]CurillaTokensTotal",88)
    elseif (crank == 10) then
        player:setVar("TributeRank_Curilla",0)
        player:setVar("[TRUST]CurillaRank",4)
        player:setVar("[TRUST]CurillaSubRank",4)
        player:setVar("[TRUST]CurillaTokensTotal",125)
    end


end


function trustTribConversion(player)
    -- This converts old Tribute vars to new
    local curillaTrib = player:getVar("CURILLA_TRIB_FIGHT");
    local excenmilleTrib = player:getVar("EXCEN_TRIB_FIGHT");
    local ayameTrib = player:getVar("AYAME_TRIB_FIGHT");
    local najiTrib = player:getVar("NAJI_TRIB_FIGHT");
    local kupipiTrib = player:getVar("KUPIPI_TRIB_FIGHT");
    local nanaaTrib = player:getVar("NANAA_TRIB_FIGHT");
    local lionTrib = player:getVar("LION_TRIB_FIGHT");
    local darcullinTrib = player:getVar("DARC_TRIB_FIGHT");
    local zeidTrib = player:getVar("ZEID_TRIB_FIGHT");
    local adelheidTrib = player:getVar("ADEL_TRIB_FIGHT");

    if (curillaTrib > 1) then
        player:setVar("[TRUST]CURILLA_TRIB",2)
        player:setVar("CURILLA_TRIB_FIGHT",0)
    elseif (curillaTrib == 1) then
        player:setVar("[TRUST]CURILLA_TRIB",1)
        player:setVar("CURILLA_TRIB_FIGHT",0)
    end

    if (excenmilleTrib > 1) then
        player:setVar("[TRUST]EXENMILLE_TRIB",2)
        player:setVar("EXEN_TRIB_FIGHT",0)
    elseif (excenmilleTrib == 1) then
        player:setVar("[TRUST]EXENMILLE_TRIB",1)
        player:setVar("EXEN_TRIB_FIGHT",0)
    end

    if (ayameTrib > 1) then
        player:setVar("[TRUST]AYAME_TRIB",2)
        player:setVar("AYAME_TRIB_FIGHT",0)
    elseif (ayameTrib == 1) then
        player:setVar("[TRUST]AYAME_TRIB",1)
        player:setVar("AYAME_TRIB_FIGHT",0)
    end

    if (najiTrib > 1) then
        player:setVar("[TRUST]NAJI_TRIB",2)
        player:setVar("NAJI_TRIB_FIGHT",0)
    elseif (najiTrib == 1) then
        player:setVar("[TRUST]NAJI_TRIB",1)
        player:setVar("NAJI_TRIB_FIGHT",0)
    end

    if (kupipiTrib > 1) then
        player:setVar("[TRUST]KUPIPI_TRIB",2)
        player:setVar("KUPIPI_TRIB_FIGHT",0)
    elseif (kupipiTrib == 1) then
        player:setVar("[TRUST]KUPIPI_TRIB",1)
        player:setVar("KUPIPI_TRIB_FIGHT",0)
    end

    if (nanaaTrib > 1) then
        player:setVar("[TRUST]NANAA_TRIB",2)
        player:setVar("NANAA_TRIB_FIGHT",0)
    elseif (nanaaTrib == 1) then
        player:setVar("[TRUST]NANAA_TRIB",1)
        player:setVar("NANAA_TRIB_FIGHT",0)
    end

    if (lionTrib > 1) then
        player:setVar("[TRUST]LION_TRIB",2)
        player:setVar("LION_TRIB_FIGHT",0)
    elseif (lionTrib == 1) then
        player:setVar("[TRUST]LION_TRIB",1)
        player:setVar("LION_TRIB_FIGHT",0)
    end

    if (darcullinTrib > 1) then
        player:setVar("[TRUST]DARC_TRIB",2)
        player:setVar("DARC_TRIB_FIGHT",0)
    elseif (darcullinTrib == 1) then
        player:setVar("[TRUST]DARC_TRIB",1)
        player:setVar("DARC_TRIB_FIGHT",0)
    end

    if (zeidTrib > 1) then
        player:setVar("[TRUST]ZEID_TRIB",2)
        player:setVar("ZEID_TRIB_FIGHT",0)
    elseif (zeidTrib == 1) then
        player:setVar("[TRUST]ZEID_TRIB",1)
        player:setVar("ZEID_TRIB_FIGHT",0)
    end

    if (adelheidTrib > 1) then
        player:setVar("[TRUST]ADELHEID_TRIB",2)
        player:setVar("ADEL_TRIB_FIGHT",0)
    elseif (adelheidTrib == 1) then
        player:setVar("[TRUST]ADELHEID_TRIB",1)
        player:setVar("ADEL_TRIB_FIGHT",0)
    end

end