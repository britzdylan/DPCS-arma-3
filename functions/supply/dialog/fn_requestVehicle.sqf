private _display = findDisplay 9100;
private _listBox = _display displayCtrl 9101;
private _selectedVehicle = _listBox lbData (lbCurSel _listBox);

if (_selectedVehicle == "") exitWith {
    systemChat "Please select a vehicle first";
};

private _startPos = [14733.6,16677.4,0];    // Where to spawn the heli (with attached vehicle)
private _dropPos = [21618.4,15277.2,0];     // Where to drop the vehicle
private _basePos = _startPos;       // Where the helicopter should return to
private _heliClass = "B_Heli_Transport_03_F";

DPCS_SYSUPPLY_IN_PROGRESS = true;

[_startPos, _dropPos, _selectedVehicle, _heliClass, _basePos] call DPC_fnc_slingLoadVehicle;


private _remaining = switch (_selectedVehicle) do {
    case "B_MRAP_01_F": {DPCS_SYSUPPLY_MRAP_VEHICLE_POOL};
    case "B_MRAP_01_hmg_F": {DPCS_SYSUPPLY_HMG_VEHICLE_POOL};
    case "B_MRAP_01_gmg_F": {DPCS_SYSUPPLY_GMG_VEHICLE_POOL};
    case "B_Quadbike_01_F": {DPCS_SYSUPPLY_QUAD_POOL};
    default {DPCS_SYSUPPLY_MRAP_VEHICLE_POOL};
};

if (_remaining > 0) then {
    switch (_selectedVehicle) do {
        case "B_MRAP_01_F": {DPCS_SYSUPPLY_MRAP_VEHICLE_POOL = DPCS_SYSUPPLY_MRAP_VEHICLE_POOL - 1};
        case "B_MRAP_01_hmg_F": {DPCS_SYSUPPLY_HMG_VEHICLE_POOL = DPCS_SYSUPPLY_HMG_VEHICLE_POOL - 1};
        case "B_MRAP_01_gmg_F": {DPCS_SYSUPPLY_GMG_VEHICLE_POOL = DPCS_SYSUPPLY_GMG_VEHICLE_POOL - 1};
        case "B_Quadbike_01_F": {DPCS_SYSUPPLY_QUAD_POOL = DPCS_SYSUPPLY_QUAD_POOL - 1};
    };
} else {
    systemChat "No more vehicles of this type available";
};


closeDialog 0;

