// File: functions/debug/fn_dumpState.sqf

/*
    Author: Dylan Britz
    Description: Dumps the entire mission state to clipboard for debugging
    
    Returns: None
    
    Example:
    [] call DPC_fnc_dumpState;
*/

if(isNil "MISSION_STATE") then {
    hint "Mission State not initialized";
} else {
    private ["_text", "_stateKeys", "_value"];

    _text = "=== MISSION STATE DUMP ===\n\n";
    _stateKeys = keys MISSION_STATE;

    {
        private _key = _x;
        _value = MISSION_STATE get _key;
        
        // Handle nested hashmaps
        if (_value isEqualType createHashMap) then {
            _text = _text + format["=== %1 ===\n", _key];
            {
                private _subKey = _x;
                private _subValue = _value get _subKey;
                _text = _text + format["  %1: %2\n", _subKey, _subValue];
            } forEach (keys _value);
            _text = _text + "\n";
        } else {
            _text = _text + format["%1: %2\n", _key, _value];
        };
    } forEach _stateKeys;

    copyToClipboard _text;
    hint "Mission State dumped to clipboard";
}

