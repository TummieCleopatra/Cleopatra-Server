/*
===========================================================================

Copyright (c) 2018 Darkstar Dev Teams

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

#include "trust_controller.h"

#include "../ai_container.h"
#include "../../status_effect_container.h"
#include "../../enmity_container.h"
#include "../../ai/states/despawn_state.h"
#include "../../entities/charentity.h"
#include "../../entities/trustentity.h"
#include "../../entities/petentity.h"
#include "../../packets/char.h"
#include "../../../common/utils.h"
#include "../../utils/charutils.h"

CTrustController::CTrustController(CCharEntity* PChar, CTrustEntity* PTrust) : CMobController(PTrust)
{
    POwner->PAI->PathFind = std::make_unique<CPathFind>(PTrust);
    m_TickCalc = 0;
    m_LastHealTickTime = m_Tick;
}

CTrustController::~CTrustController()
{
    if (POwner->PAI->IsEngaged())
    {
        POwner->PAI->Internal_Disengage();
    }
    POwner->PAI->PathFind.reset();
    POwner->allegiance = ALLEGIANCE_PLAYER;
}

void CTrustController::Despawn()
{
    if (POwner->PMaster)
    {
        POwner->PMaster = nullptr;
    }
    CController::Despawn();
}

void CTrustController::Tick(time_point tick)
{
    m_Tick = tick;

    if (POwner->PAI->IsEngaged())
    {
        DoCombatTick(tick);
    }
    else if (!POwner->isDead())
    {
        DoRoamTick(tick);
    }
}

void CTrustController::DoCombatTick(time_point tick)
{
    uint32 bodyguard = 0;
    m_TickCalc = 0;
    if (POwner->PMaster != nullptr)
    {
        bodyguard = charutils::GetVar((CCharEntity*)POwner->PMaster,"[TRUST]Bodyguard");
    }
    if (POwner->PMaster == nullptr || POwner->PMaster->isDead())
	{
	    POwner->Die();
        return;
	}
        if ((!POwner->PAI->IsEngaged()) && bodyguard == 2)
        {
            m_CombatEndTime = m_Tick;
            ShowWarning(CL_GREEN"Not In Battle! \n" CL_RESET);
            POwner->PAI->Internal_Disengage();
        }

    if ((!POwner->PMaster->PAI->IsEngaged()) && bodyguard != 2)
    {
        m_CombatEndTime = m_Tick;
        POwner->PAI->Internal_Disengage();
    }
    if (POwner->PMaster->GetBattleTargetID() != POwner->GetBattleTargetID() && bodyguard != 2)
    {
        POwner->PAI->Internal_ChangeTarget(POwner->PMaster->GetBattleTargetID());
    }
    auto PTarget{ POwner->GetBattleTarget() };
    if (PTarget)
    {
        if (POwner->PAI->CanFollowPath())
        {
            POwner->PAI->PathFind->LookAt(PTarget->loc.p);
            std::unique_ptr<CBasicPacket> err;
            if (!POwner->CanAttack(PTarget, err))
            {
                /* This is controlled by the AI Script to decide distance
                if (POwner->speed > 0)
                {
                    POwner->PAI->PathFind->PathAround(PTarget->loc.p, 2.0f, PATHFLAG_WALLHACK | PATHFLAG_RUN);
                    POwner->PAI->PathFind->FollowPath();
                }
                */
            }
        }
		POwner->PAI->EventHandler.triggerListener("COMBAT_TICK", POwner, POwner->PMaster, PTarget);
		luautils::OnMobFight(POwner, PTarget);
    }


}

