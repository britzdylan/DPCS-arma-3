params [
    ["_artillery", objNull, [objNull]],
    ["_display", displayNull, [displayNull]],
    ["_ammoListCtrl", controlNull, [controlNull]]
];

// Clear existing items
lbClear _ammoListCtrl;

// Get current ammo status
private _ammoTypes = [_artillery] call DPC_fnc_getArtilleryAmmo;

// Update list box
{
    _x params ["_displayName", "_count", "_class"];
    private _index = _ammoListCtrl lbAdd format ["%1 (x%2)", _displayName, _count];
    _ammoListCtrl lbSetData [_index, _class];
    
    // Optional: Color coding based on ammo count
    if (_count == 0) then {
        _ammoListCtrl lbSetColor [_index, [1,0,0,1]]; // Red if empty
    };
} forEach _ammoTypes;

// Select first item by default
if (lbSize _ammoListCtrl > 0) then {
    _ammoListCtrl lbSetCurSel 0;
};