params ["_unit"];

_unit addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle", "_turret"];
    _vehicle lockCargo false;
}];