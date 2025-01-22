params ["_group"];
private _allUnits = units _group;
if (count _allUnits < 1) exitWith {};

{
    private _unit = _x;
    private _unitClass = typeOf _unit;

    switch (_unitClass) do {
        case "B_Soldier_SL_F": {
            [_unit] spawn DPC_fnc_squadLeader;
            _unit setRank "SERGEANT";
        };
        case "B_Soldier_TL_F": {
            [_unit] spawn DPC_fnc_teamLeader;
            _unit setRank "CORPORAL";
        };
        case "B_Soldier_F": {
            [_unit] spawn DPC_fnc_rifleman;
            _unit setRank "PRIVATE";
        };
        case "B_soldier_M_F": {
            [_unit] spawn DPC_fnc_marksman;
            _unit setRank "CORPORAL";
        };
        case "B_medic_F": {
            [_unit] spawn DPC_fnc_medic;
            _unit setRank "CORPORAL";
        };
        case "B_soldier_AR_F" : {
            [_unit] spawn DPC_fnc_autoRifleman;
            _unit setRank "PRIVATE";
        };
        case "B_Soldier_A_F" : {
            [_unit] spawn DPC_fnc_ammoBearer;
            _unit setRank "PRIVATE";
        };
        case "B_soldier_AT_F" : {
            [_unit] spawn DPC_fnc_antiTank;
            _unit setRank "CORPORAL";
        };
        case "B_soldier_exp_F" : {
            [_unit] spawn DPC_fnc_platoonEngineer;
            _unit setRank "CORPORAL";
        };
        case "B_support_AAT_F" : {
            [_unit] spawn DPC_fnc_atAssistant;
            _unit setRank "PRIVATE";
        };
        case "B_support_Mort_F" : {
            [_unit] spawn DPC_fnc_gunnerMk6Weapon;
            _unit setRank "CORPORAL";
        };
        case "B_support_MG_F" : {
            [_unit] spawn DPC_fnc_gunnerMk30;
            _unit setRank "CORPORAL";
        };
        case "B_support_AMG_F" : {
            [_unit] spawn DPC_fnc_gunnerTripod;
            _unit setRank "PRIVATE";
        };
    };
} forEach _allUnits;