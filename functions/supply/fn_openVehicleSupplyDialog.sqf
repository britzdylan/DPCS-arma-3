
if (DPCS_SYSUPPLY_IN_PROGRESS) exitWith {
    systemChat "Vehicle supply in progress, please wait";
};

if (!createDialog "DPC_Vehicle_Supply_Dialog") exitWith {
    systemChat "Failed to open vehicle supply dialog";
};


// Get dialog controls
private _display = findDisplay 9100;
private _listBox = _display displayCtrl 9101;

// Clear the list
lbClear _listBox;

// Add available vehicles based on supply pool constants
private _vehicles = [
    ["B_MRAP_01_F", "MRAP - Hunter", DPCS_SYSUPPLY_MRAP_VEHICLE_POOL],
    ["B_MRAP_01_hmg_F", "MRAP (HMG) - Hunter",DPCS_SYSUPPLY_HMG_VEHICLE_POOL],
    ["B_MRAP_01_gmg_F", "MRAP (GMG) - Hunter", DPCS_SYSUPPLY_GMG_VEHICLE_POOL],
    ["B_Quadbike_01_F", "Quadbike", DPCS_SYSUPPLY_QUAD_POOL]
];

{
    _x params ["_class", "_name", "_remaining"];
    private _index = _listBox lbAdd format ["%1 (%2 Available)", _name, _remaining];
    _listBox lbSetData [_index, _class];
    _listBox lbSetTooltip [_index, format ["Request a %1", _name]];
} forEach _vehicles;

_listBox lbSetCurSel 0;