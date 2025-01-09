// File: functions\medical\fn_handleUnitDeath.sqf
params ["_unit"];

if(!isNil "MISSION_STATE") then {
    private _medicalState = MISSION_STATE get "sys_medical";
    private _deadUnits = _medicalState get "dead_units";
    private _reviveTime = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME_LIMIT");

    if (!isPlayer _unit) then {
        _unit setVariable ["deathTime", time];
        _deadUnits pushBack _unit;

        [_unit, _reviveTime] spawn {
            params ["_unit", "_reviveTime"];
            private _deathTime = _unit getVariable "deathTime";
            
            waitUntil {
                sleep 1;
                if (time - _deathTime >= _reviveTime) then {
                    private _medicalState = MISSION_STATE get "sys_medical";
                    private _deadUnits = _medicalState get "dead_units";
                    _deadUnits = _deadUnits - [_unit];
                    _medicalState set ["dead_units", _deadUnits];
                    deleteVehicle _unit;
                    true
                } else {
                    false
                };
            };
        };
    };
};