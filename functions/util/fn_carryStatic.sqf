params ["_static", "_player"];

if (_static isKindOf "StaticWeapon" && count crew _static > 0) exitWith {};

// Lock static and disable damage
_static lock true;
_static allowDamage false;

// Set mass very low to prevent physics issues
if (isNil {_static getVariable "originalMass"}) then {
_static setVariable ["originalMass", getMass _static];
};
[_static, 1e-10] remoteExecCall ["setMass", 0];
[_static, false] remoteExecCall ["enableSimulationGlobal", 2];

// Attach static to player
private _bbr = boundingBoxReal _static;
private _p1 = _bbr select 0;
private _p2 = _bbr select 1;
private _height = abs((_p2 select 2) - (_p1 select 2)) + 0.2;

private _heightOffset = _player getVariable ["DPC_heightOffset", 1];
_static attachTo [_player, [0, 1, _heightOffset + 0.1]];

// Add prevent-vehicle eventhandler
private _ehCarry = _player addEventHandler ["GetInMan", {
    params ["_unit"];
    _unit call DPC_fnc_dropStatic;
}];

// Store variables
_player setVariable ["DPC_staticCarried", _static];
_player setVariable ["DPC_carryingStatic", true];
_player setVariable ["DPC_carryEH", _ehCarry];
_player setVariable ["DPC_heightOffset", 0];

// Add drop action
private _dropID = _player addAction [
"Drop Static",
{
    params ["_player"];
    _player call DPC_fnc_dropStatic;
},
nil,
4,
true,
true,
"",
"true"
];
_player setVariable ["DPC_dropAction", _dropID];

// Add elevation action
private _elevateID = _player addAction [
    "Adjust Height",
    {
        params ["_target", "_caller"];
        _caller call DPC_fnc_adjustStaticHeight;
    },
    nil,
    4.8,
    true,
    true,
    "",
    "true"
];
_player setVariable ["DPC_elevateAction", _elevateID];

// Monitor player state
[_player, _static] spawn {
params ["_player", "_static"];
while {_player getVariable ["DPC_carryingStatic", false]} do {
    _player allowSprint false;
    if (!alive _static || !alive _player || lifeState _player == "INCAPACITATED") exitWith {
        if (_player getVariable ["DPC_carryingStatic", false]) then {
            _player call DPC_fnc_dropStatic;
        };
    };
    sleep 0.5;
};
_player allowSprint true;
};