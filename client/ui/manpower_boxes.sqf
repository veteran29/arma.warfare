AW_create_manpower_markers = {
	params ["_boxes"];
	
	{
		private _marker_name = format["%1-%2", "manpower-box", _forEachIndex];
		createMarkerLocal [_marker_name, getPosWorld _x]; 
		_marker_name setMarkerTypeLocal "mil_box";
		_marker_name setMarkerAlphaLocal 0;
	} forEach _boxes;
};

AW_update_manpower_markers = {
	params ["_boxes"];

	{
		private _side = _x getVariable AW_owned_by;
		private _marker_name = format["%1-%2", "manpower-box", _forEachIndex];

		if (_side isEqualTo playerSide) then {
			
			private _color = [_side, true] call BIS_fnc_sideColor;
					
			_marker_name setMarkerColorLocal _color;
			_marker_name setMarkerAlphaLocal 1;

			private _manpower = floor (_x getVariable manpower);

			if(!(isNil "_manpower")) then {
				_marker_name setMarkerTextLocal format["%1 MP", _manpower];				
			};
			
		} else {
			_marker_name setMarkerAlphaLocal 0;
		}

	} forEach _boxes;
};

AW_show_manpower_markers = {
	_manpower_storage_boxes = allMissionObjects ammo_box;
	[_manpower_storage_boxes] call AW_create_manpower_markers;
	_side = playerSide;

	while {true} do {
		[_manpower_storage_boxes] call AW_update_manpower_markers;
		sleep 2;
	};
};