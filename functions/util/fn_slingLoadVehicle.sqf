/*
Author: Dylan Britz
Description:
    Creates an AI-controlled helicopter with pre-attached sling load.
    1. Spawns helicopter with vehicle already attached
    2. Moves to dropoff point
    3. Detaches load
    4. Returns to base

Arguments:
    0: <ARRAY> Start position in format [x,y,z]
    1: <ARRAY> Dropoff position in format [x,y,z]
    2: <STRING> Vehicle classname to be transported
    3: <STRING> Helicopter classname to use
    4: <ARRAY> Base position for helicopter return [x,y,z]
    5: <NUMBER> (Optional) Spawn height above start position (default: 100)

Return Value:
    <ARRAY> [_heli, _vehicle] - References to created objects

Example:
    [_startPos, _dropPos, "B_MRAP_01_F", "B_Heli_Transport_03_F", _basePos] call A3A_fnc_aiSlingLoad;
*/

params [
["_startPos", [0,0,0], [[]], [3]],
["_dropPos", [0,0,0], [[]], [3]],
["_vehicleClass", "B_MRAP_01_F", [""]],
["_heliClass", "B_Heli_Transport_03_F", [""]],
["_basePos", [0,0,0], [[]], [3]],
["_spawnHeight", 100, [0]]
];

// Create helicopter at specified height
private _spawnPos = _startPos vectorAdd [0, 0, _spawnHeight];
private _heliGroup = createGroup west;
private _heli = createVehicle [_heliClass, _spawnPos, [], 0, "FLY"];
private _pilot = _heliGroup createUnit ["B_Helipilot_F", [0,0,0], [], 0, "NONE"];
_pilot moveInDriver _heli;
_heliGroup selectLeader _pilot;

// Create vehicle slightly below helicopter
private _vehicle = createVehicle [_vehicleClass, _startPos vectorAdd [0, 0, 20], [], 0, "NONE"];
_vehicle allowDamage false; // Prevent damage during spawn
_heli setSlingLoad _vehicle;

// Wait a frame to ensure sling is properly attached
[_vehicle] spawn {
params ["_vehicle"];
sleep 0.1;
_vehicle allowDamage true;
};

// Set helicopter behavior
{_x disableAI "AUTOCOMBAT"} forEach units _heliGroup;
{_x disableAI "AUTOTARGET"} forEach units _heliGroup;
{_x disableAI "TARGET"} forEach units _heliGroup;
_heliGroup setBehaviour "CARELESS";
_heliGroup setCombatMode "BLUE";

// Function to create waypoint
private _fnc_createWP = {
    params ["_group", "_pos", "_type", "_behavior", "_speed", "_radius", "_index"];
    private _indexDefault = count waypoints _group -1;
    private _customIndex = if (isNil _index) then {_indexDefault} else {_index};
    private _wp = _group addWaypoint [_pos, 0];
    _wp setWaypointType _type;
    _wp setWaypointBehaviour _behavior;
    _wp setWaypointSpeed _speed;
    _wp setWaypointCompletionRadius _radius;
    _wp;
};

// Move to drop position
[_heliGroup, _dropPos, "MOVE", "CARELESS", "NORMAL", 5] call _fnc_createWP;
// Drop sequence
[_fnc_createWP, _heli, _dropPos, _heliGroup, _basePos] spawn {
    params ["_fnc_createWP", "_heli", "_dropPos", "_heliGroup", "_basePos"];
    waitUntil {_heli distance2D _dropPos < 150};
    sleep 1;
    [_heliGroup, _dropPos, "UNHOOK", "CARELESS", "NORMAL", 5] call _fnc_createWP;
    private _wpEnd = [_heliGroup, _basePos vectorAdd [0,0,100], "MOVE", "CARELESS", "NORMAL", 150] call _fnc_createWP;
    _wpEnd setWaypointStatements ["true", "{deleteVehicle (vehicle _x)} forEach thisList; {deleteVehicle _x} forEach thisList"];
    DPCS_SYSUPPLY_IN_PROGRESS = false;
};

[_heli, _vehicle]