params [["_box", objNull, [objNull]]];

if (isNull _box) exitWith {
    diag_log "[DPC] Error: Null box passed to addStaticsToBox";
};

// Clear existing cargo
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

// Static weapon classnames
private _hmgBackpacks = [
    "B_HMG_01_high_weapon_F", 
    "B_HMG_01_support_high_F"
];
private _gmgBackpacks = [
    "B_GMG_01_high_weapon_F",
    "B_HMG_01_support_high_F"
];
private _atBackpacks = [
    "B_AT_01_weapon_F",
    "B_HMG_01_support_F"
];

// Add HMG turrets (8 sets)
{
    _box addBackpackCargoGlobal [_x, 8];
} forEach _hmgBackpacks;

// Add GMG turrets (6 sets)
{
    _box addBackpackCargoGlobal [_x, 6];
} forEach _gmgBackpacks;

// Add AT turrets (6 sets)
{
    _box addBackpackCargoGlobal [_x, 6];
} forEach _atBackpacks;

// Set cargo space
[_box, 30] remoteExecCall ["setMaxLoad", 0, _box];
