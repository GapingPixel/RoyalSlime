/// @function spawn_drop_material(monster_id)
/// @description Spawns a material drop based on the monster type. The prize pools are pre-defined in the define_reward_drops() script
/// @param {real} monster_id The ID of the monster we're getting the prize pool of
function spawn_drop_material() {

	var _enemy = argument[0];
	var _this_drop_obj = instance_create_depth(x, y, depth, MaterialDrop);

	var _this_reward = REWARDS.NOTHING;

	switch (_enemy) {
		case MONSTERS.E_DRACO:
			_this_reward = choose_weighted(REWARDS.DRAGO_WING_ONE, 25,
											REWARDS.DUCK_BEAK_SIX, 25,
											REWARDS.DRAGO_MATTER_THREE, 25,
											REWARDS.NOTHING, 25);
			set_reward_drop(_this_drop_obj, _this_reward);
			break;
		case MONSTERS.E_SOOTSWINE:
			_this_reward = choose_weighted(REWARDS.DUCK_BEAK_SIX, 50, REWARDS.NOTHING, 50);
			set_reward_drop(_this_drop_obj, _this_reward);
			break;
		case MONSTERS.E_PENKING:
			_this_reward = choose_weighted(REWARDS.DRAGO_MATTER_THREE, 50, REWARDS.NOTHING, 50);
			set_reward_drop(_this_drop_obj, _this_reward);
			break;
	}

	if (_this_reward == REWARDS.NOTHING) {
		instance_destroy(_this_drop_obj);
	} else {
		// Let the new material fly away from the enemy and onto the ground. Set other properties for it here too (like its name to display as the player grabs it)
		_this_drop_obj.hsp = 8;
		_this_drop_obj.vsp = 0;
		_this_drop_obj.z_pos = -3;
		_this_drop_obj.zsp = -5;
		_this_drop_obj.reward_name = get_ingredient_name(_this_drop_obj.reward_type, _this_drop_obj.reward);
	}


}
