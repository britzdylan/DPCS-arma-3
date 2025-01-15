// File: functions\medical\fn_addLoadBodyAction.sqf
params ["_vehicle"];
private _conditionStr = "
private _nearbyUnits = nearestObjects [_target, ['Man'], DPCS_SYSMED_MAX_CASEVAC_DISTANCE];
private _loadableCasualties = count (_nearbyUnits select {
    _x in DPCS_SYSMED_TRAUMA_UNITS && 
    !(_x in (crew _target))
}) > 0;
_loadableCasualties && {_target emptyPositions 'cargo' > 0}
";

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