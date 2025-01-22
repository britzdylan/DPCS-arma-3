private _isEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "ENABLED");
private _isDebug = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DEBUG");
private _isSupplyEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DPCS_SUPPLY");

if(_isEnabled == 1 && _isSupplyEnabled == 1) then {
    DPCS_SYSUPPLY_MRAP_VEHICLE_POOL = 12;
    DPCS_SYSUPPLY_HMG_VEHICLE_POOL = 6;
    DPCS_SYSUPPLY_GMG_VEHICLE_POOL = 3;
    DPCS_SYSUPPLY_QUAD_POOL = 12;
    DPCS_SYSUPPLY_IN_PROGRESS = false;
    DPCS_SYSSUPPLY_SQUADS = [
        gulf, squad_1, squad_1_1, squad_1_2, squad_1_3, squad_2, squad_2_1, squad_2_2, squad_2_3, squad_3, squad_3_1, squad_3_2, squad_3_3, squad_4, squad_4_1, squad_4_2, squad_4_3, squad_4_4, squad_4_5, squad_4_6
    ];
    DPCS_SYSSUPPLY_INFANTRY_CALLSIGNS = [
        "Alpha 1-1", "Alpha 1-2", "Alpha 1-3", "Bravo 2-1", "Bravo 2-2", "Bravo 2-3", "Charlie 3-1", "Charlie 3-2", "Charlie 3-3", "Delta 4-1", "Delta 4-2", "Delta 4-3", "Delta 4-4", "Delta 4-5", "Delta 4-6"
    ];
    DPCS_SYSSUPPLY_PLATOON_CALLSIGNS = [
        "Alpha Main", "Bravo Main", "Charlie Main", "Delta Main"
    ];
    
    { 
        publicVariable _x 
    } forEach [
        "DPCS_SYSUPPLY_MRAP_VEHICLE_POOL",
        "DPCS_SYSUPPLY_HMG_VEHICLE_POOL",
        "DPCS_SYSUPPLY_GMG_VEHICLE_POOL",
        "DPCS_SYSUPPLY_QUAD_POOL",
        "DPCS_SYSSUPPLY_SQUADS",
        "DPCS_SYSSUPPLY_INFANTRY_CALLSIGNS",
        "DPCS_SYSSUPPLY_PLATOON_CALLSIGNS"
    ];

    if (!isNil "DPC_OpenVehicleSupplyDialogAction") then {
        player removeAction DPC_OpenVehicleSupplyDialogAction;
    };

    DPC_OpenVehicleSupplyDialogAction = player addAction [
        "Request Vehicle Supply",
        {[] call DPC_fnc_openVehicleSupplyDialog}
    ];

    if (!isNil "DPC_OpenCompanyDialogAction") then {
        player removeAction DPC_OpenCompanyDialogAction;
    };

    DPC_OpenCompanyDialogAction = player addAction ["Open Company Command", {[] call DPC_fnc_openCompanySupplyDialog}];

    [company_gear] call DPC_fnc_addCompanyGear; // Add company gear to crate
    [turret_supply] call DPC_fnc_turretsSupply; // Add turrets to crate
    [] call DPC_fnc_setupLoadouts; // Setup loadouts
};

if(_isEnabled == 1 && _isDebug == 1  && _isSupplyEnabled == 1) then {
    systemChat "Supply system initialized";

    player addAction [
        "Debug: Request Vehicle",
        {
           // log all allVariables
            private _text = "";

            private _varNames = [
                "MRAP_VEHICLE_POOL: ",
                "HMG_VEHICLE_POOL: ",
                "GMG_VEHICLE_POOL: ",
                "QUAD_POOL: "
            ];

            private _vars = [
                DPCS_SYSUPPLY_MRAP_VEHICLE_POOL,
                DPCS_SYSUPPLY_HMG_VEHICLE_POOL,
                DPCS_SYSUPPLY_GMG_VEHICLE_POOL,
                DPCS_SYSUPPLY_QUAD_POOL
            ];

            {
                _text = _text + format ["%1%2\n", _varNames select _forEachIndex, _x];
            } forEach _vars;

            copyToClipboard _text;
            systemChat "Debug: All Vehicle supply variables copied to clipboard";
        }
    ];
};