params ["_group","_expectedUnits"];

private _currentUnits = units _group apply {typeOf _x};
private _spawnPos = getPos leader _group;
private _missingTypes = [];

// Check which unit types are missing
{
    if !(_x in _currentUnits) then {
        _missingTypes pushBack _x;
    };
} forEach _expectedUnits;

// Spawn and add missing units
{
    private _unit = _group createUnit [_x, _spawnPos, [], 0, "NONE"];
    [_unit] joinSilent _group;
    
    [_group] spawn DPC_fnc_loadoutInfantrySquad;
} forEach _missingTypes;

// Return number of units added
count _missingTypes