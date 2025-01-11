// File: functions\medical\fn_addLoadBodyAction.sqf
params ["_vehicle"];

// Get vehicle capacity
private _vehicleType = typeOf _vehicle;
private _maxCasualties = (DPC_PLATOON_ASSETS get "vehicle_capacities") getOrDefault [_vehicleType, 2];

_vehicle setVariable ["maxCasualties", _maxCasualties, true];

_vehicle addAction [
    "Load Casualty",
    {
        params ["_vehicle", "_caller", "_actionId", "_deadUnit"];
        
        private _deadUnits = DPC_MISSION_STATE get "sys_medical" get "dead_units";
        private _nearestDead = objNull;
        private _casualties = _vehicle getVariable ["loadedCasualties", []];
        private _maxCasualties = _vehicle getVariable ["maxCasualties", 2];
        
        // Check if vehicle is full
        if (count _casualties >= _maxCasualties) exitWith {
            systemChat format ["Vehicle is full! Maximum capacity: %1", _maxCasualties];
        };
        
        // Find nearest dead unit that isn't already loaded
        {
            if ([_x, _vehicle] call DPC_fnc_canLoadBody && !(_x in _casualties)) exitWith {
                _nearestDead = _x;
            };
        } forEach _deadUnits;
        
        if (!isNull _nearestDead) then {
            _nearestDead hideObject true;
            _casualties pushBack _nearestDead;
            
            // Update vehicle variables
            _vehicle setVariable ["loadedCasualties", _casualties, true];
            _vehicle setVariable ["casualtyCount", count _casualties, true];
            
            // Add unload action if not already present
            if (_vehicle getVariable ["unloadActionId", -1] == -1) then {
                [_vehicle] call DPC_fnc_addUnloadBodyAction;
            };
            
            // Debug output
            systemChat format ["Vehicle now has %1/%2 casualties", count _casualties, _maxCasualties];
            
            // Remove load action if full
            if (count _casualties >= _maxCasualties) then {
                _vehicle removeAction _actionId;
            };
        };
    },
    nil,
    1.5,
    true,
    true,
    "",
    "!isNil 'DPC_MISSION_STATE' && {count (nearestObjects [_target, ['Man'], 10] select {_x in (DPC_MISSION_STATE get 'sys_medical' get 'dead_units') && !(_x in (_target getVariable ['loadedCasualties', []]))}) > 0} && {count (_target getVariable ['loadedCasualties', []]) < (_target getVariable ['maxCasualties', 2])}"
];