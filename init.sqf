[] execVM "scripts\state\init.sqf";

player addAction [
    "Dump Mission State",
    {
        [MISSION_STATE] call DPC_fnc_dumpState;
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
        [PLATOON_ASSETS] call DPC_fnc_dumpState;
    }, 
    nil, 
    1.5, 
    true, 
    true, 
    "",
    "true", // Condition
    5 // Radius
];

private _allPlatoonUnits = units group player;

{
    if (!isPlayer _x) then {
        private _handlerId = _x addEventHandler ["Killed", {
            params ["_unit"];
            [_unit] call DPC_fnc_handleUnitDeath;
        }];
        _x setVariable ["DPC_deathHandler", _handlerId];
    };
} forEach _allPlatoonUnits;