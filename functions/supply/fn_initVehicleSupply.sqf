private _isEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "ENABLED");
private _isDebug = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DEBUG");
private _isSupplyEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DPCS_SUPPLY");
if(_isEnabled == 1 && _isSupplyEnabled == 1) then {

    DPCS_SYSUPPLY_MRAP_VEHICLE_POOL = 12;
    DPCS_SYSUPPLY_HMG_VEHICLE_POOL = 6;
    DPCS_SYSUPPLY_GMG_VEHICLE_POOL = 3;
    DPCS_SYSUPPLY_QUAD_POOL = 12;
    DPCS_SYSUPPLY_IN_PROGRESS = false;


    { 
        publicVariable _x 
    } forEach [
        "DPCS_SYSUPPLY_MRAP_VEHICLE_POOL",
        "DPCS_SYSUPPLY_HMG_VEHICLE_POOL",
        "DPCS_SYSUPPLY_GMG_VEHICLE_POOL",
        "DPCS_SYSUPPLY_QUAD_POOL"
    ];

    player addAction [
        "Request Vehicle Supply",
        DPC_fnc_openVehicleSupplyDialog,
        nil,
        1.5,
        true,
        true,
        "",
        "true"
    ];
};

if(_isDebug == 1) then {
    systemChat "Vehicle Supply system initialized";

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