private _display = findDisplay 9300;
private _squadList = _display displayCtrl 9301;
private _selectedIndex = lbCurSel _squadList;

if (_selectedIndex == -1) exitWith {
    systemChat "No squad selected";
};

private _data = _squadList lbData _selectedIndex;
private _group = groupFromNetId _data;

if (isNull _group) exitWith {
    systemChat "Invalid squad selected";
};



private _leader = leader _group;
if (isNull _leader || !alive _leader) exitWith {
    systemChat "Squad has no valid leader";
};

if (_leader == player) exitWith {
    systemChat "You are already controlling the squad leader";
};

// Store original player before switching
DPC_originalPlayer = player;

// Switch to squad leader
selectPlayer _leader;
closeDialog 0;

// Add action to return to original unit
_leader addAction [
"<t color='#FF0000'>Release Control</t>",
{
    params ["_target", "_caller", "_actionId", "_arguments"];
    if (!isNull DPC_originalPlayer && alive DPC_originalPlayer) then {
        _target removeAction _actionId;
        selectPlayer DPC_originalPlayer;
        DPC_originalPlayer = objNull;
        systemChat "Returned to original unit";
    } else {
        systemChat "Unable to return to original unit";
    };
},
nil,
1.5,
true,
true,
"",
"true"
];

systemChat format ["You are now controlling %1, leader of %2. Press F1 to return to original unit.", name _leader, groupId _group];