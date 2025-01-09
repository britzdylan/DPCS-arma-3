PLATOON_ASSETS = createHashMap;

private _platoonAssets = PLATOON_ASSETS;
_platoonAssets set ["veh_supply", createHashMap];
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

private _veh_supply = _platoonAssets get "veh_supply";
_veh_supply set ["spawn_point", [14750.6,17085.3]];
_veh_supply set ["last_used", 0];
_veh_supply set ["cooldown", 60];

/*
#######################
#####
# Combat Vehicles
#####
#######################
*/

(_platoonAssets get "combat_vehicles") set ["pool", createHashMap];

private _com_pool = (_platoonAssets get "combat_vehicles") get "pool";
// [vehicle class, available units, active units]
_com_pool set ["B_APC_Tracked_01_rcws_F", 2, 1];
_com_pool set ["B_MRAP_01_hmg_F", 10, 3];
_com_pool set ["B_MRAP_01_gmg_F", 5, 1];

/*
#######################
#####
# Transport Vehicles
#####
#######################
*/

(_platoonAssets get "transport_vehicles") set ["pool", createHashMap];

private _trans_pool = (_platoonAssets get "transport_vehicles") get "pool";
_trans_pool set ["B_Quadbike_01_F", 15, 2];
_trans_pool set ["B_MRAP_01_F", 10, 2];

/*
#######################
#####
# Utility Vehicles
#####
#######################
*/

(_platoonAssets get "utility_vehicles") set ["pool", createHashMap];
(_platoonAssets get "utility_vehicles") set ["active", createHashMap];

private _util_pool = (_platoonAssets get "utility_vehicles") get "pool";
_util_pool set ["B_Truck_01_ammo_F", 25, 1];
_util_pool set ["B_Truck_01_medical_F", 5, 1];
_util_pool set ["B_Truck_01_Repair_F", 5, 1];
_util_pool set ["B_Truck_01_fuel_F", 5, 1];

/*
#######################
#####
# Turrets
#####
#######################
*/

(_platoonAssets get "turrets") set ["pool", createHashMap];

private _tur_pool = (_platoonAssets get "turrets") get "pool";
_tur_pool set ["B_HMG_01_high_F", 55, 3];
_tur_pool set ["B_GMG_01_high_F", 25, 2];
_tur_pool set ["B_static_AT_F", 15, 3];
_tur_pool set ["B_Mortar_01_F", 20, 2];

PLATOON_ASSETS = _platoonAssets;