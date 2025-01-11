params ["_unit", "_vehicle"];

private _maxVehicleDistance = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "MAX_CASEVAC_DISTANCE");

// Check if unit is in dead_units and within range: 10m
(!isNil "DPC_MISSION_STATE") &&
{_unit in (DPC_MISSION_STATE get "SYS_MEDICAL" get "TRAUMA_UNITS")} && 
{_unit distance _vehicle < _maxVehicleDistance}
