// fn_initArtillerySystem.sqf
if (isNil {DPC_MISSION_STATE get "SYS_FIRE_SUPPORT"}) then {
    DPC_MISSION_STATE set ["SYS_FIRE_SUPPORT", createHashMap];
};

DPC_MISSION_STATE get "SYS_FIRE_SUPPORT" set ["FIRE_MISSION", createHashMap];
private _fireSupport = DPC_MISSION_STATE get "SYS_FIRE_SUPPORT";
private _fireMission = _fireSupport get "FIRE_MISSION";
_fireMission set ["AMMO_TYPE", ""];
_fireMission set ["AMMO_COUNT",0];
_fireMission set ["GRID", createHashMap];
hint "Artillery system initialized";
// hint format ["%1", _fireMission];
// Get the actual artillery piece
if (isNull artillery_piece) exitWith {
    diag_log "ERROR: Artillery piece not found. Name an artillery unit 'artillery_piece' in the editor.";
};

player addAction [
    "Request Artillery Support",
    DPC_fnc_openArtilleryMenu,
    nil,
    1.5,
    true,
    true,
    "",
    "true",
    10
];