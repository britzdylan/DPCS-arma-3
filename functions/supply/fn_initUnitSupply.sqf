private _isEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "ENABLED");
private _isDebug = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DEBUG");
private _isSupplyEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DPCS_SUPPLY");
if(_isEnabled == 1 && _isSupplyEnabled == 1) then {
    DPCS_SYSSUPPLY_SQUADS = [
        gulf, squad_1, squad_1_1, squad_1_2, squad_1_3, squad_2, squad_2_1, squad_2_2, squad_2_3, squad_3, squad_3_1, squad_3_2, squad_3_3, squad_4, squad_4_1, squad_4_2, squad_4_3, squad_4_4, squad_4_5, squad_4_6
    ];
    publicVariable "DPCS_SYSSUPPLY_SQUADS";

    if (!isNil "DPC_OpenDialogAction") then {
        player removeAction DPC_OpenDialogAction;
    };
    DPC_OpenDialogAction = player addAction ["Open Company Command", {[] call DPC_fnc_openCompanyDialog}];
    [company_gear] call DPC_fnc_addCompanyGear;
};