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

#include "../common/showmsg.h"

#include "utils/guildutils.h"
#include "utils/instanceutils.h"
#include "time_server.h"
#include "timetriggers.h"
#include "transport.h"
#include "vana_time.h"
#include "utils/zoneutils.h"
#include "conquest_system.h"
#include "campaign_system.h"
#include "lua/luautils.h"
#include "entities/charentity.h"
#include "latent_effect_container.h"


int32 time_server(time_point tick,CTaskMgr::CTask* PTask)
{
    TIMETYPE VanadielTOTD = CVanaTime::getInstance()->SyncTime();
    // uint8 WeekDay = (uint8)CVanaTime::getInstance()->getWeekday();

    // weekly update for conquest (sunday at midnight)
    if (CVanaTime::getInstance()->getSysWeekDay() == 1  && CVanaTime::getInstance()->getSysHour() == 0 && CVanaTime::getInstance()->getSysMinute() == 0)
    {
        if (tick > (CVanaTime::getInstance()->lastConquestTally + 1h))
        {
            conquest::UpdateWeekConquest();
            CVanaTime::getInstance()->lastConquestTally = tick;
        }
    }
    // hourly conquest update
    else if (CVanaTime::getInstance()->getSysMinute() == 0)
    {
        if (tick > (CVanaTime::getInstance()->lastConquestUpdate + 1h))
        {
            conquest::UpdateConquestSystem();
            CVanaTime::getInstance()->lastConquestUpdate = tick;
        }
    }
    // 6 min Campaign Update
    /*
    else if (CVanaTime::getInstance()->getSysMinute() == 3 || CVanaTime::getInstance()->getSysMinute() == 9 || CVanaTime::getInstance()->getSysMinute() == 15 ||
    CVanaTime::getInstance()->getSysMinute() == 21 || CVanaTime::getInstance()->getSysMinute() == 27 || CVanaTime::getInstance()->getSysMinute() == 33 ||
    CVanaTime::getInstance()->getSysMinute() == 39 || CVanaTime::getInstance()->getSysMinute() == 45 || CVanaTime::getInstance()->getSysMinute() == 51 ||
    CVanaTime::getInstance()->getSysMinute() == 57)
    {*/
    else if (CVanaTime::getInstance()->getSysMinute() == 6 || CVanaTime::getInstance()->getSysMinute() == 6 || CVanaTime::getInstance()->getSysMinute() == 9 ||
    CVanaTime::getInstance()->getSysMinute() == 12 || CVanaTime::getInstance()->getSysMinute() == 15 || CVanaTime::getInstance()->getSysMinute() == 18 ||
    CVanaTime::getInstance()->getSysMinute() == 21 || CVanaTime::getInstance()->getSysMinute() == 24 || CVanaTime::getInstance()->getSysMinute() == 27 ||
    CVanaTime::getInstance()->getSysMinute() == 30 || CVanaTime::getInstance()->getSysMinute() == 33 || CVanaTime::getInstance()->getSysMinute() == 36 ||
    CVanaTime::getInstance()->getSysMinute() == 39 || CVanaTime::getInstance()->getSysMinute() == 42 || CVanaTime::getInstance()->getSysMinute() == 45 ||
    CVanaTime::getInstance()->getSysMinute() == 48 || CVanaTime::getInstance()->getSysMinute() == 51 || CVanaTime::getInstance()->getSysMinute() == 54 ||
    CVanaTime::getInstance()->getSysMinute() == 57 || CVanaTime::getInstance()->getSysMinute() == 59 || CVanaTime::getInstance()->getSysMinute() == 01)
    {
        if (tick > (CVanaTime::getInstance()->lastCampaignUpdate + 2min))
        {
            ShowDebug(CL_CYAN"Besiege/Campaign Update \n" CL_RESET);
            conquest::UpdateBesiegeMap();
            campaign::UpdateCampaignSystem();
            CVanaTime::getInstance()->lastCampaignUpdate = tick;
        }
    }

    if (CVanaTime::getInstance()->getMinute() == 0)
    {
        if (tick > (CVanaTime::getInstance()->lastVHourlyUpdate + 4800ms))
        {
			zoneutils::ForEachZone([](CZone* PZone)
            {
                luautils::OnGameHour(PZone);
				PZone->ForEachChar([](CCharEntity* PChar)
				{
					PChar->PLatentEffectContainer->CheckLatentsHours();
					PChar->PLatentEffectContainer->CheckLatentsMoonPhase();
				});
			});

            CVanaTime::getInstance()->lastVHourlyUpdate = tick;
        }

    }

    //Midnight
    if (CVanaTime::getInstance()->getSysHour() == 0 && CVanaTime::getInstance()->getSysMinute() == 0)
    {
		int32 ahfees = 100;
		const int8* Query = "SELECT SUM(quantity), bazaar, itemID  FROM `char_inventory` WHERE itemID = '65535'";
		int32 ret = Sql_Query(SqlHandle, Query);
		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			ahfees = (int32)Sql_GetIntData(SqlHandle, 0);
			//ahfees = ahfees / 1000000;
			ShowWarning(CL_CYAN"Running daily Gil analytics.  Total Gil is: %i \n" CL_RESET, ahfees);
			uint32 calltime = time(nullptr);
			Sql_Query(SqlHandle, "INSERT INTO server_gil (call_date, gil_value) VALUES (%u, %u);",calltime, ahfees);
		}
        if (tick > (CVanaTime::getInstance()->lastMidnight + 1h))
        {
            guildutils::UpdateGuildPointsPattern();
            CVanaTime::getInstance()->lastMidnight = tick;
        }
    }

    // 3Hr Player analytics
    if ((CVanaTime::getInstance()->getSysHour() == 0 || CVanaTime::getInstance()->getSysHour() == 3 || CVanaTime::getInstance()->getSysHour() == 6 ||
    CVanaTime::getInstance()->getSysHour() == 9 || CVanaTime::getInstance()->getSysHour() == 12 || CVanaTime::getInstance()->getSysHour() == 15 ||
    CVanaTime::getInstance()->getSysHour() == 18 || CVanaTime::getInstance()->getSysHour() == 21) && CVanaTime::getInstance()->getSysMinute() == 0)
	//if (CVanaTime::getInstance()->getSysSecond() == 30)
    {
		int32 online = 100;
		const int8* Query = "SELECT COUNT(accid), charid FROM `accounts_sessions`";
		int32 ret = Sql_Query(SqlHandle, Query);
		if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		{
			online = (int32)Sql_GetIntData(SqlHandle, 0);
			//ahfees = ahfees / 1000000;
			ShowWarning(CL_CYAN"Running 3 Hour player analytics.  Total Online is: %i \n" CL_RESET, online);
			uint32 calltime = time(nullptr);
			Sql_Query(SqlHandle, "INSERT INTO total_online (call_date, players_online) VALUES (%u, %u);",calltime, online);
		}
        if (tick > (CVanaTime::getInstance()->lastMidnight + 60000))
        {
            guildutils::UpdateGuildPointsPattern();
            CVanaTime::getInstance()->lastMidnight = tick;
        }
    }

    if (CVanaTime::getInstance()->getHour() == 0 && CVanaTime::getInstance()->getMinute() == 0)
    {
        if (tick > (CVanaTime::getInstance()->lastVDailyUpdate + 4800ms))
        {
			zoneutils::ForEachZone([](CZone* PZone)
			{
                luautils::OnGameDay(PZone);
				PZone->ForEachChar([](CCharEntity* PChar)
				{
					PChar->PLatentEffectContainer->CheckLatentsWeekDay();
				});
			});

            guildutils::UpdateGuildsStock();
            zoneutils::SavePlayTime();

            CVanaTime::getInstance()->lastVDailyUpdate = tick;
        }
    }

    if (VanadielTOTD != TIME_NONE)
    {
        zoneutils::TOTDChange(VanadielTOTD);

        if ((VanadielTOTD == TIME_DAY) || (VanadielTOTD == TIME_DUSK) || (VanadielTOTD == TIME_NIGHT))
        {
			zoneutils::ForEachZone([](CZone* PZone)
			{
				PZone->ForEachChar([](CCharEntity* PChar)
				{
					PChar->PLatentEffectContainer->CheckLatentsDay();
					PChar->PLatentEffectContainer->CheckLatentsJobLevel();
				});
			});
        }
    }

    CTriggerHandler::getInstance()->triggerTimer();
    CTransportHandler::getInstance()->TransportTimer();

	instanceutils::CheckInstance();
    return 0;
}