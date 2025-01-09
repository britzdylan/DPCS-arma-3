// File: functions\medical\fn_addUnloadBodyAction.sqf
params ["_vehicle"];

// Only add if action doesn't exist
if (_vehicle getVariable ["unloadActionId", -1] == -1) then {
    private _actionId = _vehicle addAction [
        "Unload Casualty",
        {
            params ["_vehicle", "_caller"];
            private _casualties = _vehicle getVariable ["loadedCasualties", []];
            private _maxCasualties = _vehicle getVariable ["maxCasualties", 2];
            
            if (count _casualties > 0) then {
                private _casualty = _casualties select 0;  // Get first casualty
                private _pos = _vehicle modelToWorld [0, -5, 0];
                
                // Remove from array and update count
                _casualties deleteAt 0;
                _vehicle setVariable ["loadedCasualties", _casualties, true];
                _vehicle setVariable ["casualtyCount", count _casualties, true];
                
                // Show casualty
                _casualty setPos _pos;
                _casualty hideObject false;
                
                // Debug output
                systemChat format ["Vehicle now has %1/%2 casualties", count _casualties, _maxCasualties];
                
                // Re-add load action if we were previously full
                if ((count _casualties) + 1 >= _maxCasualties) then {
                    [_vehicle] call DPC_fnc_addLoadBodyAction;
                };
                
                // Remove unload action if no more casualties
                if (count _casualties == 0) then {
                    _vehicle removeAction (_vehicle getVariable "unloadActionId");
                    _vehicle setVariable ["unloadActionId", -1, true];
                };
            };
        },
        nil,
        1.5,
        true,
        true,
        "",
        "count (_target getVariable ['loadedCasualties', []]) > 0"
    ];
    
    // Store the action ID
    _vehicle setVariable ["unloadActionId", _actionId, true];
};