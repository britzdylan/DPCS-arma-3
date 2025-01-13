params ["_vehicle", "_caller", "_actionId", "_deadUnit"];

private _traumaUnits = DPC_MISSION_STATE get "SYS_MEDICAL" get "TRAUMA_UNITS";
private _nearestDead = objNull;

if (_vehicle emptyPositions "cargo" == 0) exitWith {
    systemChat "Vehicle cargo is full!";
};

{
    if (_x distance _vehicle < 10 && 
        {!(_x in (crew _vehicle))} && 
        {_x getVariable ["dpc_traumaStart", -1] != -1}) exitWith {
        _nearestDead = _x;
    };
} forEach _traumaUnits;

if (!isNull _nearestDead) then {
    _nearestDead moveInCargo _vehicle;
    _nearestDead switchMove "KIA_passenger_boat_holdleft";
    _cargoIndex = _vehicle getCargoIndex _nearestDead;
    _vehicle lockCargo [_cargoIndex, true];
    [_nearestDead] call DPC_fnc_addUnloadBodyAction;
    
    systemChat format ["Vehicle now has %1 passenger seats remaining", 
        (_vehicle emptyPositions "cargo")];
    
    if (_vehicle emptyPositions "cargo" == 0) then {
        _vehicle removeAction _actionId;
    };
};