// File: functions\medical\fn_initMedicalSystem.sqf

// Initialize medical system constants
DPCS_SYSMED_TRAUMA_UNITS = [];
DPCS_SYSMED_MEDICAL_FACILITIES = [trauma_unit];
DPCS_SYSMED_REVIVE_TIME_LIMIT = 600;     // 10 minutes in seconds
DPCS_SYSMED_REVIVE_TIME = 60;            // 60 seconds to revive
DPCS_SYSMED_MAX_REVIVE_DISTANCE = 20;     // meters from medical building
DPCS_SYSMED_SKILL_PENALTY = 0.1;         // 10% skill reduction after revival
DPCS_SYSMED_MAX_CASEVAC_DISTANCE = 15;   // meters from vehicle
DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY = [2]; // Number of patients that can be treated at once

publicVariable "DPCS_SYSMED_TRAUMA_UNITS";
publicVariable "DPCS_SYSMED_MEDICAL_FACILITIES";
publicVariable "DPCS_SYSMED_REVIVE_TIME_LIMIT";
publicVariable "DPCS_SYSMED_REVIVE_TIME";
publicVariable "DPCS_SYSMED_MAX_REVIVE_DISTANCE";
publicVariable "DPCS_SYSMED_SKILL_PENALTY";
publicVariable "DPCS_SYSMED_MAX_CASEVAC_DISTANCE";
publicVariable "DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY";

[] call DPC_fnc_addDeathHandler;
[] call DPC_fnc_addLoadAction;


// in game building with variable name trauma_unit
[trauma_unit] call DPC_fnc_addReviveAction;

surgeon disableAI "ANIM";      // Prevent AI from changing animations
surgeon disableAI "MOVE";      // Prevent AI from moving
surgeon disableAI "PATH";      // Prevent AI from pathfinding
surgeon disableAI "TARGET";    // Prevent AI from targeting
surgeon disableAI "FSM";       // Prevent AI behavior scriptssurgeon
surgeon switchMove "AinvPknlMstpSnonWnonDr_medic0";

patient disableAI "ANIM";      // Prevent AI from changing animations
patient disableAI "MOVE";      // Prevent AI from moving
patient disableAI "PATH";      // Prevent AI from pathfinding
patient disableAI "TARGET";    // Prevent AI from targeting
patient disableAI "FSM";       // Prevent AI behavior scriptssurgeon
patient switchMove "ainjppnemstpsnonwnondnon_rolltoback";