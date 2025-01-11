player addAction [
    "Dump Mission State",
    {
        [DPC_MISSION_STATE] call DPC_fnc_dumpState;
    }, 
    nil, 
    1.5, 
    true, 
    true, 
    "",
    "true", // Condition
    5 // Radius
];

player addAction [
    "Dump Platoon State", 
    {
        [DPC_PLATOON_ASSETS] call DPC_fnc_dumpState;
    }, 
    nil, 
    1.5, 
    true, 
    true, 
    "",
    "true", // Condition
    5 // Radius
];