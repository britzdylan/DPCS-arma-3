// Initialize Global Mission State
if (isNil "MISSION_STATE") then {
    MISSION_STATE = createHashMap;
    publicVariable "MISSION_STATE";
};

if (isNil "PLATOON_ASSETS") then {
    PLATOON_ASSETS = createHashMap;
    publicVariable "PLATOON_ASSETS";
};

// PLATOON_GROUPS = [
//     group player   // First squad
// ];

// publicVariable "PLATOON_GROUPS";
[] spawn {
    [] execVM "scripts\state\medical.sqf";
    [] execVM "scripts\state\platoon_assets.sqf";
};
