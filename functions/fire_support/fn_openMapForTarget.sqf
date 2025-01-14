// Close artillery dialog
if (!isNull (findDisplay 9000)) then {
    closeDialog 0;
};
private _fireSupport = DPC_MISSION_STATE get "SYS_FIRE_SUPPORT";
private _fireMission = _fireSupport get "FIRE_MISSION";

// Open the map
openMap true;

// Add map click handler
DPC_mapClickEH = addMissionEventHandler ["MapSingleClick", {
    params ["_units", "_pos", "_alt", "_shift"];
    private _fireSupport = DPC_MISSION_STATE get "SYS_FIRE_SUPPORT";
    private _fireMission = _fireSupport get "FIRE_MISSION";
    // Store target position
    _fireMission set ["GRID", _pos];
    
    // Create or update marker
    private _marker = "DPC_artilleryTargetMarker";
    if (getMarkerColor _marker == "") then {
        createMarkerLocal [_marker, _pos];
        _marker setMarkerTypeLocal "mil_destroy";
        _marker setMarkerColorLocal "ColorRed";
    } else {
        _marker setMarkerPosLocal _pos;
    };
    
    // Display grid coordinates
    hint format ["Target location set: %1", mapGridPosition _pos];
    
    // Close map and reopen artillery dialog
    openMap false;
    removeMissionEventHandler ["MapSingleClick", DPC_mapClickEH];
    [] spawn {
        sleep 0.1;
        [] call DPC_fnc_openArtilleryMenu;

        private _display = findDisplay 9000;
        private _gridCtrl = _display displayCtrl 9005;
        private _fireSupport = DPC_MISSION_STATE get "SYS_FIRE_SUPPORT";
        private _fireMission = _fireSupport get "FIRE_MISSION";
        if (!isNil "_fireMission") then {
            private _pos = _fireMission get "GRID";
            _gridCtrl ctrlSetText format ["Grid: %1", mapGridPosition _pos];
        };
    };
}];