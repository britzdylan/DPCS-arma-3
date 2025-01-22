params ["_control", "_selectedIndex"];
private _display = findDisplay 9300;
private _unitList = _display displayCtrl 9302;
lbClear _unitList;

private _group = grpNull;
private _data = _control lbData _selectedIndex;
if (_data != "") then {
    _group = groupFromNetId _data;
};

if (!isNull _group) then {
    {
        private _unit = _x;
        private _status = switch (true) do {
            case (!alive _unit): {"[KIA]"};
            case (damage _unit > 0.7): {"[CRITICAL]"};
            case (damage _unit > 0.3): {"[WOUNDED]"};
            default {"[OK]"};
        };
        
        private _color = switch (true) do {
            case (!alive _unit): {[0.5, 0.5, 0.5, 1]}; // Gray for dead
            case (damage _unit > 0.7): {[1, 0, 0, 1]}; // Red for critical
            case (damage _unit > 0.3): {[1, 0.5, 0, 1]}; // Orange for wounded
            default {[0, 1, 0, 1]}; // Green for OK
        };

        private _role = getText(configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
        
        private _index = _unitList lbAdd format ["%1 %2 - %3", name _unit, _status, _role];
        _unitList lbSetColor [_index, _color];
    } forEach units _group;
};