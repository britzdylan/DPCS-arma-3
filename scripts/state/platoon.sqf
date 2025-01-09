    if (isNil {MISSION_STATE get "plt_assets"}) then {
        MISSION_STATE set ["plt_assets", createHashMap];

        private _platoonAssets = MISSION_STATE get "plt_assets";
        _platoonAssets set ["supply", createHashMap];
        _platoonAssets set ["combat_vehicles", createHashMap];
        _platoonAssets set ["transport_vehicles", createHashMap];
        _platoonAssets set ["utility_vehicles", createHashMap];
        _platoonAssets set ["turrets", createHashMap];

        /*
        #######################
        #####
        # Supply
        #####
        #######################
        */

        private _supply = _platoonAssets get "veh_supply";
        _supply set ["spawn_point", [14750.6,17085.3]];
        _supply set ["last_used", 0];
        _supply set ["cooldown", 60];

        /*
        #######################
        #####
        # Combat Vehicles
        #####
        #######################
        */

        (_platoonAssets get "combat_vehicles") set ["pool", createHashMap];
        (_platoonAssets get "combat_vehicles") set ["active", createHashMap];

        private _pool = (_platoonAssets get "combat_vehicles") get "pool";
        _pool set ["B_APC_Tracked_01_rcws_F", 2];
        _pool set ["B_MRAP_01_hmg_F", 10];
        _pool set ["B_MRAP_01_gmg_F", 5];

        private _available = (_platoonAssets get "combat_vehicles") get "available";
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

        (_platoonAssets get "transport_vehicles") set ["pool", createHashMap];
        (_platoonAssets get "transport_vehicles") set ["active", createHashMap];
        
        private _pool = (_platoonAssets get "transport_vehicles") get "pool";
        _pool set ["B_Quadbike_01_F", 15];
        _pool set ["B_MRAP_01_F", 10];

        private _available = (_platoonAssets get "transport_vehicles") get "available";
        _available set ["B_Quadbike_01_F", 2];
        _available set ["B_MRAP_01_F", 2];

        /*
        #######################
        #####
        # Utility Vehicles
        #####
        #######################
        */

        (_platoonAssets get "utility_vehicles") set ["pool", createHashMap];
        (_platoonAssets get "utility_vehicles") set ["active", createHashMap];

        private _pool = (_platoonAssets get "utility_vehicles") get "pool";
        _pool set ["B_Truck_01_ammo_F", 25];
        _pool set ["B_Truck_01_medical_F", 5];
        _pool set ["B_Truck_01_Repair_F", 5];

        private _available = (_platoonAssets get "utility_vehicles") get "available";
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
    hint "ERROR: MISSION_STATE is nil in plt_assets.sqf";
    diag_log "ERROR: MISSION_STATE is nil in plt_assets.sqf";
};