// Start the monitoring loop
[] spawn {
private _lastState = 1;  // Initialize to invalid state to force first update

while {true} do {
    // Check if state has changed
    if (DPCS_SYSMED_ACTIVE_TREATMENTS > 0 && _lastState <= 0) then {
        // Activate animations
        surgeon switchMove "AinvPknlMstpSnonWnonDr_medic0";
        patient switchMove "ainjppnemstpsnonwnondnon_rolltoback";
        
        {
            _x disableAI "ALL";
            _x enableSimulation true;
            _x hideObject false;
        } forEach [surgeon, patient];
        
        _lastState = 1;
    };
    
    if (DPCS_SYSMED_ACTIVE_TREATMENTS <= 0 && _lastState > 0) then {
        // Deactivate animations
        {
            _x disableAI "ALL";
            _x enableSimulation false;
            _x hideObject true;
        } forEach [surgeon, patient];
        
        _lastState = 0;
    };
    
    sleep 1;  // Check every half second
};
};
