// File: functions\medical\fn_addReviveAction.sqf
params ["_building"];

// Set maximum number of simultaneous treatments
private _maxTreatments = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "MAX_MEDICAL_FACILITY_CAPACITY");
private _casevacDistance = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "MAX_CASEVAC_DISTANCE");
private _reviveTime = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "REVIVE_TIME_LIMIT");
private _skillPenalty = getNumber(missionConfigFile >> "CfgConstants" >> "Medical" >> "SKILL_PENALTY");

_building addAction [
    "Begin Medical Treatment",
    {
        params ["_building", "_caller", "_actionId"];
        private _reviveTime = _this select 3 select 0;
        private _skillPenalty = _this select 3 select 1;
        private _casevacDistance = _this select 3 select 2;
        private _maxTreatments = _this select 3 select 3;
        
        // Count current treatments
        private _currentTreatments = count ((nearestObjects [_building, ["Man"], 15]) select {
            !isNil {_x getVariable "dpc_reviveProgress"}
        });
        
        // Get all dead units near building not already being treated
        private _nearbyDead = (nearestObjects [_building, ["Man"], _casevacDistance]) select {
            _x in (DPC_MISSION_STATE get "SYS_MEDICAL" get "TRAUMA_UNITS") &&
            isNil {_x getVariable "dpc_reviveProgress"}
        };
        
        // Calculate how many more we can treat
        private _availableSlots = _maxTreatments - _currentTreatments;
        
        if (_availableSlots <= 0) exitWith {
            systemChat "Medical facility at maximum capacity (2 patients)";
        };
        
        if (count _nearbyDead > 0) then {
            // Limit number of new treatments to available slots
            private _unitsToTreat = _nearbyDead select [0, _availableSlots];
            
            // Start revival process for each dead unit
            {
                private _deadUnit = _x;
                
                // Start revival process and pass the needed variables
                [_deadUnit, _building, _reviveTime, _skillPenalty] spawn {
                    params ["_unit", "_building", "_reviveTime", "_skillPenalty"];
                    private _startTime = time;
                    
                    // Create progress tracking variable
                    _unit hideObject true;
                    _unit enableSimulation false;
                    _unit setVariable ["dpc_reviveProgress", 0, true];
                    
                    // Progress loop
                    while {time - _startTime < 60} do {
                        // Update progress
                        private _progress = ((time - _startTime) / 60) * 100;
                        _unit setVariable ["dpc_reviveProgress", _progress, true];
                        
                        // Display progress for each unit
                        systemChat format ["%1 Treatment Progress: %2%3", name _unit, floor _progress, "%"];
                        sleep 1; // Update every 5 seconds
                    };
                    
                    // Revival complete
                    // Remove from dead units
                    private _traumaUnits = DPC_MISSION_STATE get "SYS_MEDICAL" get "TRAUMA_UNITS";
                    _traumaUnits = _traumaUnits - [_unit];
                    (DPC_MISSION_STATE get "SYS_MEDICAL") set ["TRAUMA_UNITS", _traumaUnits];
                    
                    // Revive unit
                    _unit setDamage 0;
                    _unit setUnconscious false;
                    _unit allowDamage true;
                    _unit enableAI "ALL"; // Re-enable AI
                    _unit switchMove ""; // Reset animation
                    _unit enableSimulation true;
                    _unit hideObject false;
                    
                    // set skill penalty
                    _unit setSkill ((skill _unit) - _skillPenalty);
                    
                    // Reset death time (do this before clearing reviveProgress)
                    _unit setVariable ["dpc_traumaStart", nil, true];
                    
                    // Notify success
                    systemChat format ["%1 has been revived", name _unit];
                    
                    // Clear variables, do not set ot nil. This is important for the condition check
                    _unit setVariable ["dpc_reviveProgress", nil, true];
                };
            } forEach _unitsToTreat;
            
            systemChat format ["Beginning treatment of %1 casualties", count _unitsToTreat];
        } else {
            systemChat "No casualties within range of medical facility";
        };
    },
    [_reviveTime, _skillPenalty, _casevacDistance, _maxTreatments],  // Pass these variables as arguments
    1.5,
    true,
    true,
    "",
    // Condition: Check for any nearby dead units not being treated AND facility not at capacity
    format ["private _currentTreatments = count ((nearestObjects [_target, ['Man'], 10]) select {!isNil {_x getVariable 'dpc_reviveProgress'}}); _currentTreatments < %1 && {count ((nearestObjects [_target, ['Man'], %2]) select {_x in (DPC_MISSION_STATE get 'SYS_MEDICAL' get 'TRAUMA_UNITS') && isNil {_x getVariable 'dpc_reviveProgress'}}) > 0}", _maxTreatments, _casevacDistance]
];