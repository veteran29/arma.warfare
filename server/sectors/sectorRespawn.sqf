AddRespawnPosition = {
	_sector = _this select 0;
			
	[_sector] call RemoveRespawnPosition;

	_respawnReturn = [_side, _sector getVariable "pos"] call BIS_fnc_addRespawnPosition;
	_sector setVariable ["currentRespawnPosition", _respawnReturn];
};

RemoveRespawnPosition = {
	_sector = _this select 0;

	(_sector getVariable ["currentRespawnPosition", [sideUnknown, 0]]) params ["_last_owner", "_index"];
	[_last_owner, _index] call bis_fnc_removeRespawnPosition;
	_sector setVariable ["currentRespawnPosition", nil];
};

AddInitialRespawnPosition = {
	_side = _this select 0;
	_prefix = missionNamespace getVariable format["%1_prefix", _side];

	_respawnMarker = format["respawn_ground_%1", _prefix];
	_pos = getMarkerPos _respawnMarker;
	
	[_side, _pos] call BIS_fnc_addRespawnPosition;	
};

[west] call AddInitialRespawnPosition;
[east] call AddInitialRespawnPosition;
[independent] call AddInitialRespawnPosition;