// File: functions\medical\fn_addReviveAction.sqf
params ["_building"];

_building addAction [
    "Begin Medical Treatment",
    {
        params ["_building", "_caller", "_actionId"];
        // Count current treatments
        private _currentTreatments = count ((nearestObjects [_building, ["Man"], DPCS_SYSMED_MAX_REVIVE_DISTANCE]) select {
            !isNil {_x getVariable "DPCS_SYSMED_REVIVE_PROGRESS"}
        });
        DPCS_SYSMED_ACTIVE_TREATMENTS = _currentTreatments;

        
        // Get all dead units near building not already being treated
        private _nearbyDead = (nearestObjects [_building, ["Man"], DPCS_SYSMED_MAX_REVIVE_DISTANCE]) select {
            _x in (DPCS_SYSMED_TRAUMA_UNITS) &&
            isNil {_x getVariable "DPCS_SYSMED_REVIVE_PROGRESS"}
        };
        
        // Calculate how many more we can treat
        private _availableSlots = DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY - _currentTreatments;
        
        if (_availableSlots <= 0) exitWith {
            systemChat format ["Medical facility at maximum capacity (%1 patients)", DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY];
        };
        
        if (count _nearbyDead > 0) then {
            // Limit number of new treatments to available slots
            private _unitsToTreat = _nearbyDead select [0, _availableSlots];
            // Start revival process for each dead unit
            {
                private _deadUnit = _x;
                 DPCS_SYSMED_ACTIVE_TREATMENTS = DPCS_SYSMED_ACTIVE_TREATMENTS + 1;
                // Start revival process and pass the needed variables
                [_deadUnit, _building] spawn {
                    params ["_unit", "_building"];
                    private _startTime = time;
                    
                    // Create progress tracking variable
                    _unit hideObject true;
                    _unit enableSimulation false;
                    _unit setVariable ["DPCS_SYSMED_REVIVE_PROGRESS", 0, true];
                    
                    // Progress loop
                    while {time - _startTime < DPCS_SYSMED_REVIVE_TIME} do {
                        // Update progress
                        private _progress = ((time - _startTime) / DPCS_SYSMED_REVIVE_TIME) * 100;
                        _unit setVariable ["DPCS_SYSMED_REVIVE_PROGRESS", _progress, true];
                        
                        // Display progress for each unit
                        systemChat format ["%1 Treatment Progress: %2%3", name _unit, floor _progress, "%"];
                        sleep 5; // Update every 5 seconds
                    };

                    DPCS_SYSMED_TRAUMA_UNITS = DPCS_SYSMED_TRAUMA_UNITS - [_unit];
                    _unit setDamage 0;
                    _unit setUnconscious false;
                    _unit allowDamage true;
                    _unit switchMove ""; // Reset animation
                    _unit enableAI "ALL"; // Re-enable AI
                    _unit enableSimulation true;
                    _unit hideObject false;
                    {_unit removeAction _x} forEach (actionIDs _unit); // Remove all actions
                    _unit setSkill ((skill _unit) - DPCS_SYSMED_SKILL_PENALTY);
                    _unit setVariable ["DPCS_SYSMED_TRAUMA_START", nil, true];
                    systemChat format ["%1 has been revived", name _unit];
                    _unit setVariable ["DPCS_SYSMED_REVIVE_PROGRESS", nil, true];
                    DPCS_SYSMED_ACTIVE_TREATMENTS = DPCS_SYSMED_ACTIVE_TREATMENTS - 1;
                };
            } forEach _unitsToTreat;
            
            systemChat format ["Beginning treatment of %1 casualties", count _unitsToTreat];
        } else {
            systemChat "No casualties within range of medical facility";
        };
    },
    [],
    1.5,
    true,
    true,
    "",
    // Condition: Check for any nearby dead units not being treated AND facility not at capacity
    "
    private _nearbyUnits = nearestObjects [_target, ['Man'], DPCS_SYSMED_MAX_REVIVE_DISTANCE];
    private _currentTreatments = count (_nearbyUnits select {!isNil {_x getVariable 'DPCS_SYSMED_REVIVE_PROGRESS'}});
    private _hasUntreatedCasualties = count (_nearbyUnits select {
    _x in DPCS_SYSMED_TRAUMA_UNITS && 
    isNil {_x getVariable 'DPCS_SYSMED_REVIVE_PROGRESS'}
    }) > 0;
    _currentTreatments < DPCS_SYSMED_MAX_MEDICAL_FACILITY_CAPACITY && _hasUntreatedCasualties
    "
];