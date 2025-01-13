// Add death handlers to all existing units on the players side
{
    if (!isPlayer _x && {(_x getVariable ["DPC_traumaHandler", -1]) == -1}) then {
        private _handlerId = _x addEventHandler ["HandleDamage", {
               params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
                    if (_damage >= 0.9) then {
                        [_unit] call DPC_fnc_handleUnitDeath;
                    };
            }];
        _x setVariable ["DPC_traumaHandler", _handlerId];
    };
} forEach (allUnits select {side _x == playerSide});