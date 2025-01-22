if (!createDialog "DPC_Company_Dialog") exitWith {
    systemChat "Failed to create dialog!";
};

private _display = findDisplay 9300;
private _squadList = _display displayCtrl 9301;
lbClear _squadList;

{

    if (!isNull _x) then {
        private _squadName = groupId _x;
        private _aliveCount = {alive _x} count units _x;
        private _totalCount = count units _x;
        private _woundedCount = {alive _x && damage _x > 0.3} count units _x;
        private _reinforcing = _x getVariable ["DPCS_SYSSUPPLY_REINFORCING", false];
        
        private _status = switch (true) do {
            case (_aliveCount == 0): {"[DESTROYED]"};
            case (_aliveCount < (_totalCount * 0.5)): {"[CRITICAL]"};
            case (_woundedCount > (_aliveCount * 0.5)): {"[IMPAIRED]"};
            default {"[COMBAT READY]"};
        };
        
        private _reinforceText = if (_reinforcing) then {" [REINFORCING]"} else {""};
        
        private _color = switch (true) do {
            case (_aliveCount == 0): {[0.5, 0.5, 0.5, 1]}; // Gray for destroyed
            case (_aliveCount < (_totalCount * 0.5)): {[1, 0, 0, 1]}; // Red for critical
            case (_woundedCount > (_aliveCount * 0.5)): {[1, 0.5, 0, 1]}; // Orange for impaired
            default {[0, 1, 0, 1]}; // Green for combat ready
        };
        
        private _idx = _squadList lbAdd format ["%1 %2%3 (%4/%5)", _squadName, _status, _reinforceText, _aliveCount, _totalCount];
        _squadList lbSetData [_idx, netId _x];
        _squadList lbSetColor [_idx, _color];
    };
} forEach DPCS_SYSSUPPLY_SQUADS;

if (lbSize _squadList > 0) then {
    _squadList lbSetCurSel 0;
};