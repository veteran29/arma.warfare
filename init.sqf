[] call compileFinal preprocessFileLineNumbers "presets\preset.sqf";
[] call compileFinal preprocessFileLineNumbers "presets\global_variable_names.sqf";
[] call compileFinal preprocessFileLineNumbers "shared\spawn_infantry.sqf";
[] call compileFinal preprocessFileLineNumbers "shared\access_methods.sqf";
[] call compileFinal preprocessFileLineNumbers "client\end_mission.sqf";
[] call compileFinal preprocessFileLineNumbers "client\playerActions\playerActions.sqf";
[] call compileFinal preprocessFileLineNumbers "client\playerActions\halo.sqf";
[] call compileFinal preprocessFileLineNumbers "client\playerActions\spawnSquad.sqf";
[] call compileFinal preprocessFileLineNumbers "client\playerActions\showArsenal.sqf";
[] call compileFinal preprocessFileLineNumbers "client\playerActions\redeploy.sqf";
[] call compileFinal preprocessFileLineNumbers "client\playerActions\virtual_garage.sqf";
[] call compileFinal preprocessFileLineNumbers "shared\common\common.sqf";

[] spawn compileFinal preprocessFileLineNumbers "client\ui\factionKillCounter.sqf";


