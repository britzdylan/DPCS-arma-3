{
    private _allUnits = units _x;
    if (count _allUnits < 1) exitWith {};

    {
        private _unit = _x;
        private _unitClass = typeOf _unit;

        switch (_unitClass) do {
            case "B_Soldier_TL_F": {
                [_unit] spawn DPC_fnc_teamLeader;
            };
            case "B_Soldier_F": {
                [_unit] spawn DPC_fnc_RTO;
            };
            case "B_medic_F": {
                [_unit] spawn DPC_fnc_medic;
            };
            case "B_engineer_F" : {
                [_unit] spawn DPC_fnc_platoonEngineer;
            };
        };
    } forEach _allUnits;
} forEach [squad_1, squad_2, squad_3, squad_4];