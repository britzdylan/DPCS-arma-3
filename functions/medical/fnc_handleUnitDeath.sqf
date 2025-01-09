private ["_unit"];

private _deadUnits = DPC_fn_getState ["sys_medical", "dead_units"];
private _reviveTime = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME_LIMIT");

if (!isPlayer _unit) then {
    // Store death time and add to dead units array
    _unit setVariable ["deathTime", time];
    _deadUnits pushBack _unit;
    DPC_fn_updateState ["sys_medical", "dead_units", _deadUnits];

    // Start the death timer
    [_unit] spawn {
        params ["_unit"];
        private _deathTime = _unit getVariable "deathTime";
        waitUntil {
            sleep 1;
            // Check if 5 minutes have passed
            if (time - _deathTime >= _reviveTime) then {
                // Remove unit from revival system if time expires
                _deadUnits = _deadUnits - [_unit];
                // Handle permanent death
                deleteVehicle _unit;
                DPC_fn_updateState ["sys_medical", "dead_units", _deadUnits];
                true
            } else {
                false
            };
        };
    };
};