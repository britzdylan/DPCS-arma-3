// State Management Functions
DPCS_fn_updateState = {
    params ["_category", "_key", "_value"];
    
    if (_category == "") then {
        MISSION_STATE set [_key, _value];
    } else {
        private _hash = MISSION_STATE get _category;
        _hash set [_key, _value];
    };
    
    publicVariable "MISSION_STATE";
};

DPCS_fn_getState = {
    params ["_category", "_key"];
    
    if (_category == "") exitWith {
        MISSION_STATE get _key
    };
    
    private _hash = MISSION_STATE get _category;
    _hash get _key
};

DPCS_fn_getAllState = {
    MISSION_STATE
};

