// File: functions\medical\fn_initMedicalSystem.sqf
// Initialize medical state if not exists
if (isNil {DPC_MISSION_STATE get "SYS_MEDICAL"}) then {
    DPC_MISSION_STATE set ["SYS_MEDICAL", createHashMap];
    (DPC_MISSION_STATE get "SYS_MEDICAL") set ["TRAUMA_UNITS", []];
};

// Add death handlers to all existing units on the players side
{
    if (!isPlayer _x && {(_x getVariable ["DPC_traumaHandler", -1]) == -1}) then {
        private _handlerId = _x addEventHandler ["HandleDamage", {
               params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
                if (_damage >= 0.9) then {
                    [_unit] call DPC_fnc_handleUnitDeath;
                };
            }];
        _x setVariable ["DPC_traumaHandler", _handlerId];
    };
} forEach (allUnits select {side _x == playerSide});

// Add load actions to appropriate vehicles
{
    if (_x isKindOf "Car" || _x isKindOf "Tank" || _x isKindOf "Air") then {
        [_x] call DPC_fnc_addLoadBodyAction;
    };
} forEach vehicles;

// in game building with variable name trauma_unit
[trauma_unit] call DPC_fnc_addReviveAction;