PLATOON_ASSETS set ["veh_supply", createHashMap];
PLATOON_ASSETS set ["combat_vehicles", createHashMap];
PLATOON_ASSETS set ["transport_vehicles", createHashMap];
PLATOON_ASSETS set ["utility_vehicles", createHashMap];
PLATOON_ASSETS set ["turrets", createHashMap];

private _trackedVehiclePool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "TRACKED_VEHICLE_POOL");
private _mrapVehiclePool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "MRAP_VEHICLE_POOL");
private _hmgVehiclePool =  getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "HMG_VEHICLE_POOL");
private _gmgVehiclePool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "GMG_VEHICLE_POOL");
private _quadPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "QUAD_POOL");
private _ammoTruckPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "AMMO_TRUCK_POOL"); 
private _medTruckPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "MED_TRUCK_POOL"); 
private _repairTruckPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "REPAIR_TRUCK_POOL"); 
private _fuelTruckPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "FUEL_TRUCK_POOL"); 
private _hmgTurretPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "HMG_TURRET_POOL"); 
private _gmgTurretPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "GMG_TURRET_POOL"); 
private _atTurretPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "AT_TURRET_POOL"); 
private _mortarTurretPool = getNumber(missionConfigFile >> "CfgConstants" >> "Units" >> "MORTAR_TURRET_POOL"); 

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
_com_pool set ["B_APC_Tracked_01_rcws_F",[_trackedVehiclePool, 1]];
_com_pool set ["B_MRAP_01_hmg_F", [_hmgVehiclePool, 3]];
_com_pool set ["B_MRAP_01_gmg_F",[_gmgVehiclePool, 1]];

/*
#######################
#####
# Transport Vehicles
#####
#######################
*/

(PLATOON_ASSETS get "transport_vehicles") set ["pool", createHashMap];

private _trans_pool = (PLATOON_ASSETS get "transport_vehicles") get "pool";
_trans_pool set ["B_Quadbike_01_F", [_quadPool, 2]];
_trans_pool set ["B_MRAP_01_F", [_mrapVehiclePool, 2]];

/*
#######################
#####
# Utility Vehicles
#####
#######################
*/

(PLATOON_ASSETS get "utility_vehicles") set ["pool", createHashMap];

private _util_pool = (PLATOON_ASSETS get "utility_vehicles") get "pool";
_util_pool set ["B_Truck_01_ammo_F", [_ammoTruckPool, 1]];
_util_pool set ["B_Truck_01_medical_F",[_medTruckPool, 1]];
_util_pool set ["B_Truck_01_Repair_F",[_repairTruckPool, 1]];
_util_pool set ["B_Truck_01_fuel_F",[_fuelTruckPool, 1]];

/*
#######################
#####
# Turrets
#####
#######################
*/

(PLATOON_ASSETS get "turrets") set ["pool", createHashMap];

private _tur_pool = (PLATOON_ASSETS get "turrets") get "pool";
_tur_pool set ["B_HMG_01_high_F", [_hmgTurretPool, 3]];
_tur_pool set ["B_GMG_01_high_F", [_gmgTurretPool, 2]];
_tur_pool set ["B_static_AT_F", [_atTurretPool, 3]];
_tur_pool set ["B_Mortar_01_F", [_mortarTurretPool, 2]];

publicVariable "PLATOON_ASSETS";