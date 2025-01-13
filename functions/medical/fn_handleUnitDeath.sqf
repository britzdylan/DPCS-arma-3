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
        _unit enableAI "ANIM";
        _unit setVariable ["dpc_traumaStart", time]; // 5
        _traumaUnits pushBack _unit;
        // add action to view trauma status
        _unit addAction [
            "<t color='#ff0000'>Check URGENT Casualty</t>",
            [] call DPC_fnc_checkUnitTraumaStatus,
            nil,
            10,
            false,
            true,
            "",
            "_this distance _target < 2"
        ];

        [_unit, _reviveTimeLimit] spawn {
            [] call DPC_fnc_addUnitTraumaStatus;
        };
    };
};

