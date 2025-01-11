// File: functions\init\fn_initPlatoonUnits.sqf

/*
    Author: Your Name
    Description: Initializes platoon units into mission state and adds necessary event handlers
    
    Parameters:
        _groups: Array - Array of groups to initialize [group1, group2, ...]
    
    Returns: None
    
    Example:
    [PLATOON_GROUPS] call DPC_fnc_initPlatoonUnits;
*/

params [["_groups", [], [[]]]];

private _medicalState = DPC_MISSION_STATE get "sys_medical";
if (isNil "_medicalState") then {
    _medicalState = createHashMap;
    DPC_MISSION_STATE set ["sys_medical", _medicalState];
    _medicalState set ["dead_units", []];
};

// Get platoon state
private _platoonState = DPC_MISSION_STATE get "platoon";
if (isNil "_platoonState") then {
    _platoonState = createHashMap;
    DPC_MISSION_STATE set ["platoon", _platoonState];
    _platoonState set ["all_units", []];
    _platoonState set ["active_units", []];
};

// Process each group
{
    private _group = _x;
    private _groupUnits = units _group;
    
    // Add units to platoon state
    {
        private _unit = _x;
        
        // Skip if unit is already initialized
        if !(_unit getVariable ["DPC_initialized", false]) then {
            // Add to all units array if not already present
            if !(_unit in (_platoonState get "all_units")) then {
                (_platoonState get "all_units") pushBack _unit;
            };
            
            // Add to active units if alive
            if (alive _unit) then {
                (_platoonState get "active_units") pushBack _unit;
            };
            
            // Add death event handler
            if (!isPlayer _unit) then {
                private _handlerId = _unit addEventHandler ["Killed", {
                    params ["_unit"];
                    [_unit] call DPC_fnc_handleUnitDeath;
                }];
                _unit setVariable ["DPC_deathHandler", _handlerId];
            };
            
            // Mark as initialized
            _unit setVariable ["DPC_initialized", true];
            
            // Set additional unit variables as needed
            _unit setVariable ["DPC_originalGroup", group _unit];
            _unit setVariable ["DPC_originalRole", roleDescription _unit];
        };
    } forEach _groupUnits;
} forEach _groups;

// Debug output
// if (DPC_DEBUG) then {
//     private _totalUnits = count (_platoonState get "all_units");
//     private _activeUnits = count (_platoonState get "active_units");
//     systemChat format ["Platoon initialized: %1 total units, %2 active", _totalUnits, _activeUnits];
    
//     // Detailed debug dump
//     [DPC_MISSION_STATE] call DPC_fnc_dumpState;
// };