createDialog "DPC_Artillery_Dialog";

 private _display = findDisplay 9000;
if (isNull _display) exitWith {
    systemChat "Failed to create artillery dialog";
};

private _ammoList = _display displayCtrl 9001;
[artillery_piece, _display, _ammoList] call DPC_fnc_updateArtilleryAmmoUI;