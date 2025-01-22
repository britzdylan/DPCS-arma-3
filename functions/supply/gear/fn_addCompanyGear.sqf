params [["_box", objNull, [objNull]]];

if (isNull _box) exitWith {
    diag_log "[DPC] Error: Null box passed to addCompanyGear";
};

// Clear existing cargo
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

// Company Structure Constants
private _officerCount = 4;      // CO, XO, Supply, Intel
private _squadLeaderCount = 6;  // 6 squad leaders
private _teamLeaderCount = 12;  // 2 per squad
private _medicCount = 7;        // 1 per squad + company medic
private _riflemanCount = 24;    // 4 per squad
private _arCount = 12;          // 2 per squad
private _atCount = 6;          // 1 per squad
private _grenadierCount = 6;    // 1 per squad
private _engineerCount = 2;     // Company engineers
private _rtoCount = 6;          // 1 per squad
private _marksmanCount = 6;     // 1 per squad

// Basic Rifles and Equipment
_box addWeaponCargoGlobal ["arifle_SPAR_01_blk_F", _riflemanCount + _medicCount + _engineerCount];
_box addWeaponCargoGlobal ["arifle_SPAR_01_GL_blk_F", _grenadierCount + _teamLeaderCount];
_box addWeaponCargoGlobal ["arifle_SPAR_01_GL_blk_F", _officerCount];
_box addWeaponCargoGlobal ["arifle_SPAR_03_blk_F", _marksmanCount];
_box addWeaponCargoGlobal ["LMG_Mk200_F", _arCount];

// Pistols
_box addWeaponCargoGlobal ["hgun_P07_F", 50];
_box addWeaponCargoGlobal ["hgun_Pistol_heavy_01_F", _officerCount];

// AT Weapons
_box addWeaponCargoGlobal ["launch_MRAWS_sand_F", _atCount];

// Ammunition
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag", 300];  // Standard rifle mags
_box addMagazineCargoGlobal ["30Rnd_556x45_Stanag_green", 100];  // Tracer mags
_box addMagazineCargoGlobal ["200Rnd_65x39_cased_Box", 50];  // LMG ammo
_box addMagazineCargoGlobal ["20Rnd_762x51_Mag", 100];  // Marksman rifle ammo
_box addMagazineCargoGlobal ["16Rnd_9x21_Mag", 100];  // Standard pistol mags
_box addMagazineCargoGlobal ["11Rnd_45ACP_Mag", 20];  // Officer pistol mags
_box addMagazineCargoGlobal ["MRAWS_HEAT_F", 24];  // AT ammo

// Grenades and Explosives
_box addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", 200];  // GL HE
_box addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", 100];  // GL Smoke
_box addMagazineCargoGlobal ["UGL_FlareWhite_F", 50];  // GL Flares
_box addMagazineCargoGlobal ["HandGrenade", 200];
_box addMagazineCargoGlobal ["SmokeShell", 200];
_box addMagazineCargoGlobal ["SmokeShellRed", 50];
_box addMagazineCargoGlobal ["SmokeShellGreen", 50];
_box addMagazineCargoGlobal ["SmokeShellBlue", 50];
_box addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 10];

// Equipment
_box addItemCargoGlobal ["acc_pointer_IR", 100];  // IR Laser
_box addItemCargoGlobal ["optic_Hamr", 50];  // Standard optic
_box addItemCargoGlobal ["optic_Arco_blk_F", 20];  // AR optic
_box addItemCargoGlobal ["optic_DMS", _marksmanCount];  // Marksman optic
_box addItemCargoGlobal ["bipod_01_F_blk", 30];  // Bipods

// Medical
_box addItemCargoGlobal ["Medikit", _medicCount];
_box addItemCargoGlobal ["FirstAidKit", 200];

// Gear
_box addItemCargoGlobal ["NVGoggles", 100];
_box addItemCargoGlobal ["Binocular", 30];
_box addItemCargoGlobal ["Rangefinder", 10];
_box addItemCargoGlobal ["ItemGPS", 30];
_box addItemCargoGlobal ["B_UavTerminal", 2];
_box addItemCargoGlobal ["ToolKit", 5];
_box addItemCargoGlobal ["MineDetector", 2];

// Communications
_box addBackpackCargoGlobal ["B_RadioBag_01_mtp_F", _rtoCount];
_box addItemCargoGlobal ["ItemRadio", 100];

// Basic Items (1 per person)
{
    _box addItemCargoGlobal [_x, 100];
} forEach [
    "ItemCompass",
    "ItemMap",
    "ItemWatch"
];

// Backpacks
_box addBackpackCargoGlobal ["B_AssaultPack_mcamo", 30];
_box addBackpackCargoGlobal ["B_Kitbag_mcamo", 20];
_box addBackpackCargoGlobal ["B_TacticalPack_mcamo", 10];

// Set cargo space
[_box, 5000] remoteExecCall ["setMaxLoad", 0, _box];