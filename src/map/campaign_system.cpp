#include "conquest_system.h"
#include "entities/charentity.h"
#include "vana_time.h"
#include "utils/zoneutils.h"
#include "utils/charutils.h"

//#include "packets/conquest_map.h"

#include "lua/luautils.h"
#include "latent_effect_container.h"


namespace campaign
{
	/************************************************************************
    *                                                                       *
    *	UpdateConquestSystem		                                        *
    *                                                                       *
    ************************************************************************/

	void UpdateCampaignSystem()
	{
		zoneutils::ForEachZone([](CZone* PZone)
		{
            //only find chars for zones that have had conquest updated
            if (PZone->GetRegionID() >= 33 && PZone->GetRegionID() <= 40 || PZone->GetRegionID() == 28)
            {
                //ShowWarning(CL_GREEN"Campaign System Triggered!!!!!\n" CL_RESET);
                luautils::OnCampaignUpdate(PZone);
				PZone->ForEachChar([](CCharEntity* PChar)
				{
					PChar->PLatentEffectContainer->CheckLatentsZone();
				});
            }
		});
	}
};