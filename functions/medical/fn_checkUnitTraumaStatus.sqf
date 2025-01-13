 params ["_target", "_caller", "_id", "_arguments"];
private _reviveTimeLimit = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME_LIMIT"); // 600
private _traumaStart = _target getVariable "dpc_traumaStart"; // 5
private _traumaTime = time - _traumaStart; // 15 - 5 = 10
private _traumaTimeLeft = _reviveTimeLimit - _traumaTime; // 600 - 10 = 590 seconds left
private _unitReviveTime = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME"); // 60 seconds
// Format time with leading zeros
private _minutes = floor(_traumaTimeLeft / 60); // 205 / 60 = 3
private _seconds = floor(_traumaTimeLeft % 60); // 205 % 60 = 25
private _timeStr = format ["%1:%2", _minutes,_seconds]; // 3:25

// Find nearest medical vehicle/facility
private _nearestMedical = trauma_unit;
private _medicalDist = if (!isNull _nearestMedical) then {
    round(_target distance _nearestMedical)
} else {
    "NO MEDICAL FACILITY NEARBY"
};

hint parseText format [
    "<t size='1.2' color='#ff0000'>URGENT CASUALTY STATUS</t><br/><br/>" +
    "Time Until Critical: %1<br/>" +
    "Distance to FOB: %2m<br/>" +
    "Status: URGENT - Immediate CASEVAC Required",
    _timeStr,
    _medicalDist
];