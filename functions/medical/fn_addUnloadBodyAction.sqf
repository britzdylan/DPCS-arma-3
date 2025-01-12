params ["_unit"];

_unit addEventHandler ["GetOut", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    // Reset animations and unlock cargo
    _unit switchMove "";
    {
        private _index = _vehicle getCargoIndex _unit;
        _vehicle lockCargo false;
    } forEach ([0, (_vehicle emptyPositions "cargo") - 1] call BIS_fnc_numberRange);
}];