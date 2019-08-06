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

#include "../../common/socket.h"

#include <string.h>

#include "../entities/charentity.h"
#include "../conquest_system.h"

#include "../utils/charutils.h"

#include "conquest_map.h"


CConquestPacket::CConquestPacket(CCharEntity * PChar)
{
	this->type = 0x5E;
	this->size = 0x5A;

    const char* Query = "SELECT region_id, region_control, region_control_prev, \
                         sandoria_influence, bastok_influence, windurst_influence, \
                         beastmen_influence FROM conquest_system;";

    int32 ret = Sql_Query(SqlHandle, Query);

    uint8 sandoria_regions = 0;
    uint8 bastok_regions = 0;
    uint8 windurst_regions = 0;
    uint8 sandoria_prev = 0;
    uint8 bastok_prev = 0;
    uint8 windurst_prev = 0;

    if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
            int regionid = Sql_GetIntData(SqlHandle, 0);
            int region_control = Sql_GetIntData(SqlHandle, 1);
            int region_control_prev = Sql_GetIntData(SqlHandle, 2);

            if (region_control == 0)
                sandoria_regions++;
            else if (region_control == 1)
                bastok_regions++;
            else if (region_control == 2)
                windurst_regions++;

            if (region_control_prev == 0)
                sandoria_prev++;
            else if (region_control_prev == 1)
                bastok_prev++;
            else if (region_control_prev == 2)
                windurst_prev++;

            int32 san_inf = Sql_GetIntData(SqlHandle, 3);
            int32 bas_inf = Sql_GetIntData(SqlHandle, 4);
            int32 win_inf = Sql_GetIntData(SqlHandle, 5);
            int32 bst_inf = Sql_GetIntData(SqlHandle, 6);
            ref<uint8>(0x1A + regionid * 4) = conquest::GetInfluenceRanking(san_inf, bas_inf, win_inf, bst_inf);
            ref<uint8>(0x1B + regionid * 4) = conquest::GetInfluenceRanking(san_inf, bas_inf, win_inf);
            ref<uint8>(0x1C + regionid * 4) = conquest::GetInfluenceGraphics(san_inf, bas_inf, win_inf, bst_inf);
            ref<uint8>(0x1D + regionid * 4) = region_control+1;

            int64 total = san_inf + bas_inf + win_inf;
            int64 totalBeastmen = total + bst_inf;

            if (PChar->loc.zone->GetRegionID() == regionid)
            {
                ref<uint8>(0x86) = (uint8)((san_inf * 100) / (totalBeastmen == 0 ? 1 : totalBeastmen));
                ref<uint8>(0x87) = (uint8)((bas_inf * 100) / (totalBeastmen == 0 ? 1 : totalBeastmen));
                ref<uint8>(0x88) = (uint8)((win_inf * 100) / (totalBeastmen == 0 ? 1 : totalBeastmen));
                ref<uint8>(0x89) = (uint8)((san_inf * 100) / (total == 0 ? 1 : total));
                ref<uint8>(0x8A) = (uint8)((bas_inf * 100) / (total == 0 ? 1 : total));
                ref<uint8>(0x8B) = (uint8)((win_inf * 100) / (total == 0 ? 1 : total));
                ref<uint8>(0x94) = (uint8)((bst_inf * 100) / (totalBeastmen == 0 ? 1 : totalBeastmen));
            }
        }
    }

	ref<uint8>(0x04) = conquest::GetBalance(sandoria_regions, bastok_regions, windurst_regions, sandoria_prev, bastok_prev, windurst_prev);
    ref<uint8>(0x05) = conquest::GetAlliance(sandoria_regions, bastok_regions, windurst_regions, sandoria_prev, bastok_prev, windurst_prev);

	ref<uint8>(0x8C) = conquest::GetNexTally();
    ref<uint32>(0x90) = charutils::GetPoints(PChar, charutils::GetConquestPointsName(PChar).c_str());
	ref<uint8>(0x9C) = 0x01;

	//uint8 packet[] =
    //{
	//    0x80, 0x78, 0x52, 0x03, 0x1a, 0x46, 0x04, 0x00, 0x42, 0x46, 0x04, 0x00, 0x65, 0x3d, 0x04, 0x00
    //};
	//memcpy(data+(0xA0), &packet, 16);

    const char* Nquery = "SELECT id, mamool_ac, troll_ac, undead_ac, mamool_lvl, troll_lvl, \
                          undead_lvl, mamool_status, troll_status, undead_status, mamool_base_status, \
                          mamool_base_forces, mamool_base_mirrors, mamool_base_prisoners, troll_base_status, \
                          troll_base_forces, troll_base_mirrors, troll_base_prisoners, undead_base_status, \
                          undead_base_forces, undead_base_mirrors, undead_base_prisoners FROM besiege_system;";

    int32 res = Sql_Query(SqlHandle, Nquery);


    if (res != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
    {
        while (Sql_NextRow(SqlHandle) == SQL_SUCCESS)
        {
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
            uint16 mbforces = Sql_GetIntData(SqlHandle, 11);
            int8 mbmirrors = Sql_GetIntData(SqlHandle, 12);
            int8 mbprisoners = Sql_GetIntData(SqlHandle, 13);
            int8 tbstatus = Sql_GetIntData(SqlHandle, 14);
            uint16 tbforces = Sql_GetIntData(SqlHandle, 15);
            int8 tbmirrors = Sql_GetIntData(SqlHandle, 16);
            int8 tbprisoners = Sql_GetIntData(SqlHandle, 17);
            int8 ubstatus = Sql_GetIntData(SqlHandle, 18);
            uint16 ubforces = Sql_GetIntData(SqlHandle, 19);
            int8 ubmirrors = Sql_GetIntData(SqlHandle, 20);
            int8 ubprisoners = Sql_GetIntData(SqlHandle, 21);
            //uint16 ubforcesSL = ubforces << 8;
            //uint16 ubforcesSR = ubforces >> 8;
             // ubforcesSL + ubforcesSR; // 1 Pt Each
            ref<uint8>(0xA0) = mlvl * 16;
            ref<uint8>(0xA1) = tlvl + (ulvl * 16);
            ref<uint8>(0xA2) = mstatus + (tstatus * 8) + (ustatus * 64);
            ref<uint8>(0xA3) = 0;

            //ref<uint8>(0xA4) = mbstatus;
            ref<uint16>(0xA4) = mbforces * 8;
            ref<uint8>(0xA6) = mbmirrors;
            ref<uint8>(0xA7) = 0;

            //ref<uint8>(0xA8) = (tbforces * 66);  // +8 per check minimum
            ref<uint16>(0xA8) = tbforces * 8;
            ref<uint8>(0xAA) = tbmirrors;
            ref<uint8>(0xAB) = 0;
            ref<uint16>(0xAC) = (ubforces * 8) + (ulvl * 2048); //Note: 8 = 1point.  1-2048 = Training, 2049-4096
            //ref<uint8>(0xAD) = ubstatus;
            ref<uint8>(0xAE) = 0;
            ref<uint8>(0xAF) = 0;

            ref<uint32>(0xB0) = 0;

            /*
            ref<uint8>(0xA0) = a0; // Levels: Mamool -> (1) 16 (2) 32 (3) 48 (4) 64 (5) 80 (6) 96 (7) 112 (8) 128
            ref<uint8>(0xA1) = a1; // Levels: Trolls and Undead Share this bit.  Trolls->1-12 Undead-> (1) 16 (2) 32 (3) 48 (4) 64 (5) 80 (6) 96 (7) 112 (8) 128.  Add them together. ex: Trolls 5 Undead 7 = 5+112(7)
            ref<uint8>(0xA2) = a2; // Status: Trolls, Mamool, Undead Share this bit.  Mamool-> (0) Training > (1) Advancing > (2) Attack > (3) Retreat | (4) Defense (5) Prepare.  Trolls-> (8/16/24/32/40) Undead (64/128/196/256/320)
            ref<uint8>(0xA3) = a3; // Status: Undead-> (3) defense (4) training (5) defense

            ref<uint8>(0xA4) = a4; // mamool ja: (13) preparation (26) attaque (32) entrainement
            ref<uint8>(0xA5) = a5; // mamool ja: forces ennemies (1=32)
            ref<uint8>(0xA6) = a6; // mamool ja: miroir archaique (1=2)
            ref<uint8>(0xA7) = a7;

            ref<uint8>(0xA8) = a8; // trolls: forces ennemies (66=8)
            ref<uint8>(0xA9) = a9; // trolls: (70) attaque
            ref<uint8>(0xAA) = aa; // trolls: miroir archaique (4=8)
            ref<uint8>(0xAB) = ab;
            ref<uint8>(0xAC) = ac; // undead: forces ennemies (101=12) seems more like 8 = 1
            ref<uint8>(0xAD) = ad; // undead: (61) preparation
            ref<uint8>(0xAE) = ae;
            ref<uint8>(0xAF) = af;
            */
        }
    }

    // Region 0 = Mamool
    // Region 1 =
    // Region 2
    // Region 3

    /*
	ref<uint8>(0xA0) = 16; // Situation: mamool ja niveau -> (1) 16 (2) 32 (3) 48 (4) 64 (5) 80 (6) 96 (7) 112 (8) 128
	ref<uint8>(0xA1) = 17; // Situation: mercenaire trolls niveau -> 1~12 la suite avec un autre
	ref<uint8>(0xA2) = 0; // Situation: mamool ja status du siege -> (0) entrainement > (1) en marche > (2) attaque > (3) retraite | (4) defense (5) preparation
	ref<uint8>(0xA3) = 4; // Situation: undead status du siege ? (3) defense (4) entrainement (5) defense

	ref<uint8>(0xA4) = 0; // mamool ja: (13) preparation (26) attaque (32) entrainement
	ref<uint8>(0xA5) = 0; // mamool ja: forces ennemies (1=32)
	ref<uint8>(0xA6) = 0; // mamool ja: miroir archaique (1=2)
	ref<uint8>(0xA7) = 0;

	ref<uint8>(0xA8) = 0; // trolls: forces ennemies (66=8)
	ref<uint8>(0xA9) = 0; // trolls: (70) attaque
	ref<uint8>(0xAA) = 0; // trolls: miroir archaique (4=8)
	ref<uint8>(0xAB) = 0;
	ref<uint8>(0xAC) = 0; // undead: forces ennemies (101=12)
	ref<uint8>(0xAD) = 0; // undead: (61) preparation
	ref<uint8>(0xAE) = 0; // undead: miroir archaique (4=8)
	ref<uint8>(0xAF) = 0;
    */
	ref<uint32>(0xB0) = charutils::GetPoints(PChar, "imperial_standing");
}
