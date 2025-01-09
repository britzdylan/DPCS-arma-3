// File: functions\medical\fn_initMedicalSystem.sqf
// Initialize medical state if not exists
if (isNil {MISSION_STATE get "sys_medical"}) then {
    MISSION_STATE set ["sys_medical", createHashMap];
    (MISSION_STATE get "sys_medical") set ["dead_units", []];
};

// Add death handlers to all existing units
{
    if (!isPlayer _x && {(_x getVariable ["DPC_deathHandler", -1]) == -1}) then {
        private _handlerId = _x addEventHandler ["Killed", {
            params ["_unit"];
            [_unit] call DPC_fnc_handleUnitDeath;
        }];
        _x setVariable ["DPC_deathHandler", _handlerId];
    };
} forEach (allUnits select {side _x == playerSide});

// Add load actions to appropriate vehicles
{
    if (_x isKindOf "Car" || _x isKindOf "Tank" || _x isKindOf "Air") then {
        [_x] call DPC_fnc_addLoadBodyAction;
    };
} forEach vehicles;