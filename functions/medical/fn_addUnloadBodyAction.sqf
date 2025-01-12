params ["_unit"];

_unit addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    private _index = _vehicle getCargoIndex _unit;
    // Reset animations and unlock cargo
    _unit switchMove "";
    _vehicle lockCargo [_index, false];
}];