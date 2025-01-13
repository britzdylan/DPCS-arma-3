params ["_unit", "_reviveTimeLimit"];
private _traumaStart = _unit getVariable "dpc_traumaStart";

waitUntil {
    sleep 1;
    if (!isNil "_traumaStart" &&
        (time - _traumaStart >= _reviveTimeLimit)) then {
        private _medicalState = DPC_MISSION_STATE get "SYS_MEDICAL";
        private _traumaUnits = _medicalState get "TRAUMA_UNITS";
        _traumaUnits = _traumaUnits - [_unit];
        _medicalState set ["TRAUMA_UNITS", _traumaUnits];

        {_unit removeAction _x} forEach (actionIDs _unit); // Remove all actions
        _unit enableAI "ALL";
        _unit setDamage 1;
        true
    } else {
        false
    };
};