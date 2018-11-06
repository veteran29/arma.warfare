kills_per_rank = 5;
max_rank = 5;

AW_get_rank_skill = {
	private _rank = [] call AW_calculate_rank;
	_rank call AW_get_skill_based_on_rank;
};

AW_calculate_rank = {
	private _current_kill_count = player getvariable ["kills", 0];
	((_current_kill_count - (_current_kill_count mod kills_per_rank)) / kills_per_rank) min max_rank;	
};

AW_get_skill_based_on_rank = {
	params ["_rank"];
	(_rank / (max_rank * 2)) + 0.5;
};

AW_calculate_rank_and_skill = {
	private _last_kill_count = 0;
	while {true} do {
		private _current_kill_count = player getvariable ["kills", 0];

		if(!(_current_kill_count == _last_kill_count)) then {
			private _new_rank = _current_kill_count call AW_calculate_rank;
			private _current_rank = player getVariable ["rank", 0];

			if(!(_new_rank == _current_rank)) then {
				player setVariable ["rank", _new_rank, true];

				private _new_skill = [_new_rank] call AW_get_skill_based_on_rank;
				if(player isEqualTo (leader group player)) then {
					[_new_skill, group player] spawn AW_adjust_skill;	
				};
			};
		};
		_last_kill_count = _current_kill_count;
		sleep 2;
	};
};

AW_increment_player_kill_counter = {	
	private _kills = player getVariable ["kills", 0];
	player setVariable ["kills", _kills + 1];			
};

	