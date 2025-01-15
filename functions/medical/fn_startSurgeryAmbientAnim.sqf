params ["_show"]

surgeon hideObject _show;
surgeon enableSimulation _show;

patient hideObject _show;
patient enableSimulation _show;

surgeon disableAI "ANIM";
surgeon disableAI "MOVE";
surgeon disableAI "PATH";     
surgeon disableAI "TARGET"; 
surgeon disableAI "FSM";
surgeon switchMove "AinvPknlMstpSnonWnonDr_medic0";

patient disableAI "ANIM";      // Prevent AI from changing animations
patient disableAI "MOVE";      // Prevent AI from moving
patient disableAI "PATH";      // Prevent AI from pathfinding
patient disableAI "TARGET";    // Prevent AI from targeting
patient disableAI "FSM";       // Prevent AI behavior scriptssurgeon
patient switchMove "ainjppnemstpsnonwnondnon_rolltoback";