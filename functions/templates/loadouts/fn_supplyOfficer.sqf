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
_unit addPrimaryWeaponItem "30Rnd_556x45_Stanag";
_unit addWeapon "hgun_Pistol_heavy_01_F";
_unit addHandgunItem "11Rnd_45ACP_Mag";

_unit forceAddUniform "U_B_CombatUniform_mcam";
_unit addVest "V_PlateCarrier1_blk";

for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_556x45_Stanag"};
_unit addHeadgear "H_Cap_oli_hs";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

[_unit, "111thID"] call BIS_fnc_setUnitInsignia;
_unit setRank "LIEUTENANT";
_unit setSkill 1;
