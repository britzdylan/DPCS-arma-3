params [["_artillery", objNull, [objNull]]];
    
// Exit if invalid artillery piece
if (isNull _artillery) exitWith {
    ["No valid artillery piece provided"] call BIS_fnc_error;
    [];
};

// Get available ammo types and current magazine states
private _availableAmmo = getArtilleryAmmo [_artillery];
private _magazineInfo = magazinesAmmo _artillery;
private _ammoTypes = [];

// Process each available ammo type
{
    private _ammoClass = _x;
    private _displayName = getText (configFile >> "CfgMagazines" >> _ammoClass >> "displayName");
    
    // Find matching magazine info
    private _ammoCount = 0;
    {
        _x params ["_magClass", "_count"];
        if (_magClass == _ammoClass) then {
            _ammoCount = _ammoCount + _count;
        };
    } forEach _magazineInfo;
    
    // Add to formatted array
    _ammoTypes pushBack [
        _displayName,  // Human readable name
        _ammoCount,   // Current amount available
        _ammoClass    // Class name for spawning
    ];
} forEach _availableAmmo;

// Return formatted array
_ammoTypes