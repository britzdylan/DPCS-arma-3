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