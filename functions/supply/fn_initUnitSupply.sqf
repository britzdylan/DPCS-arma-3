private _isEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "ENABLED");
private _isDebug = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DEBUG");
private _isSupplyEnabled = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DPCS_SUPPLY");
if(_isEnabled == 1 && _isSupplyEnabled == 1) then {
    DPCS_PLATOON_DATA = [
        // Format: [squadName, squadGroup, currentStrength, maxStrength, reinforcementsEnRoute]
        ["Bravo 2", bravoTwo, 0, 8, false],
        ["Bravo", Bravo, 0, 8, false],
        ["Charlie", Charlie, 0, 8, false],
        ["HQ", HQ, 0, 4, false]
    ];

    DPCS_REINFORCEMENT_QUEUE = [];  // Tracks pending reinforcements
    DPCS_ACTIVE_REINFORCEMENTS = []; // Tracks active reinforcement operations

    { 
        publicVariable _x 
    } forEach [
        "DPCS_PLATOON_DATA",
        "DPCS_REINFORCEMENT_QUEUE",
        "DPCS_ACTIVE_REINFORCEMENTS"
    ];

if (!isNil "DPC_OpenDialogAction") then {
    player removeAction DPC_OpenDialogAction;
};
DPC_OpenDialogAction = player addAction ["Open Company Command", {[] call DPC_fnc_openCompanyDialog}];
};