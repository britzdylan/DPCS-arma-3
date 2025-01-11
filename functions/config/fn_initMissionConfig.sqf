// File: functions\config\fn_initMissionConfig.sqf

// Initialize Global Mission State
if (isNil "DPC_MISSION_STATE") then {
    DPC_MISSION_STATE = createHashMap;
    publicVariable "DPC_MISSION_STATE";
};

if (isNil "DPC_PLATOON_ASSETS") then {
    DPC_PLATOON_ASSETS = createHashMap;
    publicVariable "DPC_PLATOON_ASSETS";
};
