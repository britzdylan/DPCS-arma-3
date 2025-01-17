params ["_player"];

// Check various carry states
if (_player getVariable ["carryingStatic", false]) exitWith { true };
if (!isNull (_player getVariable ["SA_Tow_Ropes_Vehicle", objNull])) exitWith { true };
if (_player getVariable ["ace_dragging_isCarrying", false]) exitWith { true };
if (_player getVariable ["ace_dragging_isDragging", false]) exitWith { true };

false