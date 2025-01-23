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
private _isInfantrySquad = _id in DPCS_SYSSUPPLY_INF_CALLSIGNS;
private _isATSquad = _id in DPCS_SYSSUPPLY_AT_CALLSIGNS;
private _isGunnerSquad = _id in DPCS_SYSSUPPLY_GUNNER_CALLSIGNS;
private _groupPos = getPos leader _group;
private _marker = getMarkerPos "base";
// squad has to be withing 150m of FOB: base
if (_groupPos distance _marker > 150) exitWith {
    systemChat "Squad must be within the FOB";
};

if(_isPlatoonHQ) then {
    // Define expected squad composition
    private _expectedUnits = [
        "B_Soldier_TL_F",
        "B_Soldier_F",
        "B_medic_F",
        "B_engineer_F"
    ];
    [_group, _expectedUnits] spawn DPC_fnc_refitUnits;
};

if(_isInfantrySquad) then {
    private _expectedUnits = [
        "B_Soldier_SL_F",
        "B_Soldier_TL_F",
        "B_Soldier_F",
        "B_Soldier_F",
        "B_soldier_M_F",
        "B_medic_F",
        "B_soldier_AR_F",
        "B_Soldier_A_F"
    ];
    [_group, _expectedUnits] spawn DPC_fnc_refitUnits;
};

if(_isATSquad) then {
    private _expectedUnits = [
        "B_Soldier_TL_F",
        "B_soldier_AAT_F",
        "B_soldier_AT_F",
        "B_soldier_AT_F"
    ];
    [_group, _expectedUnits] spawn DPC_fnc_refitUnits;
};

if(_isGunnerSquad) then {
    private _expectedUnits = [
        "B_Soldier_TL_F",
        "B_support_Mort_F",
        "B_support_AMort_F"
    ];
    [_group, _expectedUnits] spawn DPC_fnc_refitUnits;
};
sleep 0.3;
[] call DPC_fnc_updateSquadList;