// Initialize Global Mission State
if (isNil "MISSION_STATE") then {
    MISSION_STATE = createHashMap;
    publicVariable "MISSION_STATE";
};

if (isNil "PLATOON_ASSETS") then {
    PLATOON_ASSETS = createHashMap;
    publicVariable "PLATOON_ASSETS";
};

[] spawn {
    [] execVM "scripts\state\medical.sqf";
    [] execVM "scripts\state\platoon.sqf";
};
