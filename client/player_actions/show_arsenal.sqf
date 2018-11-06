AW_add_arsenal_action = {  
  params ["_box"];

  _box addAction [["Arsenal", 0] call AW_addActionText, {
      ["Open",true] spawn BIS_fnc_arsenal;
    }, nil, 150, true, false, "",
    '[_target, _this] call AW_owned_box && [_this] call AW_not_in_vehicle', 10
    ];
};

AW_owned_box = {
    params ["_box", "_player"];
    (_box getVariable AW_owned_by) isEqualTo (side _player);
};


