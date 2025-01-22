params ["_unit"];

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

_unit addWeapon "arifle_SPAR_01_blk_F";
_unit addPrimaryWeaponItem "acc_flashlight";
_unit addPrimaryWeaponItem "30Rnd_556x45_Stanag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "11Rnd_45ACP_Mag";

_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrier1_blk";
_unit addWeapon "Binocular";

_unit addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToVest "11Rnd_45ACP_Mag"};
for "_i" from 1 to 3 do {_unit addItemToVest "30Rnd_556x45_Stanag"};
_unit addHeadgear "H_Booniehat_tan";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";

[_unit, "111thID"] call BIS_fnc_setUnitInsignia;
_unit setRank "LIEUTENANT";
_unit setSkill 1;