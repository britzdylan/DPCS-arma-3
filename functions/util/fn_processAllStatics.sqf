// Start the continuous processing
[] spawn {
    private ["_allStatics", "_processedCount"];
    private _radius = 300;
    private _center = getMarkerPos "base";
    
    while {alive player} do {
        _allStatics = [];
        _processedCount = 0;
        
        // Search for statics in radius
        _allStatics = _center nearEntities [["StaticWeapon"], _radius];
        
        // Process found statics
        {
            if (isNull _x || {_x getVariable ["DPC_processed", false]}) then {continue};
            
            [_x] call DPC_fnc_addStaticManipulation;
            _x setVariable ["DPC_processed", true];
            _processedCount = _processedCount + 1;
            
        } forEach _allStatics;
        
        // Log only if we found new statics
        if (_processedCount > 0) then {
            systemChat format ["Processed %1 static weapons", _processedCount];
        };
        
        // Wait before next check
        sleep 10;
    };
    
    systemChat "Static weapon processing stopped - player dead";
};