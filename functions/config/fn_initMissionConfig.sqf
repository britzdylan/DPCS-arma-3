// File: functions\config\fn_initMissionConfig.sqf

// Initialize Global Mission State
if (isNil "MISSION_STATE") then {
    MISSION_STATE = createHashMap;
    publicVariable "MISSION_STATE";
};

if (isNil "PLATOON_ASSETS") then {
    PLATOON_ASSETS = createHashMap;
    publicVariable "PLATOON_ASSETS";
};

private _vehicleCapacities = createHashMap;
_vehicleCapacities set ["B_MRAP_01_F", 2];        // Hunter
_vehicleCapacities set ["B_MRAP_01_hmg_F", 2];    // Armed Hunter
_vehicleCapacities set ["B_MRAP_01_gmg_F", 2];    // Armed Hunter
_vehicleCapacities set ["B_APC_Tracked_01_rcws_F", 6];    // Panther
_vehicleCapacities set ["B_Truck_01_medical_F", 8];       // HEMTT Medical


PLATOON_ASSETS set ["vehicle_capacities", _vehicleCapacities];

// Wait for player to be ready

        player addAction [
            "Dump Mission State",
            {
                [MISSION_STATE] call DPC_fnc_dumpState;
            }, 
            nil, 
            1.5, 
            true, 
            true, 
            "",
            "true", // Condition
            5 // Radius
        ];

        player addAction [
            "Dump Platoon State", 
            {
                [PLATOON_ASSETS] call DPC_fnc_dumpState;
            }, 
            nil, 
            1.5, 
            true, 
            true, 
            "",
            "true", // Condition
            5 // Radius
        ];
