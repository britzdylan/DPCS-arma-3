private _isEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "ENABLED");
private _isDebug = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DEBUG");
private _isSupplyEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DPCS_SUPPLY");
if(_isEnabled == 1 && _isSupplyEnabled == 1) then {
    if (!isNil "DPC_OpenDialogAction") then {
        player removeAction DPC_OpenDialogAction;
    };
    DPC_OpenDialogAction = player addAction ["Open Company Command", {[] call DPC_fnc_openCompanyDialog}];
};