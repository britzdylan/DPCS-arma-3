params ["_unit", "_vehicle"];

// Check if unit is in dead_units and within range: 10m
(!isNil "MISSION_STATE") && 
{_unit in (MISSION_STATE get "sys_medical" get "dead_units")} && 
{_unit distance _vehicle < 10}
