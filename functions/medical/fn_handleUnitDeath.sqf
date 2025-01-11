// File: functions\medical\fn_handleUnitDeath.sqf
params ["_unit"];

if(!isNil "DPC_MISSION_STATE") then {
    private _medicalState = DPC_MISSION_STATE get "SYS_MEDICAL";
    private _traumaUnits = _medicalState get "TRAUMA_UNITS";
    private _reviveTimeLimit = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME_LIMIT");

    if (!isPlayer _unit) then {
        _unit allowDamage false;
        _unit setUnconscious true;
        _unit disableAI "ALL";
        _unit setVariable ["dpc_traumaStart", time]; // 5
        _traumaUnits pushBack _unit;
        // add action to view trauma status
               _unit addAction [
            "<t color='#ff0000'>Check URGENT Casualty</t>",
            {
                params ["_target", "_caller", "_id", "_arguments"];
                private _reviveTimeLimit = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME_LIMIT"); // 600
                private _traumaStart = _target getVariable "dpc_traumaStart"; // 5
                private _traumaTime = time - _traumaStart; // 15 - 5 = 10
                private _traumaTimeLeft = _reviveTimeLimit - _traumaTime; // 600 - 10 = 590 seconds left
                
                // Format time with leading zeros
                private _minutes = floor(_traumaTimeLeft / 60); // 205 / 60 = 3
                private _seconds = floor(_traumaTimeLeft % 60); // 205 % 60 = 25
                private _timeStr = format ["%1:%2", _minutes,_seconds]; // 3:25
                
                // Find nearest medical vehicle/facility
                private _nearestMedical = trauma_unit;
                private _medicalDist = if (!isNull _nearestMedical) then {
                    round(_target distance _nearestMedical)
                } else {
                    "NO MEDICAL FACILITY NEARBY"
                };
                
                hint parseText format [
                    "<t size='1.2' color='#ff0000'>URGENT CASUALTY STATUS</t><br/><br/>" +
                    "Time Until Critical: %1<br/>" +
                    "Distance to FOB: %2m<br/>" +
                    "Status: URGENT - Immediate CASEVAC Required",
                    _timeStr,
                    _medicalDist
                ];
            },
            nil,
            10,
            false,
            true,
            "",
            "_this distance _target < 2"
        ];

        [_unit, _reviveTimeLimit] spawn {
            params ["_unit", "_reviveTimeLimit"];
            private _traumaStart = _unit getVariable "dpc_traumaStart";
            
            waitUntil {
                sleep 1;
                if (!isNil "dpc_traumaStart" && 
                    (time - _traumaStart >= _reviveTimeLimit)) then {
                    private _medicalState = DPC_MISSION_STATE get "SYS_MEDICAL";
                    private _traumaUnits = _medicalState get "TRAUMA_UNITS";
                    _traumaUnits = _traumaUnits - [_unit];
                    _medicalState set ["TRAUMA_UNITS", _traumaUnits];

                    {_unit removeAction _x} forEach (actionIDs _unit); // Remove all actions
                    _unit allowDamage true;
                    _unit setUnconscious false;
                    _unit enableAI "ALL";
                    _unit setDamage 1;
                    true
                } else {
                    false
                };
            };
        };
    };
};