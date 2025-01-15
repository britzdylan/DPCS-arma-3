// File: functions\medical\fn_initMedicalSystem.sqf

// Initialize medical system constants
DPCS_SYSMED_TRAUMA_UNITS = [];
DPCS_SYSMED_MEDICAL_FACILITIES = [trauma_unit];
DPCS_SYSMED_REVIVE_TIME_LIMIT = 600;     // 10 minutes in seconds
DPCS_SYSMED_REVIVE_TIME = 60;            // 60 seconds to revive
DPCS_SYSMED_MAX_REVIVE_DISTANCE = 20;     // meters from medical building
DPCS_SYSMED_SKILL_PENALTY = 0.1;         // 10% skill reduction after revival
DPCS_SYSMED_MAX_CASEVAC_DISTANCE = 15;   // meters from vehicle
DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY = 2; // Number of patients that can be treated at once

{ 
    publicVariable _x 
} forEach [
    "DPCS_SYSMED_TRAUMA_UNITS",
    "DPCS_SYSMED_MEDICAL_FACILITIES",
    "DPCS_SYSMED_REVIVE_TIME_LIMIT",
    "DPCS_SYSMED_REVIVE_TIME",
    "DPCS_SYSMED_MAX_REVIVE_DISTANCE",
    "DPCS_SYSMED_SKILL_PENALTY",
    "DPCS_SYSMED_MAX_CASEVAC_DISTANCE",
    "DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY"
    ];

[] call DPC_fnc_addDeathHandler;
[] call DPC_fnc_addLoadAction;
{ 
 [_x] call DPC_fnc_addReviveAction;    
} forEach DPCS_SYSMED_MEDICAL_FACILITIES;
[true] call DPC_fnc_startSurgeryAmbientAnim;