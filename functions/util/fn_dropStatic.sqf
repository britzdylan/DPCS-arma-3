params ["_player"];

private _dropID = _player getVariable ["DPC_dropAction", -1];
private _static = _player getVariable ["DPC_staticCarried", objNull];
private _ehCarry = _player getVariable ["DPC_carryEH", -1];
 private _elevateID = _player getVariable ["DPC_elevateAction", -1];

if (_dropID != -1) then {_player removeAction _dropID};
if (_ehCarry != -1) then {_player removeEventHandler ["GetInMan", _ehCarry]};
if (_elevateID != -1) then {_player removeAction _elevateID};

_player setVariable ["DPC_staticCarried", nil];
_player setVariable ["DPC_carryingStatic", false];
_player setVariable ["DPC_dropAction", nil];
_player setVariable ["DPC_elevateAction", nil];
 _player setVariable ["DPC_heightOffset", nil];
_player setVariable ["DPC_carryEH", nil];

if (!isNull _static) then {
    detach _static;
    
    // Restore original mass
    private _mass = _static getVariable ["DPC_originalMass", 100];
    [_static, _mass] remoteExec ["setMass", _static];
    [_static, true] remoteExec ["enableSimulationGlobal", 2];
    
    // Place properly on ground
    private _pos = getPosATL _static;
    _static setPosATL _pos;
    _static setVectorUp surfaceNormal position _static;
    
    _static lock false;
};