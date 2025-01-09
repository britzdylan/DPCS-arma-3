params ["_unit"];

if(!isNil "MISSION_STATE") then {
    private _medicalState = MISSION_STATE get "sys_medical";
    private _deadUnits = _medicalState get "dead_units";
    private _reviveTime = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME_LIMIT");

    if (!isPlayer _unit) then {
        // Store death time and add to dead units array
        _unit setVariable ["deathTime", time];
        _deadUnits pushBack _unit;

        // Start the death timer
        [_unit, _reviveTime] spawn {
            params ["_unit", "_reviveTime"];
            private _deathTime = _unit getVariable "deathTime";
            
            waitUntil {
                sleep 1;
                // Check if time has passed
                if (time - _deathTime >= _reviveTime) then {
                    // Get current dead units array
                    private _medicalState = MISSION_STATE get "sys_medical";
                    private _deadUnits = _medicalState get "dead_units";
                    
                    // Remove unit from revival system if time expires
                    _deadUnits = _deadUnits - [_unit];
                    _medicalState set ["dead_units", _deadUnits];
                    
                    // Handle permanent death
                    deleteVehicle _unit;
                    true
                } else {
                    false
                };
            };
        };
    };
};