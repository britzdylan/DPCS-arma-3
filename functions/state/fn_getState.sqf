// File: functions/state/fn_getState.sqf

/*
    Author: Dylan Britz
    Description: Retrieves a specific key from a category in the mission state
    
    Returns: hashMap
    
    Example:
    [] call DPCS_fn_getState ["Medical", "REVIVE_TIME_LIMIT"];
*/

private ["_category", "_key"];

if (_category == "") exitWith {
    MISSION_STATE get _key
};

private _hash = MISSION_STATE get _category;
_hash get _key