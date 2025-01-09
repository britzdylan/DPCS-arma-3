if (isNil {MISSION_STATE get "sys_medical"}) then {
    MISSION_STATE set ["sys_medical", createHashMap];
    MISSION_STATE get "sys_medical" set ["dead_units", []]; // temporary dead units that can be revived
};