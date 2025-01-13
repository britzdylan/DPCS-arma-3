params ["_target", "_caller"];

private _maxVehicleDistance = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "MAX_CASEVAC_DISTANCE");


!isNil 'DPC_MISSION_STATE' && 
{count (nearestObjects [_target, ['Man'], _maxVehicleDistance] select {
    _x in (DPC_MISSION_STATE get 'SYS_MEDICAL' get 'TRAUMA_UNITS') && 
    !(_x in (crew _target))
}) > 0} && 
{_target emptyPositions 'cargo' > 0}

