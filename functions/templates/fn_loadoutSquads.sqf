private _isDebug = getNumber (missionConfigFile >> "CfgConstants" >> "DPCS_CONFIG" >> "DEBUG");


{
    if (isNull _x) then {
        if(_isDebug == 1) then {
            systemChat format ["%1: ERROR - Null squad found at index %2", _debugTag, _forEachIndex];
        };
        continue;
    };
    
    if(_isDebug == 1) then {
        private _squadName = groupId _x;
        systemChat format ["%1: Processing squad: %2", _debugTag, _squadName];
    }
[_x] spawn DPC_fnc_setupInfantrySquad;
} forEach [squad_1_1, squad_1_2, squad_1_3, squad_2_1, squad_2_2, squad_2_3, squad_3_1, squad_3_2, squad_3_3, squad_4_1, squad_4_2, squad_4_3, squad_4_4, squad_4_5, squad_4_6];