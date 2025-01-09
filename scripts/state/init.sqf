// Initialize Global Mission State
if (isNil "MISSION_STATE") then {
    MISSION_STATE = createHashMap;
    publicVariable "MISSION_STATE";
};

[] spawn {
    [] execVM "scripts\state\platoonAssets.sqf";
};
    

    // Publicize the mission state
    // Mission Progress
    // MISSION_STATE set ["missionActive", true];
    // MISSION_STATE set ["hvtNeutralized", false];
    // MISSION_STATE set ["hvtLocation", []];
    // MISSION_STATE set ["intelDiscovered", 0];
    
    // // Platoon Status
    // MISSION_STATE set ["platoonStrength", 100]; // Percentage
    // MISSION_STATE set ["casualties", 0];
    // MISSION_STATE set ["wia", []]; // Array of wounded soldiers
    // MISSION_STATE set ["kia", []]; // Array of killed soldiers
    // MISSION_STATE set ["reinforcementsAvailable", 10];
    
    // // Support Assets Status
    // MISSION_STATE set ["supportAssets", createHashMap];
    // private _supportAssets = MISSION_STATE get "supportAssets";
    
    // // Artillery
    // _supportAssets set ["artillery", createHashMap];
    // (_supportAssets get "artillery") set ["available", true];
    // (_supportAssets get "artillery") set ["ammoCount", 20];
    // (_supportAssets get "artillery") set ["cooldown", false];
    // (_supportAssets get "artillery") set ["lastUsed", 0];
    
    // // Mortars
    // _supportAssets set ["mortars", createHashMap];
    // (_supportAssets get "mortars") set ["available", true];
    // (_supportAssets get "mortars") set ["ammoCount", 30];
    // (_supportAssets get "mortars") set ["cooldown", false];
    // (_supportAssets get "mortars") set ["lastUsed", 0];
    
    // // Air Assets
    // _supportAssets set ["airAssets", createHashMap];
    // (_supportAssets get "airAssets") set ["apacheAvailable", true];
    // (_supportAssets get "airAssets") set ["apacheRespawnCount", 3];
    // (_supportAssets get "airAssets") set ["littleBirdAvailable", true];
    // (_supportAssets get "airAssets") set ["littleBirdRespawnCount", 3];
    
    // // QRF
    // _supportAssets set ["qrf", createHashMap];
    // (_supportAssets get "qrf") set ["available", true];
    // (_supportAssets get "qrf") set ["cooldown", false];
    // (_supportAssets get "qrf") set ["lastUsed", 0];
    // (_supportAssets get "qrf") set ["usesRemaining", 3];
    
    // // Logistics
    // MISSION_STATE set ["logistics", createHashMap];
    // private _logistics = MISSION_STATE get "logistics";
    // _logistics set ["ammoResupplyAvailable", true];
    // _logistics set ["ammoResupplyCooldown", false];
    // _logistics set ["vehicleReplacementsAvailable", 3];
    
    // // Civilian & Infrastructure
    // MISSION_STATE set ["civilian", createHashMap];
    // private _civilian = MISSION_STATE get "civilian";
    // _civilian set ["support", 50]; // Percentage
    // _civilian set ["casualties", 0];
    // _civilian set ["infrastructureDamage", 0]; // Percentage
    
    // // Enemy Status
    // MISSION_STATE set ["enemy", createHashMap];
    // private _enemy = MISSION_STATE get "enemy";
    // _enemy set ["combatStrength", 100]; // Percentage
    // _enemy set ["casualties", 0];
    // _enemy set ["cacheCount", 3];
    // _enemy set ["cachesDestroyed", 0];
    
    // // Event System
    // MISSION_STATE set ["events", createHashMap];
    // private _events = MISSION_STATE get "events";
    // _events set ["activeEvents", []];
    // _events set ["completedEvents", []];
    // _events set ["failedEvents", []];
