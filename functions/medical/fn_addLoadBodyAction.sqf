// File: functions\medical\fn_addLoadBodyAction.sqf
params ["_vehicle"];

private _vehicleType = typeOf _vehicle;

_vehicle addAction [
    "Load Casualty",
    {
        params ["_vehicle", "_caller", "_actionId", "_deadUnit"];
        
        private _traumaUnits = DPC_MISSION_STATE get "SYS_MEDICAL" get "TRAUMA_UNITS";
        private _nearestDead = objNull;

        // Check if vehicle is full
        private _emptyPositions = _vehicle emptyPositions "cargo";
        if (_emptyPositions == 0) exitWith {
            systemChat "Vehicle cargo is full!";
        };
        
        // Find nearest trauma unit that isn't already in passenger seats
        {
            if (_x distance _vehicle < 10 && 
                {!(_x in (crew _vehicle))} && 
                {_x getVariable ["dpc_traumaStart", -1] != -1}) exitWith {
                _nearestDead = _x;
            };
        } forEach _traumaUnits;
        
        if (!isNull _nearestDead) then {
            // load casualty into passenger seat
            _nearestDead moveInCargo _vehicle;
            _nearestDead switchMove "KIA_passenger_boat_holdleft";
            _cargoIndex = _vehicle getCargoIndex _nearestDead;
            _vehicle lockCargo [_cargoIndex, true];
            [_nearestDead] call DPC_fnc_addUnloadBodyAction;
            // Debug output
            systemChat format ["Vehicle now has %1 passenger seats remaining", (_vehicle emptyPositions "cargo")];
            
            // Remove load action if passenger seats are full
            if (_vehicle emptyPositions "cargo" == 0) then {
                _vehicle removeAction _actionId;
            };
        };
    },
    nil,
    1.5,
    true,
    true,
    "",
    "!isNil 'DPC_MISSION_STATE' && {count (nearestObjects [_target, ['Man'], 10] select {_x in (DPC_MISSION_STATE get 'SYS_MEDICAL' get 'TRAUMA_UNITS') && !(_x in (crew _target))}) > 0} && {_target emptyPositions 'cargo' > 0}"
];