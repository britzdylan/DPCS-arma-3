// functions/actions/medical/fn_beginMedicalTreatmentAction.sqf
params [
    "_building", 
    "_caller", 
    "_actionId",
    ["_args", [], [[]]]
];

_args params [
    ["_reviveTime", 600],
    ["_skillPenalty", 0.1],
    ["_casevacDistance", 15],
    ["_maxTreatments", 2]
];

private _currentTreatments = count ((nearestObjects [_building, ["Man"], 15]) select {
    !isNil {_x getVariable "dpc_reviveProgress"}
});

private _nearbyDead = (nearestObjects [_building, ["Man"], _casevacDistance]) select {
    _x in (DPC_MISSION_STATE get "SYS_MEDICAL" get "TRAUMA_UNITS") &&
    isNil {_x getVariable "dpc_reviveProgress"}
};

private _availableSlots = _maxTreatments - _currentTreatments;

if (_availableSlots <= 0) exitWith {
    systemChat "Medical facility at maximum capacity (2 patients)";
};

if (count _nearbyDead > 0) then {
    private _unitsToTreat = _nearbyDead select [0, _availableSlots];
    
    {
        [_x, _building, _reviveTime, _skillPenalty] spawn DPC_fnc_startRevivalProcess;
    } forEach _unitsToTreat;
    
    systemChat format ["Beginning treatment of %1 casualties", count _unitsToTreat];
} else {
    systemChat "No casualties within range of medical facility";
};