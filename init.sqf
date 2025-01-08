[] execVM "scripts\state\init.sqf";

player addAction [
    "Dump Mission State", 
    {
        [] call DPCS_fnc_dumpState;
    }, 
    nil, 
    1.5, 
    true, 
    true, 
    "",
    "true", // Condition
    5 // Radius
];