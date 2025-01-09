// File: functions/state/fn_updateState.sqf

/*
    Author: Dylan Britz
    Description: Updates a specific key in a category in the mission state
    
    Returns: None
    
    Example:
    [] call DPCS_fn_updateState ["Medical", "REVIVE_TIME_LIMIT", 600];
*/


private ["_category", "_key", "_value"];
    
if (_category == "") then {
    MISSION_STATE set [_key, _value];
} else {
    private _hash = MISSION_STATE get _category;
    _hash set [_key, _value];
};

publicVariable "MISSION_STATE";