void CTrustController::DoRoamTick(time_point tick)
{
    uint32 bodyguard = charutils::GetVar((CCharEntity*)POwner->PMaster,"[TRUST]Bodyguard");
    uint32 pull = POwner->GetLocalVar("Pull");
    uint32 targID = POwner->GetLocalVar("TargetID");
    masterHasEnmity = false;

    //ShowWarning(CL_GREEN"Body Guard is set to %u!!\n" CL_RESET, bodyguard);

    if ((POwner->PMaster == nullptr || POwner->PMaster->isDead()) && POwner->isAlive()) {
        POwner->Die();
        return;
    }

    if (POwner->PMaster->PAI->IsEngaged() && bodyguard == 0)
    {
        // Default Behavior, Trusts will only engage when you draw your weapon and have hate
        CCharEntity* PChar = (CCharEntity*)POwner->PMaster;

        for (SpawnIDList_t::iterator it = PChar->SpawnMOBList.begin(); it != PChar->SpawnMOBList.end(); ++it)
        {
            CMobEntity* PMob = (CMobEntity*)it->second;

            if (PMob->PEnmityContainer->HasID(POwner->PMaster->id))
            {
                POwner->PAI->Internal_Engage(POwner->PMaster->GetBattleTargetID());
                POwner->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
                break;
            }
        }
    }
    else if (POwner->PMaster->PAI->IsEngaged() && bodyguard == 1)
    {
        // Weapon Drawn but no hate, Trusts will target the mob
        //ShowWarning(CL_GREEN"I AM IN A BATTLE!!!\n" CL_RESET);
        POwner->PAI->Internal_Engage(POwner->PMaster->GetBattleTargetID());
        POwner->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
    }
    else if (pull == 1 && targID != 0)  // This is for pulling purposes
    {
        POwner->SetBattleTargetID(targID);

        POwner->PAI->Internal_Engage(targID);
        //ShowWarning(CL_GREEN"Battle Target Triggered! %u\n" CL_RESET, targID);
        POwner->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
    }


    else if (bodyguard == 2)
    {
        // Weapon Not Drawn but player has hate
        CCharEntity* PChar = (CCharEntity*)POwner->PMaster;

        for (SpawnIDList_t::iterator it = PChar->SpawnMOBList.begin(); it != PChar->SpawnMOBList.end(); ++it)
        {
            CMobEntity* PMob = (CMobEntity*)it->second;

            if (PMob->PEnmityContainer->HasID(POwner->PMaster->id)) // I have hate and distance is less than 10 from mob
            {
                POwner->PAI->Internal_Engage(POwner->PMaster->GetBattleTargetID());
                POwner->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
                break;
            }
        }


         /*
        if (!masterHasEnmity)
        {
            if (m_TickCalc == 0)
            {
                m_CombatEndTime = m_Tick;
            }
            m_TickCalc = m_TickCalc + 1;

            if (POwner->CanRest() && (m_Tick - m_CombatEndTime > 10s) && (m_Tick - m_LastHealTickTime > 3s))
            {
                if (POwner->TrustRest(m_TickCalc))
                {
                    m_LastHealTickTime = m_Tick;
                    POwner->updatemask |= UPDATE_HP;
                }
            }
        } */

        float currentDistance = distance(POwner->loc.p, POwner->PMaster->loc.p);

        if (currentDistance > RoamDistance && pull != 1)
        {
                //ShowWarning(CL_GREEN"TRY TO ROAM TO PLAYER on Tactics 2\n" CL_RESET);
            if (currentDistance < 50.0f && POwner->PAI->PathFind->PathAround(POwner->PMaster->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
            {
                //ShowWarning(CL_GREEN"FOLLOW PATH on Tactics 2\n" CL_RESET);
                POwner->PAI->PathFind->FollowPath();
            }
            else if (POwner->GetSpeed() > 0)
            {
                POwner->PAI->PathFind->WarpTo(POwner->PMaster->loc.p, RoamDistance);
            }
        }

            //ShowWarning(CL_GREEN"Still Roaming\n" CL_RESET);
        POwner->PAI->EventHandler.triggerListener("ROAM_TICK", POwner, POwner->PMaster, PTarget);
    }
    else
    {

        CCharEntity* PChar = (CCharEntity*)POwner->PMaster;
        // Owner is not engaged, check to see if they have hate to apply healing

        for (SpawnIDList_t::iterator it = PChar->SpawnMOBList.begin(); it != PChar->SpawnMOBList.end(); ++it)
        {
            CMobEntity* PMob = static_cast<CMobEntity*>(it->second);

            if (PMob->PEnmityContainer->HasID(POwner->PMaster->id))
            {
                masterHasEnmity = true;
                break;
            }
        }

        if (!masterHasEnmity)
        {
            if (m_TickCalc == 0)
            {
                m_CombatEndTime = m_Tick;
            }
            m_TickCalc = m_TickCalc + 1;

            if (POwner->CanRest() && (m_Tick - m_CombatEndTime > 10s) && (m_Tick - m_LastHealTickTime > 3s))
            {
                if (POwner->TrustRest(m_TickCalc))
                {
                    m_LastHealTickTime = m_Tick;
                    POwner->updatemask |= UPDATE_HP;
                }
            }
        }






        float currentDistance = distance(POwner->loc.p, POwner->PMaster->loc.p);

        if (currentDistance > RoamDistance)
        {
            ShowWarning(CL_GREEN"TRY TO ROAM TO PLAYER\n" CL_RESET);
            if (currentDistance < 35.0f && POwner->PAI->PathFind->PathAround(POwner->PMaster->loc.p, 2.0f, PATHFLAG_RUN | PATHFLAG_WALLHACK))
            {
                POwner->PAI->PathFind->FollowPath();
            }
            else if (POwner->GetSpeed() > 0)
            {
                POwner->PAI->PathFind->WarpTo(POwner->PMaster->loc.p, RoamDistance);
            }
        }
	    POwner->PAI->EventHandler.triggerListener("ROAM_TICK", POwner, POwner->PMaster, PTarget);
    }


}

bool CTrustController::Cast(uint16 targid, SpellID spellid)
{
    return CMobController::Cast(targid, spellid);
}

bool CTrustController::MobSkill(uint16 targid, uint16 wsid)
{
    if (POwner)
    {
        return CMobController::MobSkill(targid, wsid);
    }
    return false;
}

bool CTrustController::Ability(uint16 targid, uint16 abilityid)
{
    if (POwner)
    {
        return POwner->PAI->Internal_Ability(targid, abilityid);
    }
    return false;
}

bool CTrustController::TrustIsHealing()
{
    bool isTrustHealing = (POwner->StatusEffectContainer->HasStatusEffect(EFFECT_HEALING) == true);

	if (isTrustHealing)
	{
	    return true;
        //ShowWarning(CL_CYAN"TRUST IS ALREADY HEALING\n" CL_RESET);
	}
	else
	{
        POwner->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING, 0, 0, map_config.healing_tick_delay, 0));
        POwner->updatemask |= UPDATE_HP;
        //ShowWarning(CL_GREEN"TRUST UPDATE TO ADD HEALING\n" CL_RESET);
	    return false;
	}
    return isTrustHealing;
}
