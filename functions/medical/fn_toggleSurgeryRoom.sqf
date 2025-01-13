// File: fn_toggleSurgeryRoom.sqf
params [["_show", true, [true]]];

// Array of all object variable names to manage
private _objectNames = [
    "surgery_1",
    "surgery_2",
    "surgery_3",
    "surgery_4",
    "surgery_5",
    "surgery_6",
    "surgen",
    "surgeon_1",
    "patient"
];

{
    // Get the object from its variable name
    private _object = missionNamespace getVariable [_x, objNull];
    
    // Check if object exists
    if (!isNull _object) then {
        _object hideObject !_show;
        _object enableSimulation _show;
    } else {
        diag_log format ["[Surgery Room] Object not found: %1", _x];
    };
} forEach _objectNames;

// Usage examples:
// Show and enable everything:
// [] call fn_toggleSurgeryRoom;
// or
// [true] call fn_toggleSurgeryRoom;

// Hide and disable everything:
// [false] call fn_toggleSurgeryRoom;