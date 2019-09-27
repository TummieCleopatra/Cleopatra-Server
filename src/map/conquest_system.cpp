/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

  This file is part of DarkStar-server source code.

===========================================================================
*/

#include "conquest_system.h"
#include "entities/charentity.h"
#include "vana_time.h"
#include "utils/zoneutils.h"
#include "utils/charutils.h"

#include "packets/conquest_map.h"

#include "lua/luautils.h"
#include "latent_effect_container.h"

/************************************************************************
*                                                                       *
*	Реализация namespace conquest                                       *
*                                                                       *
************************************************************************/

namespace conquest
{
	/************************************************************************
    *                                                                       *
    *	UpdateConquestSystem		                                        *
    *                                                                       *
    ************************************************************************/

	void UpdateConquestSystem()
	{
		zoneutils::ForEachZone([](CZone* PZone)
		{
            //only find chars for zones that have had conquest updated
            if (PZone->GetRegionID() <= 18)
            {
                luautils::OnConquestUpdate(PZone, Conquest_Update);
				PZone->ForEachChar([](CCharEntity* PChar)
				{
					PChar->PLatentEffectContainer->CheckLatentsZone();
				});
            }
		});
	}

    /*
	void UpdateCampaignSystem()
	{
		zoneutils::ForEachZone([](CZone* PZone)
		{
            //only find chars for zones that have had conquest updated
            if (PZone->GetRegionID() >= 33 && PZone->GetRegionID() <= 40)
            {
                luautils::OnCampaignUpdate(PZone);
            }
		});
	}*/

