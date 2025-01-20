// Example usage
private _startPos = [14733.6,16677.4,0];    // Where to spawn the heli (with attached vehicle)
private _dropPos = [21618.4,15277.2,0];     // Where to drop the vehicle
private _basePos = _startPos;       // Where the helicopter should return to
private _vehicleClass = "B_MRAP_01_F";
private _heliClass = "B_Heli_Transport_03_F";

[_startPos, _dropPos, _vehicleClass, _heliClass, _basePos] call DPC_fnc_slingLoadVehicle;