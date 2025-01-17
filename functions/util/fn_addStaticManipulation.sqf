params ["_static"];

_static addAction [
"Carry Weapon",
{
    params ["_static", "_player"];
    [_static, _player] spawn DPC_fnc_carryStatic;
}, 
nil, 
4, 
true, 
true, 
"",
"isNull attachedTo _target && {isNull objectParent _this} && {!(_this getVariable ['DPC_carryingStatic', false])} && {count crew _target == 0}", 
3
];