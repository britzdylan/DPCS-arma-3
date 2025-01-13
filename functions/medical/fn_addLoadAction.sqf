// Add load actions to appropriate vehicles
{
    if (_x isKindOf "Car" || _x isKindOf "Tank" || _x isKindOf "Air") then {
        [_x] call DPC_fnc_addLoadBodyAction;
    };
} forEach vehicles;