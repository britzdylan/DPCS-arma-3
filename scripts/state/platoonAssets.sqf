    if (isNil {MISSION_STATE get "platoonAssets"}) then {
        MISSION_STATE set ["platoonAssets", createHashMap];

        private _platoonAssets = MISSION_STATE get "platoonAssets";
        _platoonAssets set ["supply", createHashMap];
        _platoonAssets set ["combatVehicles", createHashMap];
        _platoonAssets set ["transportVehicles", createHashMap];
        _platoonAssets set ["utilityVehicles", createHashMap];
        _platoonAssets set ["turrets", createHashMap];

        /*
        #######################
        #####
        # Supply
        #####
        #######################
        */

        private _supply = _platoonAssets get "supply";
        _supply set ["spawnPoint", [14750.6,17085.3]];
        _supply set ["lastUsed", 0];
        _supply set ["cooldown", 60];

        /*
        #######################
        #####
        # Combat Vehicles
        #####
        #######################
        */

        (_platoonAssets get "combatVehicles") set ["pool", createHashMap];
        (_platoonAssets get "combatVehicles") set ["active", createHashMap];

        private _pool = (_platoonAssets get "combatVehicles") get "pool";
        _pool set ["B_APC_Tracked_01_rcws_F", 2];
        _pool set ["B_MRAP_01_hmg_F", 10];
        _pool set ["B_MRAP_01_gmg_F", 5];

        private _available = (_platoonAssets get "combatVehicles") get "available";
        _available set ["B_APC_Tracked_01_rcws_F", 1];
        _available set ["B_MRAP_01_hmg_F", 3];
        _available set ["B_MRAP_01_gmg_F", 1];

        /*
        #######################
        #####
        # Transport Vehicles
        #####
        #######################
        */

        (_platoonAssets get "transportVehicles") set ["pool", createHashMap];
        (_platoonAssets get "transportVehicles") set ["active", createHashMap];
        
        private _pool = (_platoonAssets get "transportVehicles") get "pool";
        _pool set ["B_Quadbike_01_F", 15];
        _pool set ["B_MRAP_01_F", 10];

        private _available = (_platoonAssets get "transportVehicles") get "available";
        _available set ["B_Quadbike_01_F", 2];
        _available set ["B_MRAP_01_F", 2];

        /*
        #######################
        #####
        # Utility Vehicles
        #####
        #######################
        */

        (_platoonAssets get "utilityVehicles") set ["pool", createHashMap];
        (_platoonAssets get "utilityVehicles") set ["active", createHashMap];

        private _pool = (_platoonAssets get "utilityVehicles") get "pool";
        _pool set ["B_Truck_01_ammo_F", 25];
        _pool set ["B_Truck_01_medical_F", 5];
        _pool set ["B_Truck_01_Repair_F", 5];

        private _available = (_platoonAssets get "utilityVehicles") get "available";
        _available set ["B_Truck_01_ammo_F", 1];
        _available set ["B_Truck_01_medical_F", 1];
        _available set ["B_Truck_01_Repair_F", 1];


        /*
        #######################
        #####
        # Turrets
        #####
        #######################
        */

        (_platoonAssets get "turrets") set ["pool", createHashMap];
        (_platoonAssets get "turrets") set ["active", createHashMap];

        private _pool = (_platoonAssets get "turrets") get "pool";
        _pool set ["B_HMG_01_high_F", 55];
        _pool set ["B_GMG_01_high_F", 25];
        _pool set ["B_static_AT_F", 15];
        _pool set ["B_Mortar_01_F", 20];

        private _available = (_platoonAssets get "turrets") get "active";
        _available set ["B_HMG_01_high_F", 3];
        _available set ["B_GMG_01_high_F", 2];
        _available set ["B_static_AT_F", 3];
        _available set ["B_Mortar_01_F", 2];

} else {
    hint "ERROR: MISSION_STATE is nil in platoonAssets.sqf";
    diag_log "ERROR: MISSION_STATE is nil in platoonAssets.sqf";
};