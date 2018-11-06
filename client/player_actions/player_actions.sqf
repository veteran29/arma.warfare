AW_not_in_vehicle = {
	params ["_player"];
	_player isEqualTo (vehicle _player);
};

AW_is_leader = {
	params ["_player"];

  isPlayer (leader (group _player));   
};

AW_initialize_ammo_boxes = {
		 {
			 	if(_x getVariable ["HQ", false]) then {
					 [_x] spawn AW_add_HQ_actions;
				 };

				 if(_x getVariable ["sector", false]) then {
					 [_x] spawn AW_add_sector_actions;
				 };
		 } forEach allMissionObjects ammo_box;
};

AW_add_sector_actions = {
	params ["_ammo_box"];

	_ammo_box call AW_add_arsenal_action;
	_ammo_box call AW_add_take_manpower_action;
	_ammo_box call AW_add_store_manpower_action;
	[_ammo_box, "Get infantry", infantry, 130, true] call AW_create_menu;
};

AW_add_HQ_actions = {
	params ["_ammo_box"];

	_ammo_box call AW_add_arsenal_action;
	_ammo_box call AW_add_manpower_action;
	[_ammo_box, "Get vehicle", vehicle1, 110, false] call AW_create_menu;
	[_ammo_box, "Get helicopter", helicopter, 120, false] call AW_create_menu;
	[_ammo_box, "Get infantry", infantry, 130, false] call AW_create_menu;	
};