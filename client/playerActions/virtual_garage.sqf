ShowVirtualGarageAction = {  
  player addAction ["Open Garage", {
      	
	  	_side = side player;

		private _base_marker_name = [_side, "heavy_vehicle"] call get_prefixed_name;
		private _base_marker = missionNamespace getVariable _base_marker_name;
		private _pos = getPos _base_marker;
		
		private _isEmpty = [_pos] call check_if_any_units_to_close;

		if (_isEmpty) exitWith {		
			_temp_pos = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ]; 	
			["Open",[ true, _temp_pos ]] call BIS_fnc_garage; 
		};
		
		[_side, "HQ"] sideChat "Something is obstructing the area";
		 
    }, nil, 1.5, true, true, "",
    '[cursorTarget, player] call can_use_ammo_box'
    ];
};
