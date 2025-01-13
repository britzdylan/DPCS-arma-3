// File: functions\medical\fn_handleUnitDeath.sqf
params ["_unit"];

if(!isNil "DPC_MISSION_STATE") then {
    private _medicalState = DPC_MISSION_STATE get "SYS_MEDICAL";
    private _traumaUnits = _medicalState get "TRAUMA_UNITS";
    private _reviveTimeLimit = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME_LIMIT");

    if (!isPlayer _unit) then {
        
            // Create radio message based on unit's role and squad
            private _radioMsg = format [
                "Fuck I'm hit!", 
                "ACTUAL"];
            
            // Send radio message using the reporter
            [_unit, _radioMsg] spawn {
                params ["_speaker", "_msg"];
                _speaker sideChat _msg;
            };
            
            // Optional: Add visual radio effect
            private _reporterPos = getPosATL _unit;
            private _radioObj = "Land_HelipadEmpty_F" createVehicle _reporterPos;
            _radioObj say3D ["radioreport", 100];  // You'll need to define this sound
            deleteVehicle _radioObj;

        _unit allowDamage false;
        _unit setUnconscious true;
        _unit disableAI "ALL";
        _unit enableAI "ANIM";
        _unit setVariable ["dpc_traumaStart", time]; // 5
        _traumaUnits pushBack _unit;
        // add action to view trauma status
        _unit addAction [
            "<t color='#ff0000'>Check URGENT Casualty</t>",
            DPC_fnc_checkUnitTraumaStatus,
            nil,
            10,
            false,
            true,
            "",
            "_this distance _target < 2"
        ];
        [_unit, _reviveTimeLimit] spawn {
            params ["_unit", "_reviveTimeLimit"];
            [_unit, _reviveTimeLimit] call DPC_fnc_addUnitTraumaStatus;
        };
    };
};

