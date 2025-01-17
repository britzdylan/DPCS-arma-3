/*
Structure:
- HQ Element (4): PL, PSG, RTO, Medic
- 3x Infantry Squads (9 each): SL, 2x Fire Teams (TL, AR, GR, R)
- Weapons Squad (8): SL, 2x MG Teams (Team Leader, Gunner, Assistant Gunner, Ammo Bearer)
Total: 39 personnel
*/


params [["_box", objNull, [objNull]]];

if (isNull _box) exitWith {
    diag_log "[DPC] Error: Null box passed to addPlatoonGear";
};

// Clear existing cargo
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearItemCargoGlobal _box;
clearBackpackCargoGlobal _box;

// Weapons
private _rifleCount = 25;         // Standard riflemen
private _glCount = 6;             // Grenadiers (2 per squad)
private _arCount = 6;             // Auto Riflemen (2 per squad)
private _mgCount = 4;             // Machine Gunners (2 teams in weapons squad)
private _tlRifleCount = 8;        // TL rifles (modified with better optics)
private _pistolCount = 8;         // Officers and senior NCOs

// Basic Rifles and Ammo
_box addWeaponCargoGlobal ["arifle_MX_F", _rifleCount];
_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag", _rifleCount * 10];

// Team Leader Rifles
_box addWeaponCargoGlobal ["arifle_MX_Black_F", _tlRifleCount];
_box addMagazineCargoGlobal ["30Rnd_65x39_caseless_black_mag", _tlRifleCount * 10];

// Grenadier Weapons and Ammo
_box addWeaponCargoGlobal ["arifle_MX_GL_F", _glCount];
_box addMagazineCargoGlobal ["1Rnd_HE_Grenade_shell", _glCount * 12];
_box addMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell", _glCount * 4];
_box addMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell", _glCount * 2];
_box addMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", _glCount * 2];
_box addMagazineCargoGlobal ["UGL_FlareWhite_F", _glCount * 4];

// Auto Rifles and Ammo
_box addWeaponCargoGlobal ["arifle_MX_SW_F", _arCount];
_box addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag", _arCount * 6];
_box addItemCargoGlobal ["bipod_01_F_blk", _arCount];

// Machine Guns and Ammo
_box addWeaponCargoGlobal ["MMG_02_black_F", _mgCount];
_box addMagazineCargoGlobal ["130Rnd_338_Mag", _mgCount * 8];

// Pistols for Officers/NCOs
_box addWeaponCargoGlobal ["hgun_P07_F", _pistolCount];
_box addMagazineCargoGlobal ["16Rnd_9x21_Mag", _pistolCount * 3];

// Launchers
_box addWeaponCargoGlobal ["launch_NLAW_F", 6];         // 2 per squad
_box addWeaponCargoGlobal ["launch_MRAWS_green_F", 2];  // Weapons squad
_box addMagazineCargoGlobal ["MRAWS_HEAT_F", 8];

// Grenades and Explosives
_box addMagazineCargoGlobal ["HandGrenade", 80];        // ~2 per person
_box addMagazineCargoGlobal ["SmokeShell", 80];         // ~2 per person
_box addMagazineCargoGlobal ["SmokeShellRed", 12];
_box addMagazineCargoGlobal ["SmokeShellGreen", 12];
_box addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 4];
_box addItemCargoGlobal ["ACE_M26_Clacker", 2];

// Medical Supplies
_box addItemCargoGlobal ["Medikit", 4];                 // Medics
_box addItemCargoGlobal ["FirstAidKit", 40];            // 1 per person + extra

// Equipment
_box addItemCargoGlobal ["Binocular", 12];              // Leaders
_box addItemCargoGlobal ["Rangefinder", 2];             // PL and PSG
_box addItemCargoGlobal ["ItemGPS", 12];                // Leaders
_box addItemCargoGlobal ["B_UavTerminal", 1];           // PL

// Radios (if TFAR is used)
_box addBackpackCargoGlobal ["B_RadioBag_01_mtp_F", 2];     // Long range
_box addItemCargoGlobal ["ItemRadio", 39];                   // Short range

// Additional Items
_box addItemCargoGlobal ["acc_pointer_IR", 39];             // 1 per person
_box addItemCargoGlobal ["optic_Hamr", 20];                 // For key positions
_box addItemCargoGlobal ["optic_MRCO", 20];                 // Alternative optic
_box addItemCargoGlobal ["NVGoggles", 39];                  // 1 per person
_box addItemCargoGlobal ["ItemCompass", 39];                // 1 per person
_box addItemCargoGlobal ["ItemMap", 39];                    // 1 per person
_box addItemCargoGlobal ["ItemWatch", 39];                  // 1 per person
_box addItemCargoGlobal ["ToolKit", 2];                     // For repairs

// Set cargo space
[_box, 2000] remoteExecCall ["setMaxLoad", 0, _box];


/*
Example usage:
[_box] call DPC_fnc_addPlatoonGear;
*/