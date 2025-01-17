params ["_player"];

private _static = _player getVariable ["DPC_staticCarried", objNull];
if (isNull _static) exitWith {};

private _currentHeight = _player getVariable ["DPC_heightOffset", 1];
private _newHeight = _currentHeight + 1;
if (_newHeight > 5) then {_newHeight = 1};

_player setVariable ["DPC_heightOffset", _newHeight];

private _bbr = boundingBoxReal _static;
private _p1 = _bbr select 0;
private _p2 = _bbr select 1;
private _height = abs((_p2 select 2) - (_p1 select 2)) + 0.2;

detach _static;
_static attachTo [_player, [0, 1, _newHeight]];