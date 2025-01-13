// File: functions\medical\fn_initMedicalSystem.sqf
// Initialize medical state if not exists
if (isNil {DPC_MISSION_STATE get "SYS_MEDICAL"}) then {
    DPC_MISSION_STATE set ["SYS_MEDICAL", createHashMap];
    (DPC_MISSION_STATE get "SYS_MEDICAL") set ["TRAUMA_UNITS", []];
};

[] call DPC_fnc_addDeathHandler;
[] call DPC_fnc_addLoadAction;
// in game building with variable name trauma_unit
[trauma_unit] call DPC_fnc_addReviveAction;