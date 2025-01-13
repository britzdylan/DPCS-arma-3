params ["_target", "_caller"];

!isNil 'DPC_MISSION_STATE' && 
{count (nearestObjects [_target, ['Man'], 10] select {
    _x in (DPC_MISSION_STATE get 'SYS_MEDICAL' get 'TRAUMA_UNITS') && 
    !(_x in (crew _target))
}) > 0} && 
{_target emptyPositions 'cargo' > 0}

