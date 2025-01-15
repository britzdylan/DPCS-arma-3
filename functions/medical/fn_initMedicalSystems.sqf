// File: functions\medical\fn_initMedicalSystem.sqf
private _isEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "ENABLED");
private _isDebug = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DEBUG");
private _isMedicalEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DPCS_MEDICAL");
if(_isEnabled == 1 && _isMedicalEnabled == 1) then {
    // Initialize medical system constants
    DPCS_SYSMED_TRAUMA_UNITS = [];
    DPCS_SYSMED_MEDICAL_FACILITIES = [trauma_unit];
    DPCS_SYSMED_REVIVE_TIME_LIMIT = 600;    
    DPCS_SYSMED_REVIVE_TIME = 60;
    DPCS_SYSMED_MAX_REVIVE_DISTANCE = 20;
    DPCS_SYSMED_SKILL_PENALTY = 0.1;
    DPCS_SYSMED_MAX_CASEVAC_DISTANCE = 15;
    DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY = 2;

    { 
        publicVariable _x 
    } forEach [
        "DPCS_SYSMED_TRAUMA_UNITS",
        "DPCS_SYSMED_MEDICAL_FACILITIES",
        "DPCS_SYSMED_REVIVE_TIME_LIMIT",
        "DPCS_SYSMED_REVIVE_TIME",
        "DPCS_SYSMED_MAX_REVIVE_DISTANCE",
        "DPCS_SYSMED_SKILL_PENALTY",
        "DPCS_SYSMED_MAX_CASEVAC_DISTANCE",
        "DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY"
        ];

    [] call DPC_fnc_addDeathHandler;
    [] call DPC_fnc_addLoadAction;
    { 
    [_x] call DPC_fnc_addReviveAction;    
    } forEach DPCS_SYSMED_MEDICAL_FACILITIES;
    [true] call DPC_fnc_startSurgeryAmbientAnim;
};

if(_isDebug == 1) then {
    systemChat "Medical system initialized";

    player addAction [
        "Debug: Add Casualty",
        {
           // log all allVariables
            private _text = "";

            private _varNames = [
                "TRAUMA_UNITS: ",
                "MEDICAL_FACILITIES: ",
                "REVIVE_TIME_LIMIT: ",
                "REVIVE_TIME: ",
                "MAX_REVIVE_DISTANCE: ",
                "SKILL_PENALTY: ",
                "MAX_CASEVAC_DISTANCE: ",
                "MAX_MEDICAL_FACILITY_CAPACITY: "
            ];

            private _vars = [
                DPCS_SYSMED_TRAUMA_UNITS,
                DPCS_SYSMED_MEDICAL_FACILITIES,
                DPCS_SYSMED_REVIVE_TIME_LIMIT,
                DPCS_SYSMED_REVIVE_TIME,
                DPCS_SYSMED_MAX_REVIVE_DISTANCE,
                DPCS_SYSMED_SKILL_PENALTY,
                DPCS_SYSMED_MAX_CASEVAC_DISTANCE,
                DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY
            ];

            {
                _text = _text + format ["%1%2\n", _varNames select _forEachIndex, _x];
            } forEach _vars;

            copyToClipboard _text;
            systemChat "Debug: All Medical variables copied to clipboard";
        }
    ];
};