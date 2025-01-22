params ["_control", "_selectedIndex"];
private _display = ctrlParent _control;
private _requestBtn = _display displayCtrl 9104;

// Enable/disable request button based on availability
private _vehicleClass = _control lbData _selectedIndex;
private _remaining = switch (_vehicleClass) do {
    case "B_MRAP_01_F": {DPCS_SYSUPPLY_MRAP_VEHICLE_POOL};
    case "B_MRAP_01_hmg_F": {DPCS_SYSUPPLY_HMG_VEHICLE_POOL};
    case "B_MRAP_01_gmg_F": {DPCS_SYSUPPLY_GMG_VEHICLE_POOL};
    case "B_Quadbike_01_F": {DPCS_SYSUPPLY_QUAD_POOL};
    default {DPCS_SYSUPPLY_MRAP_VEHICLE_POOL};
};

_requestBtn ctrlEnable (_remaining > 0);