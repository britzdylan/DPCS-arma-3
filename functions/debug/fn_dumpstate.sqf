// File: functions/debug/fn_dumpState.sqf

/*
    Author: Dylan Britz
    Description: Dumps the entire mission state to clipboard for debugging
    
    Parameters:
        _state: HashMap - The mission state hashmap to dump
    
    Returns: String - The formatted state dump text
    
    Example:
    [MISSION_STATE] call DPC_fnc_dumpState;
*/

params [["_state", createHashMap, [createHashMap]]];

private _text = "";

if (count _state == 0) then {
    hint "Mission State not initialized";
    _text = "ERROR: Mission State not initialized";
} else {
    private _stateKeys = keys _state;
    
    _text = "=== MISSION STATE DUMP ===\n";
    _text = _text + format["Timestamp: %1\n", [dayTime, "HH:MM:SS"] call BIS_fnc_timeToString];
    _text = _text + format["Number of Keys: %1\n\n", count _stateKeys];

    {
        private _key = _x;
        private _value = _state get _key;
        
        // Handle different value types
        switch (true) do {
            // Handle nested hashmaps
            case (_value isEqualType createHashMap): {
                _text = _text + format["=== %1 ===\n", _key];
                {
                    private _subKey = _x;
                    private _subValue = _value get _subKey;
                    _text = _text + format["  %1: %2\n", _subKey, str _subValue];
                } forEach (keys _value);
                _text = _text + "\n";
            };
            // Handle arrays
            case (_value isEqualType []): {
                _text = _text + format["%1: %2\n", _key, str _value];
            };
            // Handle objects
            case (_value isEqualType objNull): {
                _text = _text + format["%1: %2 (%3)\n", _key, typeOf _value, str _value];
            };
            // Handle everything else
            default {
                _text = _text + format["%1: %2\n", _key, str _value];
            };
        };
    } forEach _stateKeys;
    
    copyToClipboard _text;
    hint "Mission State dumped to clipboard";
};

// Return formatted text
_text