    void UpdateBesiegeMap()
    {
        ShowDebug(CL_GREEN"Besiege Map Update \n" CL_RESET);

        int m_besiegedStatus = 0;
        int t_besiegedStatus = 0;
        int u_besiegedStatus = 0;
        int undeadLvl = 0;
        int32 besiegeStatus = 0;
        int32 ret = Sql_Query(SqlHandle, "SELECT value FROM server_variables WHERE name = '[BESIEGED]Undead_Swarm_LVL';");

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                undeadLvl = (int8)Sql_GetIntData(SqlHandle, 0);
            }
        }

        int32 ureq = Sql_Query(SqlHandle, "SELECT value FROM server_variables WHERE name = '[BESIEGED]Undead_Swarm_Status';");

        if (ureq != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                u_besiegedStatus = (int32)Sql_GetIntData(SqlHandle, 0);
            }
        }

        const char* Nquery = "SELECT id, mamool_ac, troll_ac, undead_ac, mamool_lvl, troll_lvl, \
                          undead_lvl, mamool_status, troll_status, undead_status, mamool_base_status, \
                          mamool_base_forces, mamool_base_mirrors, mamool_base_prisoners, troll_base_status, \
                          troll_base_forces, troll_base_mirrors, troll_base_prisoners, undead_base_status, \
                          undead_base_forces, undead_base_mirrors, undead_base_prisoners FROM besiege_system;";

        int32 res = Sql_Query(SqlHandle, Nquery);

        if (res == SQL_ERROR || Sql_NextRow(SqlHandle) != SQL_SUCCESS)
        {
            return;
        }

        int besiege[22] =
        {
            Sql_GetIntData(SqlHandle, 0),
            Sql_GetIntData(SqlHandle, 1),
            Sql_GetIntData(SqlHandle, 2),
            Sql_GetIntData(SqlHandle, 3),
            Sql_GetIntData(SqlHandle, 4),
            Sql_GetIntData(SqlHandle, 5),
            Sql_GetIntData(SqlHandle, 6),
            Sql_GetIntData(SqlHandle, 7),
            Sql_GetIntData(SqlHandle, 8),
            Sql_GetIntData(SqlHandle, 9),
            Sql_GetIntData(SqlHandle, 10),
            Sql_GetIntData(SqlHandle, 11),
            Sql_GetIntData(SqlHandle, 12),
            Sql_GetIntData(SqlHandle, 13),
            Sql_GetIntData(SqlHandle, 14),
            Sql_GetIntData(SqlHandle, 15),
            Sql_GetIntData(SqlHandle, 16),
            Sql_GetIntData(SqlHandle, 17),
            Sql_GetIntData(SqlHandle, 18),
            Sql_GetIntData(SqlHandle, 19),
            Sql_GetIntData(SqlHandle, 20),
            Sql_GetIntData(SqlHandle, 21),
        };

            int id = besiege[0];
            int mac = besiege[1];
            int tac = besiege[2];
            int uac = besiege[3];
            int8 mlvl = besiege[4];
            int8 tlvl = besiege[5];
            int8 ulvl = besiege[6];
            int8 mstatus = besiege[7];
            int8 tstatus = besiege[8];
            int8 ustatus = besiege[9];
            int8 mbstatus = besiege[10];
            uint8 mbforces = besiege[11];
            int8 mbmirrors = besiege[12];
            int8 mbprisoners = besiege[13];
            int8 tbstatus = besiege[14];
            uint8 tbforces = besiege[15];
            int8 tbmirrors = besiege[16];
            int8 tbprisoners = besiege[17];
            int8 ubstatus = besiege[18];
            uint8 ubforces = besiege[19];
            int8 ubmirrors = besiege[20];
            int8 ubprisoners = besiege[21];
            //ShowDebug(CL_CYAN"Undead STatus is: %u \n" CL_RESET, ustatus);
        /*
        if (res != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            //while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            //{
                int id = Sql_GetIntData(SqlHandle, 0);
                int mac = Sql_GetIntData(SqlHandle, 1);
                int tac = Sql_GetIntData(SqlHandle, 2);
                int uac = Sql_GetIntData(SqlHandle, 3);
                int8 mlvl = Sql_GetIntData(SqlHandle, 4);
                int8 tlvl = Sql_GetIntData(SqlHandle, 5);
                int8 ulvl = Sql_GetIntData(SqlHandle, 6);
                int8 mstatus = Sql_GetIntData(SqlHandle, 7);
                int8 tstatus = Sql_GetIntData(SqlHandle, 8);
                int8 ustatus = Sql_GetIntData(SqlHandle, 9);
                int8 mbstatus = Sql_GetIntData(SqlHandle, 10);
                int8 mbforces = Sql_GetIntData(SqlHandle, 11);
                int8 mbmirrors = Sql_GetIntData(SqlHandle, 12);
                int8 mbprisoners = Sql_GetIntData(SqlHandle, 13);
                int8 tbstatus = Sql_GetIntData(SqlHandle, 14);
                int8 tbforces = Sql_GetIntData(SqlHandle, 15);
                int8 tbmirrors = Sql_GetIntData(SqlHandle, 16);
                int8 tbprisoners = Sql_GetIntData(SqlHandle, 17);
                int8 ubstatus = Sql_GetIntData(SqlHandle, 18);
                int8 ubforces = Sql_GetIntData(SqlHandle, 19);
                int8 ubmirrors = Sql_GetIntData(SqlHandle, 20);
                int8 ubprisoners = Sql_GetIntData(SqlHandle, 21);
            */
                //Increase the forces
                //dsprand::GetRandomNumber(100) < 33

                ulvl = undeadLvl;
                //Reset Force after win/loss
                if (u_besiegedStatus == 11){
                    ubforces = 0;
                    ustatus = 0;
                    ubstatus = 0;
                    u_besiegedStatus = 10;
                    ShowDebug(CL_CYAN"Resetting Undead Starus.  Status is now at %u  \n" CL_RESET, ustatus);
                    ShowDebug(CL_CYAN"Resetting Undead.  Forces are now at %u  \n" CL_RESET, ubforces);
                    Sql_Query(SqlHandle, "UPDATE server_variables SET value = %d WHERE name = '[BESIEGED]Undead_Swarm_Status';", u_besiegedStatus);
                    Sql_Query(SqlHandle, "UPDATE besiege_system SET undead_base_status = '%d' WHERE id = '1';", ubstatus, id);
                }


                int mforcerand = dsprand::GetRandomNumber(2,7);
                int tforcerand = dsprand::GetRandomNumber(2,7);
                int uforcerand = dsprand::GetRandomNumber(2,7);
                if (mstatus == 0 || mstatus == 5) {
                    mbforces = mbforces + mforcerand;
                    if (mbforces > (100 + (mlvl * 10))){
                        mbforces = 100 + (mlvl * 10); // cap forces based on level.
                    }
                    ShowDebug(CL_CYAN"Updating Mamool Ja Forces.  Forces are now at %u  \n" CL_RESET, mbforces);
                }
                if (tstatus == 0 || tstatus == 5) {
                    tbforces = tbforces + tforcerand;
                    if (tbforces > (100 + (tlvl * 10))){
                        tbforces = 100 + (tlvl * 10); // cap forces based on level.
                    }
                    ShowDebug(CL_CYAN"Updating Troll Forces.  Forces are now at %u \n" CL_RESET, tbforces);
                }
                if (ustatus == 0 || ustatus == 5) {
                    ubforces = ubforces + uforcerand;
                    if (ubforces > (100 + (ulvl * 10))){
                        ubforces = 100 + (ulvl * 10); // cap forces based on level.
                    }
                    ShowDebug(CL_CYAN"Updating Undead Forces.  Forces are now at %u  \n" CL_RESET, ubforces);
                }

                //Set Training ->Perparing
                if ((mbforces) >= 100 && mstatus < 1) {
                    ShowDebug(CL_GREEN"Set Mamool from Training to Preparing \n" CL_RESET);
                    mstatus = 5;
                }
                if ((tbforces) >= 100 && tstatus < 1) {
                    ShowDebug(CL_GREEN"Set Troll from Training to Preparing \n" CL_RESET);
                    tstatus = 5;
                }
                if ((ubforces) >= 100 && ustatus < 1) {
                    ShowDebug(CL_GREEN"Set Undead from Training to Preparing \n" CL_RESET);
                    ustatus = 5;
                }

                //Set Preparing to Advance
                if ((mbforces) >= 100 + (mlvl * 10) && mstatus == 5){
                    mstatus = 1;
                    ShowDebug(CL_GREEN"Set Mamool from Preparing to March \n" CL_RESET);
                    m_besiegedStatus = 1;
                }
                if ((tbforces) >= 100 + (tlvl * 10) && tstatus == 5){
                    tstatus = 1;
                    ShowDebug(CL_GREEN"Set Troll from Preparing to March \n" CL_RESET);
                    t_besiegedStatus = 1;
                }
                if ((ubforces) >= (100 + (ulvl * 10)) && ustatus == 5){
                    ustatus = 1;
                    ShowDebug(CL_GREEN"Set Undead from Preparing to March \n" CL_RESET);
                    //Sql_Query(SqlHandle, "REPLACE INTO server_variables (name,value) VALUES('[BESIEGED]Undead_Swarm_Status',%u);",ustatus); //set server var to march status
                    Sql_Query(SqlHandle, "UPDATE server_variables SET value = %d WHERE name = '[BESIEGED]Undead_Swarm_Status';", ustatus);
                }



                //Set Advance to Attack based on ticker
                if (ustatus == 1) {
                    ubstatus++;
                    ShowDebug(CL_GREEN"Undead March Counter is now %u \n" CL_RESET, ubstatus);
                    if (ubstatus == 2) {
                        ustatus = 2;
                        ShowDebug(CL_GREEN"Undead Swarm is now Attacking! \n" CL_RESET);
                        //Sql_Query(SqlHandle, "REPLACE INTO server_variables (name,value) VALUES('[BESIEGED]Undead_Swarm_Status',%u);",ustatus); //set server var to attack status
                        Sql_Query(SqlHandle, "UPDATE server_variables SET value = %d WHERE name = '[BESIEGED]Undead_Swarm_Status';", ustatus);
                    }
                    Sql_Query(SqlHandle, "UPDATE besiege_system SET undead_base_status = '%d' WHERE id = %d;", ubstatus, id);
                }




               //Sql_Query(SqlHandle, "UPDATE besiege_system SET undead_base_status = '%d' WHERE id = %d;", ubstatus, id);
               Sql_Query(SqlHandle, "UPDATE besiege_system SET mamool_lvl = %d, troll_lvl = %d, undead_lvl = %d, mamool_status = %d, troll_status = %d, undead_status = %d, mamool_base_forces = %u, troll_base_forces = %u, undead_base_forces = %u WHERE id = '1';", mlvl, tlvl, ulvl, mstatus, tstatus, ustatus, mbforces, tbforces, ubforces);

                //Sql_Query(SqlHandle, "REPLACE INTO server_variables (name,value) VALUES('[BESIEGED]Undead_Swarm_Status',%u);",u_besiegedStatus);
            //}
        //}
    }

    void UpdateInfluencePoints(int points, unsigned int nation, REGIONTYPE region)
    {
        if (region == REGIONTYPE::REGION_UNKNOWN)
        {
            return;
        }

        std::string Query = "SELECT sandoria_influence, bastok_influence, windurst_influence, beastmen_influence FROM conquest_system WHERE region_id = %d;";

        int ret = Sql_Query(SqlHandle, Query.c_str(), region);

        if (ret == SQL_ERROR || Sql_NextRow(SqlHandle) != SQL_SUCCESS)
        {
            return;
        }

        int influences[4] =
        {
            Sql_GetIntData(SqlHandle, 0),
            Sql_GetIntData(SqlHandle, 1),
            Sql_GetIntData(SqlHandle, 2),
            Sql_GetIntData(SqlHandle, 3),
        };

        if (influences[nation] == 5000)
            return;

        auto lost = 0;
        for (auto i = 0u; i < 4; ++i)
        {
            if (i == nation)
            {
                continue;
            }

            auto loss = std::min<int>(points * influences[i] / (5000 - influences[nation]), influences[i]);
            influences[i] -= loss;
            lost += loss;
        }

        influences[nation] += lost;

        Sql_Query(SqlHandle, "UPDATE conquest_system SET sandoria_influence = %d, bastok_influence = %d, "
            "windurst_influence = %d, beastmen_influence = %d WHERE region_id = %d;", influences[0], influences[1], influences[2], influences[3], region);
    }

    /************************************************************************
    *    GainInfluencePoints                                                *
    *    +1 point for nation							                    *
    *						                                                *
    ************************************************************************/

    void GainInfluencePoints(CCharEntity* PChar, uint32 points)
    {
        points += (uint32)(PChar->getMod(Mod::CONQUEST_REGION_BONUS) / 100.0);
        conquest::UpdateInfluencePoints(points, PChar->profile.nation, PChar->loc.zone->GetRegionID());
    }

    /************************************************************************
    *    LoseInfluencePoints                                                *
    *    -x point for nation							                    *
    *    +x point for beastmen                                              *
    ************************************************************************/

    void LoseInfluencePoints(CCharEntity* PChar)
    {
        REGIONTYPE region = PChar->loc.zone->GetRegionID();
        int points = 0;

        switch (region)
        {
            case REGION_RONFAURE:
            case REGION_GUSTABERG:
            case REGION_SARUTABARUTA:
            {
                points = 10;
                break;
            }
            case REGION_ZULKHEIM:
            case REGION_KOLSHUSHU:
            case REGION_NORVALLEN:
            case REGION_DERFLAND:
            case REGION_ARAGONEU:
            {
                points = 50;
                break;
            }
            case REGION_QUFIMISLAND:
            case REGION_LITELOR:
            case REGION_KUZOTZ:
            case REGION_ELSHIMOLOWLANDS:
            {
                points = 75;
                break;
            }
            case REGION_VOLLBOW:
            case REGION_VALDEAUNIA:
            case REGION_FAUREGANDI:
            case REGION_ELSHIMOUPLANDS:
            {
                points = 300;
                break;
            }
            case REGION_TULIA:
            case REGION_MOVALPOLOS:
            case REGION_TAVNAZIA:
            {
                points = 600;
                break;
            }
            default:
            {
                break;
            }
        }

        conquest::UpdateInfluencePoints(points, BEASTMEN, region);
    }

	/************************************************************************
    *                                                                       *
    *	GetInfluenceGraphics		                                        *
    *												                        *
    ************************************************************************/

    uint8 GetInfluenceGraphics(int32 san_inf, int32 bas_inf, int32 win_inf, int32 bst_inf)
	{
        //if all nations and beastmen == 0
        if (san_inf == 0 && bas_inf == 0 && win_inf == 0 && bst_inf == 0)
        {
            return 0;
        }
        //if all nations and beastmen, has same number
        else if (san_inf == bas_inf &&
            san_inf == win_inf &&
            san_inf == bst_inf)
        {
            return 0;
        }
        //if Beast influence > all nations
        else if (bst_inf > san_inf &&
            bst_inf > win_inf &&
            bst_inf > bas_inf)
        {
            return 64;
        }
        else
        {
            uint8 offset = 0;
            int64 total = san_inf + bas_inf + win_inf;

            //Sandoria
            if (san_inf >= total * 0.65)	  offset = 3;
            else if (san_inf >= total * 0.5)  offset = 2;
            else if (san_inf >= total * 0.25) offset = 1;
            else							  offset = 0;

            //Bastok
            if (bas_inf >= total * 0.65)	  offset += 12;
            else if (bas_inf >= total * 0.5)  offset += 8;
            else if (bas_inf >= total * 0.25) offset += 4;
            else							  offset += 0;

            //Windurst
            if (win_inf >= total * 0.65)	  offset += 48;
            else if (win_inf >= total * 0.5)  offset += 32;
            else if (win_inf >= total * 0.25) offset += 16;
            else							  offset += 0;

            return offset;
        }
	}

    uint8 GetInfluenceGraphics(REGIONTYPE regionid)
    {
        int32 sandoria = 0;
        int32 bastok = 0;
        int32 windurst = 0;
        int32 beastmen = 0;
        const char* Query = "SELECT sandoria_influence, bastok_influence, windurst_influence, beastmen_influence \
                             FROM conquest_system WHERE region_id = %d;";

        int32 ret = Sql_Query(SqlHandle, Query, regionid);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            sandoria = Sql_GetIntData(SqlHandle, 0);
            bastok = Sql_GetIntData(SqlHandle, 1);
            windurst = Sql_GetIntData(SqlHandle, 2);
            beastmen = Sql_GetIntData(SqlHandle, 3);
        }
        return GetInfluenceGraphics(sandoria, bastok, windurst, beastmen);
    }

    //TODO: figure out what the beastmen-less numbers are for
    uint8 GetInfluenceRanking(int32 san_inf, int32 bas_inf, int32 win_inf, int32 bst_inf)
    {
        uint8 ranking = 63;
        if (san_inf >= bas_inf)
            ranking -= 1;

        if (san_inf >= win_inf)
            ranking -= 1;

        if (bas_inf >= san_inf)
            ranking -= 4;

        if (bas_inf >= win_inf)
            ranking -= 4;

        if (win_inf >= san_inf)
            ranking -= 16;

        if (win_inf >= bas_inf)
            ranking -= 16;

        return ranking;
    }

    uint8 GetInfluenceRanking(int32 san_inf, int32 bas_inf, int32 win_inf)
    {
        return GetInfluenceRanking(san_inf, bas_inf, win_inf, 0);
    }

	/************************************************************************
    *   UpdateConquestGM                                                    *
    *	Update region control		                                        *
    *   just used by GM command			                                    *
    ************************************************************************/

    void UpdateConquestGM(ConquestUpdate type)
    {
        if (type == Conquest_Tally_Start || type == Conquest_Tally_End)
            UpdateWeekConquest();
        else
            UpdateConquestSystem();
	}

	/************************************************************************
    *   UpdateWeekConquest                                                  *
    *	Update region control		                                        *
    *   update 1 time per week			                                    *
    ************************************************************************/

	void UpdateWeekConquest()
	{
		//TODO: move to lobby server
		//launch conquest message in all zone (monday server midnight)

        zoneutils::ForEachZone([](CZone* PZone)
        {
            //only find chars for zones that have had conquest updated
            if (PZone->GetRegionID() <= 18)
            {
                luautils::OnConquestUpdate(PZone, Conquest_Tally_Start);
            }
        });

        const char* Query = "UPDATE conquest_system SET region_control = \
                            IF(sandoria_influence > bastok_influence AND sandoria_influence > windurst_influence AND \
                            sandoria_influence > beastmen_influence, 0, \
                            IF(bastok_influence > sandoria_influence AND bastok_influence > windurst_influence AND \
                            bastok_influence > beastmen_influence, 1, \
                            IF(windurst_influence > bastok_influence AND windurst_influence > sandoria_influence AND \
                            windurst_influence > beastmen_influence, 2, 3)));";

        Sql_Query(SqlHandle, Query);

		//update conquest overseers
		for (uint8 i=0; i <= 18; i++)
		{
            luautils::SetRegionalConquestOverseers(i);
		}

        zoneutils::ForEachZone([](CZone* PZone)
        {
            //only find chars for zones that have had conquest updated
            if (PZone->GetRegionID() <= 18)
            {
                luautils::OnConquestUpdate(PZone, Conquest_Tally_End);
                PZone->ForEachChar([](CCharEntity* PChar)
                {
                    PChar->pushPacket(new CConquestPacket(PChar));
                    PChar->PLatentEffectContainer->CheckLatentsZone();
                });
            }
        });

		ShowDebug(CL_CYAN"Conquest Weekly Update is finished\n" CL_RESET);
	}

	/************************************************************************
    *                                                                       *
    *	GetBalance					                                        *
    *   Ranking for the 3 nations                                           *
    ************************************************************************/

    uint8 GetBalance(uint8 sandoria, uint8 bastok, uint8 windurst, uint8 sandoria_prev, uint8 bastok_prev, uint8 windurst_prev)
    {
		// Based on the below values, it seems to be in pairs of bits.
		// Order is Windurst, Bastok, San d'Oria
		// 01 for first place, 10 for second, 11 for third.
		// 45 = 0b101101 = Windurst in second, Bastok in third, San d'Oria in first
		// 30 = 0b011110 = Windurst in first, Bastok in third, San d'Oria in second

		uint8 ranking = 63;
        if (sandoria >= bastok)
			ranking -= 1;

        if (sandoria >= windurst)
			ranking -= 1;

        if (bastok >= sandoria)
			ranking -= 4;

        if (bastok >= windurst)
			ranking -= 4;

        if (windurst >= sandoria)
			ranking -= 16;

        if (windurst >= bastok)
			ranking -= 16;

        if (GetAlliance(sandoria_prev, bastok_prev, windurst_prev) != 0)
        {
            //there was an alliance last conquest week, so the allied nations will be tied for first (unless they didn't pass the other nation)
            if (sandoria_prev > bastok_prev && sandoria_prev > windurst_prev && (ranking & 0x03) != 0x01)
            {
                ranking = 0x17;
            }
            else if (bastok_prev > sandoria_prev && bastok_prev > windurst_prev && (ranking & 0x0C) != 0x04)
            {
                ranking = 0x1D;
            }
            else if (windurst_prev > bastok_prev && windurst_prev > sandoria_prev && (ranking & 0x30) != 0x10)
            {
                ranking = 0x35;
            }
        }

		return ranking;
    }

    uint8 GetBalance()
    {
        uint8 sandoria = 0;
        uint8 bastok = 0;
        uint8 windurst = 0;
        const char* Query = "SELECT region_control, COUNT(*) FROM conquest_system WHERE region_control < 3 GROUP BY region_control;";

        int32 ret = Sql_Query(SqlHandle, Query);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetIntData(SqlHandle, 0) == 0)
                    sandoria = Sql_GetIntData(SqlHandle, 1);
                else if(Sql_GetIntData(SqlHandle, 0) == 1)
                    bastok = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 2)
                    windurst = Sql_GetIntData(SqlHandle, 1);
            }
        }

        uint8 sandoria_prev = 0;
        uint8 bastok_prev = 0;
        uint8 windurst_prev = 0;

        Query = "SELECT region_control_prev, COUNT(*) FROM conquest_system WHERE region_control_prev < 3 GROUP BY region_control_prev;";

        ret = Sql_Query(SqlHandle, Query);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetIntData(SqlHandle, 0) == 0)
                    sandoria_prev = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 1)
                    bastok_prev = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 2)
                    windurst_prev = Sql_GetIntData(SqlHandle, 1);
            }
        }
        return GetBalance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev);
    }

    uint8 GetAlliance(uint8 sandoria, uint8 bastok, uint8 windurst)
    {
        if (((sandoria > (bastok + windurst) && sandoria > bastok && sandoria > windurst) && sandoria > 9) ||
            ((bastok > (sandoria + windurst) && bastok > sandoria && bastok > windurst) && bastok > 9) ||
            ((windurst > (sandoria + bastok) && windurst > bastok && windurst > sandoria) && windurst > 9))
        {
            return 1;
        }
        return 0;
    }

    uint8 GetAlliance(uint8 sandoria, uint8 bastok, uint8 windurst, uint8 sandoria_prev, uint8 bastok_prev, uint8 windurst_prev)
    {
        if (sandoria > (bastok + windurst) && sandoria > bastok && sandoria > windurst)
        {
            uint8 ranking = GetBalance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev);
            if ((ranking & 0x03) == 0x01)
                return 1;
        }
        else if (bastok > (sandoria + windurst) && bastok > sandoria && bastok > windurst)
        {
            uint8 ranking = GetBalance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev);
            if ((ranking & 0x0C) == 0x04)
                return 1;
        }
        else if (windurst > (sandoria + bastok) && windurst > bastok && windurst > sandoria)
        {
            uint8 ranking = GetBalance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev);
            if ((ranking & 0x30) == 0x10)
                return 1;
        }
        return 0;
    }

    bool IsAlliance()
    {
        uint8 sandoria = 0;
        uint8 bastok = 0;
        uint8 windurst = 0;
        const char* Query = "SELECT region_control, COUNT(*) FROM conquest_system WHERE region_control < 3 GROUP BY region_control;";

        int32 ret = Sql_Query(SqlHandle, Query);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetIntData(SqlHandle, 0) == 0)
                    sandoria = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 1)
                    bastok = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 2)
                    windurst = Sql_GetIntData(SqlHandle, 1);
            }
        }

        uint8 sandoria_prev = 0;
        uint8 bastok_prev = 0;
        uint8 windurst_prev = 0;

        Query = "SELECT region_control_prev, COUNT(*) FROM conquest_system WHERE region_control_prev < 3 GROUP BY region_control_prev;";

        ret = Sql_Query(SqlHandle, Query);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
        {
            while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
            {
                if (Sql_GetIntData(SqlHandle, 0) == 0)
                    sandoria_prev = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 1)
                    bastok_prev = Sql_GetIntData(SqlHandle, 1);
                else if (Sql_GetIntData(SqlHandle, 0) == 2)
                    windurst_prev = Sql_GetIntData(SqlHandle, 1);
            }
        }

        return GetAlliance(sandoria, bastok, windurst, sandoria_prev, bastok_prev, windurst_prev) == 1;
    }

    /************************************************************************
    *                                                                       *
    *  Оставшееся количество дней до подсчета conquest                      *
    *                                                                       *
    ************************************************************************/

    uint8 GetNexTally()
    {
        auto weekday = CVanaTime::getInstance()->getSysWeekDay();
        uint8 dayspassed = (weekday == 0 ? 6 : weekday - 1) * 25;
        dayspassed += ((CVanaTime::getInstance()->getSysHour() * 60 + CVanaTime::getInstance()->getSysMinute()) * 25 ) / 1440;
        return (uint8)(175 - dayspassed);
    }

    /************************************************************************
    *                                                                       *
    *  Узнаем страну, владеющую данной зоной                                *
    *                                                                       *
    ************************************************************************/

    uint8 GetRegionOwner(REGIONTYPE RegionID)
    {
        const char* Query = "SELECT region_control FROM conquest_system WHERE region_id = %d";

        int32 ret = Sql_Query(SqlHandle, Query, RegionID);

        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            return Sql_GetIntData(SqlHandle, 0);
        }
        return NEUTRAL;
    }

	/************************************************************************
    *                                                                       *
    *  Добавляем персонажу conquest points, основываясь на полученном опыте *
    *                                                                       *
    ************************************************************************/

    // TODO: необходимо учитывать добавленные очки для еженедельного подсчета conquest

    uint32 AddConquestPoints(CCharEntity* PChar, uint32 exp)
    {
        // ВНИМЕНИЕ: не нужно отправлять персонажу CConquestPacket,
        // т.к. клиент сам запрашивает этот пакет через фиксированный промежуток времени

        REGIONTYPE region = PChar->loc.zone->GetRegionID();

        if(region != REGION_UNKNOWN)
        {
            // 10% if region control is player's nation
            // 15% otherwise

            double percentage = PChar->profile.nation == GetRegionOwner(region) ? 0.1 : 0.15;
            percentage += PChar->getMod(Mod::CONQUEST_BONUS) / 100.0;
            uint32 points = (uint32)(exp * percentage);

            charutils::AddPoints(PChar, charutils::GetConquestPointsName(PChar).c_str(), points);
            GainInfluencePoints(PChar, points/2);
        }
        return 0; // added conquest points (пока не вижу в этом определенного смысла)
    }


	//GetConquestInfluence(region,nation)
	//AddConquestInfluence(region,nation)
	//ResetConquestInfluence()
	//UpdateConquestInfluence()

	//gain/loss influence
	//Dying in the Outlands decrease your Allegiance influence and increase the influence of the Beastmen hordes instead.
	//Gain: XP/CP, Garrison quests, Expeditionary Forces, trade items to Outpost Vendors (influence only)

	//Region control
	//0: sandoria
	//1: bastok
	//2: windurst
	//3: beastmen
};