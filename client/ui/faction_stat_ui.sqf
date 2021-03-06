
show_ui = {
	
	with uiNamespace do {
		get_tier_progress = {
			params ["_side"];
			missionNamespace getVariable format ["%1_tier_prog",  _side];
		};

		get_tier = {
			params ["_side"];
			missionNamespace getVariable format ["%1_tier",  _side];
		};


		get_strength = {
			params ["_side"];
			missionNamespace getVariable format ["%1_strength",  _side];
		};

		print_percentage = {
			params ["_side"];

			_tier = _side call get_tier; 
			_percentage = _side call get_tier_progress;

			if (_tier == 2) exitWith {
				"";
			}; 

			format[" %1%2", _percentage, "%"];
		};

		print_faction_stats = {
			params ["_side", "_color"];

			format[
				"<t color='%1' align='right' size='1'>T%2%3 %4</t>",
				_color,
				[_side] call get_tier,
				[_side] call print_percentage,
				[_side] call print_strength
				];
		};

		print_strength = {
			params ["_side"];
			0 max (ceil ([_side] call get_strength));
		};

		print_rank = {
			private _ranks = ["Private", "Sergant", "Lieutenant", "Captain", "Major", "Elite"];
			private _rank = player getVariable "rank";
			format["<t color='#000000' align='right' size='1'>%1</t>", _ranks select _rank];
		};

		print_manpower = {
			format["<t color='#8e8a00' align='right' size='1'>Manpower %1</t>", player getVariable "manpower"];
		};

		[] spawn {
			waitUntil {!isNull findDisplay 46};
			disableSerialization;

			private _ctrl = findDisplay 46 ctrlCreate ["RscStructuredText", -1];
			_ctrl ctrlSetPosition [safeZoneX, safeZoneY + safeZoneH * 0.5, safeZoneW, safeZoneH * 0.15];
			_ctrl ctrlCommit 0;

			while {true} do {			
				
				_ctrl ctrlSetStructuredText parseText format[
					"%1<br />%2<br />%3<br />%4<br />%5",
					[] call print_rank,
					[] call print_manpower,
					[west, '#000f72'] call print_faction_stats,
					[east, '#720000'] call print_faction_stats,
					[independent, '#097200'] call print_faction_stats
					];
			sleep 2;
			};
		};

	};
	
};

