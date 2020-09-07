/// @function determine_attacking_target(object_index)
/// @description Look for the player with the lowest HP, and then attack based on that info
/// @param {real} object_index provides the object index of this attacker to determine if it's a player/enemy
/// @param {real} object_id provides the object id of this attacker so we know exactly who is attacking
function attacking_determine_target() {

	var _obj_index = argument[0];
	var _id = argument[1];
	var _player_party_target = false;

	// Determine if the provided attacker is a player or enemy
	if (_obj_index = ParentEnemy)
		_player_party_target = true;
	else if (_obj_index = ParentPlayer)
		_player_party_target = false;

	// Set everyone on the opposing party to draw with transparency
	var _ds = BattleController.fighter_list;
	var _flist_size = ds_list_size(_ds);

	for (var _i = 0; _i < _flist_size; _i++) {
		var _this_fighter = _ds[| _i];
		if (_this_fighter.object_index != _obj_index)
			_this_fighter.img_alpha_to = battle_transparent_value;
	}

	// Set the attacker's transparency to no transparency (100% opacity), just in case
	_id.img_alpha_to = 1;


	if (_player_party_target) { // If we are the enemy, find the lowest-HP player
		var _player_lowest_hp = noone;
		var _lowest_hp = 99999999;
		var _player_box = BattleController.player_box;
		var _player_party = BattleController.player_party;
		var _num_players = array_length_1d(_player_party);
		for (var _i = 0; _i < _num_players; _i++) {
			var _this_player = _player_box[| _player_party[_i]];
			if (instance_exists(_this_player)) {
				with (_this_player) {
					if (curr_hp < _lowest_hp && curr_hp > 0) {
						_lowest_hp = curr_hp;
						_player_lowest_hp = _this_player;
					}
				}
			}
		}
		return _player_lowest_hp;
	} else { // If we are the player, find the lowest-HP enemy
		var _enemy_lowest_hp = noone;
		var _lowest_hp = 99999999;
		var _num_enemies = instance_number(ParentEnemy);
		for (var _i = 0; _i < _num_enemies; _i++) {
			var _this_enemy = instance_find(ParentEnemy, _i);
			if (instance_exists(_this_enemy)) {
				if (_this_enemy.curr_hp < _lowest_hp && _this_enemy.curr_hp > 0) {
					_lowest_hp = _this_enemy.curr_hp;
					_enemy_lowest_hp = _this_enemy;
				}
			}
		}
	
		return _enemy_lowest_hp;
	}

	return noone; // No enemy was determined. (If for some reason we make it this far into the code)

	//show_debug_message(object_get_name(_obj_index));


}
