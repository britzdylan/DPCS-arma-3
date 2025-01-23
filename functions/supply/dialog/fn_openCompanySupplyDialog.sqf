if (!createDialog "DPC_Company_Dialog") exitWith {
    systemChat "Failed to create dialog!";
};

[] spawn DPC_fnc_updateSquadList;