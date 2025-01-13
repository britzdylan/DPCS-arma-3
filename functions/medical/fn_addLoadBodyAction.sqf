// File: functions\medical\fn_addLoadBodyAction.sqf
params ["_vehicle"];
private _conditionStr = "!isNil 'DPC_MISSION_STATE' && {count (nearestObjects [_target, ['Man'], 10] select {_x in (DPC_MISSION_STATE get 'SYS_MEDICAL' get 'TRAUMA_UNITS') && !(_x in (crew _target))}) > 0} && {_target emptyPositions 'cargo' > 0}";

_vehicle addAction [
    "Load Casualty",
    DPC_fnc_loadCasualtyAction,
    nil,
    1.5,
    true,
    true,
    "",
    _conditionStr
];