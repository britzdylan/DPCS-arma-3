// // File: functions\config\fn_initPlatoonGroups.sqf

// /*
//     Author: Your Name
//     Description: Initializes or replenishes a NATO infantry platoon
    
//     Parameters:
//         _spawnPos: Array/Object - Position to spawn units [x,y,z] or object
//         _replenish: Boolean - True to check and replenish existing groups
    
//     Returns: Array of groups created/replenished
    
//     Example:
//     [getMarkerPos "platoon_start", false] call DPC_fnc_initPlatoonGroups;
// */

// params [
//     ["_spawnPos", [0,0,0], [[],objNull]],
//     ["_replenish", false, [false]]
// ];

// // NATO Infantry unit types
// #define UNIT_OFFICER "B_officer_F"
// #define UNIT_SQL "B_Soldier_SL_F"
// #define UNIT_TL "B_Soldier_TL_F"
// #define UNIT_MEDIC "B_medic_F"
// #define UNIT_AR "B_soldier_AR_F"
// #define UNIT_GREN "B_Soldier_GL_F"
// #define UNIT_LAT "B_soldier_LAT_F"
// #define UNIT_RADIO "B_Soldier_lite_F"

// // Platoon structure definitions
// private _platoonStructure = [
//     // HQ Squad - 4 men
//     [
//         "HQ", [
//             [UNIT_OFFICER, "Platoon Commander"],
//             [UNIT_MEDIC, "Platoon Medic"],
//             [UNIT_RADIO, "Platoon RTO"],
//             [UNIT_TL, "Platoon Sergeant"]
//         ]
//     ],
//     // Three identical infantry squads - 8 men each
//     [
//         "Alpha", [
//             [UNIT_SQL, "Squad Leader"],
//             [UNIT_TL, "Team Leader"],
//             [UNIT_AR, "Automatic Rifleman"],
//             [UNIT_GREN, "Grenadier"],
//             [UNIT_LAT, "AT Specialist"],
//             [UNIT_TL, "Team Leader"],
//             [UNIT_AR, "Automatic Rifleman"],
//             [UNIT_MEDIC, "Squad Medic"]
//         ]
//     ],
//     [
//         "Bravo", [
//             [UNIT_SQL, "Squad Leader"],
//             [UNIT_TL, "Team Leader"],
//             [UNIT_AR, "Automatic Rifleman"],
//             [UNIT_GREN, "Grenadier"],
//             [UNIT_LAT, "AT Specialist"],
//             [UNIT_TL, "Team Leader"],
//             [UNIT_AR, "Automatic Rifleman"],
//             [UNIT_MEDIC, "Squad Medic"]
//         ]
//     ],
//     [
//         "Charlie", [
//             [UNIT_SQL, "Squad Leader"],
//             [UNIT_TL, "Team Leader"],
//             [UNIT_AR, "Automatic Rifleman"],
//             [UNIT_GREN, "Grenadier"],
//             [UNIT_LAT, "AT Specialist"],
//             [UNIT_TL, "Team Leader"],
//             [UNIT_AR, "Automatic Rifleman"],
//             [UNIT_MEDIC, "Squad Medic"]
//         ]
//     ]
// ];

// // Convert spawn position
// _spawnPos = if (_spawnPos isEqualType objNull) then {
//     getPos _spawnPos
// } else {
//     _spawnPos
// };

// // Initialize platoon groups array if needed
// if (isNil "PLATOON_GROUPS" && !_replenish) then {
//     PLATOON_GROUPS = [];
// };

// // Function to create a single unit
// private _fnc_createUnit = {
//     params ["_type", "_role", "_group", "_pos"];
    
//     private _unit = _group createUnit [_type, _pos, [], 5, "NONE"];
//     _unit setRank "PRIVATE";
//     _unit setVariable ["DPC_Role", _role, true];  // Added true for global broadcast
    
//     // Set ranks based on role
//     switch (toLower _role) do {
//         case "platoon commander": { _unit setRank "LIEUTENANT" };
//         case "platoon sergeant": { _unit setRank "SERGEANT" };
//         case "squad leader": { _unit setRank "SERGEANT" };
//         case "team leader": { _unit setRank "CORPORAL" };
//         default { _unit setRank "PRIVATE" };
//     };
    
//     _unit
// };

// // Process each squad in the platoon structure
// {
//     _x params ["_squadName", "_composition"];
//     private "_group";
    
//     // Check if group exists when replenishing
//     if (_replenish) then {
//         {
//             if ((_x getVariable ["DPC_SquadName", ""]) == _squadName) exitWith {
//                 _group = _x;
//             };
//         } forEach PLATOON_GROUPS;
//     };
    
//     // Create new group if needed
//     if (isNil "_group" || {isNull _group}) then {
//         _group = createGroup [west, true];
//         _group setVariable ["DPC_SquadName", _squadName, true];  // Added true for global broadcast
//         PLATOON_GROUPS pushBack _group;
//     };
    
//     // Create or replenish units
//     {
//         _x params ["_type", "_role"];
        
//         // Check if we need this role when replenishing
//         private _needUnit = true;
//         if (_replenish) then {
//             {
//                 if (alive _x && {_x getVariable ["DPC_Role", ""] == _role}) exitWith {
//                     _needUnit = false;
//                 };
//             } forEach (units _group);
//         };
        
//         // Create unit if needed
//         if (_needUnit) then {
//             [_type, _role, _group, _spawnPos] call _fnc_createUnit;
//         };
//     } forEach _composition;
    
//     // Basic group settings
//     _group enableDynamicSimulation true;
//     _group setFormation "WEDGE";
    
// } forEach _platoonStructure;

// // Return the groups array
// PLATOON_GROUPS