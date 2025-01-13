params ["_unit", "_building", "_reviveTime", "_skillPenalty"];

private _startTime = time;
_unit setVariable ["dpc_reviveProgress", 0, true];

while {time - _startTime < 60} do {
    private _progress = ((time - _startTime) / 60) * 100;
    _unit setVariable ["dpc_reviveProgress", _progress, true];
    systemChat format ["%1 Treatment Progress: %2%3", name _unit, floor _progress, "%"];
    sleep 1;
};

// Remove from trauma units
private _traumaUnits = DPC_MISSION_STATE get "SYS_MEDICAL" get "TRAUMA_UNITS";
_traumaUnits = _traumaUnits - [_unit];
(DPC_MISSION_STATE get "SYS_MEDICAL") set ["TRAUMA_UNITS", _traumaUnits];

// Revive unit
_unit setDamage 0;
_unit setUnconscious false;
_unit allowDamage true;
_unit enableAI "ALL";
_unit switchMove "";
_unit setSkill ((skill _unit) - _skillPenalty);
_unit setVariable ["dpc_traumaStart", nil, true];

systemChat format ["%1 has been revived", name _unit];
_unit setVariable ["dpc_reviveProgress", nil, true];