if (isNil {MISSION_STATE get "sys_medical"}) then {
    MISSION_STATE set ["sys_medical", createHashMap];
    private _medical = MISSION_STATE get "sys_medical";

    _medical set ["dead_units", []]; // temporary dead units that can be revived
};