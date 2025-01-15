params ["_unit", "_reviveTimeLimit"];
private _traumaStart = _unit getVariable "DPCS_SYSMED_TRAUMA_START";

waitUntil {
    sleep 1;
    if (!isNil "_traumaStart" &&
        (time - _traumaStart >= _reviveTimeLimit)) then {
        DPCS_SYSMED_TRAUMA_UNITS = DPCS_SYSMED_TRAUMA_UNITS - [_unit];

        {_unit removeAction _x} forEach (actionIDs _unit); // Remove all actions
        _unit enableAI "ALL";
        _unit setDamage 1;
        true
    } else {
        false
    };
};