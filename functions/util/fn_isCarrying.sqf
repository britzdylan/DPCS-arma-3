params ["_player"];

// Check various carry states
if (_player getVariable ["DPC_carryingStatic", false]) exitWith { true };
falses