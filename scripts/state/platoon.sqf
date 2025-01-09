PLATOON_ASSETS set ["veh_supply", createHashMap];
PLATOON_ASSETS set ["combat_vehicles", createHashMap];
PLATOON_ASSETS set ["transport_vehicles", createHashMap];
PLATOON_ASSETS set ["utility_vehicles", createHashMap];
PLATOON_ASSETS set ["turrets", createHashMap];

/*
#######################
#####
# Supply
#####
#######################
*/

private _veh_supply = PLATOON_ASSETS get "veh_supply";
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

(PLATOON_ASSETS get "combat_vehicles") set ["pool", createHashMap];

private _com_pool = (PLATOON_ASSETS get "combat_vehicles") get "pool";
// [vehicle class, available units, active units]
_com_pool set ["B_APC_Tracked_01_rcws_F",[2, 1]];
_com_pool set ["B_MRAP_01_hmg_F", [10, 3]];
_com_pool set ["B_MRAP_01_gmg_F",[5, 1]];

/*
#######################
#####
# Transport Vehicles
#####
#######################
*/

(PLATOON_ASSETS get "transport_vehicles") set ["pool", createHashMap];

private _trans_pool = (PLATOON_ASSETS get "transport_vehicles") get "pool";
_trans_pool set ["B_Quadbike_01_F", [15, 2]];
_trans_pool set ["B_MRAP_01_F", [10, 2]];

/*
#######################
#####
# Utility Vehicles
#####
#######################
*/

(PLATOON_ASSETS get "utility_vehicles") set ["pool", createHashMap];

private _util_pool = (PLATOON_ASSETS get "utility_vehicles") get "pool";
_util_pool set ["B_Truck_01_ammo_F", [25, 1]];
_util_pool set ["B_Truck_01_medical_F",[5, 1]];
_util_pool set ["B_Truck_01_Repair_F",[5, 1]];
_util_pool set ["B_Truck_01_fuel_F",[5, 1]];

/*
#######################
#####
# Turrets
#####
#######################
*/

(PLATOON_ASSETS get "turrets") set ["pool", createHashMap];

private _tur_pool = (PLATOON_ASSETS get "turrets") get "pool";
_tur_pool set ["B_HMG_01_high_F", [55, 3]];
_tur_pool set ["B_GMG_01_high_F", [25, 2]];
_tur_pool set ["B_static_AT_F", [15, 3]];
_tur_pool set ["B_Mortar_01_F", [20, 2]];

publicVariable "PLATOON_ASSETS";