params ["_unit"];
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add weapons";
_unit addWeapon "arifle_SPAR_01_blk_F";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Holosight_blk_F";
_unit addPrimaryWeaponItem "30Rnd_556x45_Stanag";
_unit addWeapon "launch_MRAWS_sand_F";
_unit addSecondaryWeaponItem "MRAWS_HEAT_F";
_unit addWeapon "hgun_P07_F";
_unit addHandgunItem "16Rnd_9x21_Mag";

comment "Add containers";
_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrier2_rgr";
_unit addBackpack "B_Kitbag_rgr";

comment "Add items to containers";
_unit addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
_unit addItemToVest "SmokeShell";
_unit addItemToVest "SmokeShellGreen";
_unit addItemToVest "Chemlight_green";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "MRAWS_HEAT_F";};
_unit addHeadgear "H_HelmetB_sand";
_unit addGoggles "G_Bandanna_khk";

comment "Add items";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "NVGoggles";

[_unit, "111thID"] call BIS_fnc_setUnitInsignia;

