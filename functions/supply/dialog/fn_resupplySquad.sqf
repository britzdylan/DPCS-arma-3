private _display = findDisplay 9300;
private _squadList = _display displayCtrl 9301;
private _selectedIndex = lbCurSel _squadList;

if (_selectedIndex == -1) exitWith {
    systemChat "No squad selected";
};

private _data = _squadList lbData _selectedIndex;
private _group = groupFromNetId _data;
if (isNull _group) exitWith {
    systemChat "Invalid squad selected";
};
private _id = groupId _group;
systemChat format["Selected squad: %1", _id];
private _isPlatoonHQ = _id in DPCS_SYSSUPPLY_PLATOON_CALLSIGNS;
private _isInfantrySquad = _id in DPCS_SYSSUPPLY_ALL_INFANTRY_CALLSIGNS;
private _groupPos = getPos leader _group;
private _marker = getMarkerPos "base";
// squad has to be withing 150m of FOB: base
if (_groupPos distance _marker > 150) exitWith {
    systemChat "Squad must be within the FOB";
};

if(_isPlatoonHQ) then {
    [_group] spawn DPC_fnc_loadoutPlatoonHQ;
};

if(_isInfantrySquad) then {
    [_group] spawn DPC_fnc_loadoutInfantrySquad;
};