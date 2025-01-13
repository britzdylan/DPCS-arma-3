// File: functions\medical\fn_addLoadBodyAction.sqf
params ["_vehicle"];

_vehicle addAction [
    "Load Casualty",
    DPC_fn_loadCasualtyAction,
    nil,
    1.5,
    true,
    true,
    "",
    DPC_fnc_canLoadCasualty
];