// Add death handlers to all existing units on the players side

private _eligibleUnits = allUnits select {
    private _isValidUnit = 
        alive _x && 
        {!isPlayer _x} && 
        {side _x == playerSide} && 
        {!(_x getVariable ["DPC_IS_EXCLUDED", false])} &&
        {isNil {_x getVariable "DPC_traumaHandler"}};

    if (!_isValidUnit) then {
        diag_log format ["[DPC] Warning: Invalid unit found: %1", _x];
    };

    _isValidUnit
};

{
    private _handlerId = _x addEventHandler ["HandleDamage", {
            params ["_unit", "_selection", "_damage"];
                if (_damage >= 0.9) then {
                    [_unit] call DPC_fnc_handleUnitDeath;
                };
        }];
    _x setVariable ["DPC_traumaHandler", _handlerId];
} forEach _eligibleUnits;