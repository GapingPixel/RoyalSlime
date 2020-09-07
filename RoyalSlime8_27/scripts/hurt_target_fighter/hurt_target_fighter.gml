/// @function hurt_target_fighter(target_fighter_id, dmg_amount)
/// @description Hurts a designated target with a designated amount of attack damage
/// @param {real} target_fighter_id The id of the object to attack
/// @param {real} dmg_amount The amount of damage to deal to the designated target
function hurt_target_fighter() {

	var _targ = argument[0];
	var _dmg_amount = argument[1];

	var _rx = 0;
	var _ry = 0;

	with (_targ) {
		if (_dmg_amount > 0) {
			spr_index = spr_hurt;
			image_index = 0;
			image_speed = anim_speed_hurt;
			curr_hp -= _dmg_amount;
		}
		_rx = x;
		_ry = y;
	
	}

	var _head = ds_queue_head(BattleController.turn_order);

	if (!is_undefined(_head)) {
		if (instance_exists(_head)) {
			if (_head.object_index == ParentEnemy)
				_rx += BattleController.bkg_draw_offset_x;
		} else {
			show_debug_message("Undefined target to hurt! [hurt_target_fighter] script");
		}
	} else {
		show_debug_message("Undefined target to hurt! [hurt_target_fighter] script");
	}

	print_damage(_rx, _ry, _dmg_amount);


}
