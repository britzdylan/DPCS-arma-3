params ["_control", "_selectedIndex"];
private _fireSupport = DPC_MISSION_STATE get "SYS_FIRE_SUPPORT";
private _fireMission = _fireSupport get "FIRE_MISSION";
private _ammoClass = _control lbData _selectedIndex;
_fireMission set ["AMMO_TYPE", _ammoClass];

hint format ["Selected ammo: %1", _ammoClass];