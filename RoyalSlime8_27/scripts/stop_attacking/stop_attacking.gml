/// @function set_monster_stats(attacker_object_id)
/// @description Restores an attacker to idle state after an attack is truly over.
/// @param {real} attacker_object_id The unique instance ID value of the specific attacker to set back to idle state.
function stop_attacking() {

	var _attacker = argument[0];

	with (_attacker) {
		spr_index = spr_idle;
		image_speed = anim_speed_idle;
		image_index = 0;
		//attacking_basic_melee(target_fighter, _attacker_is_player);
		target_fighter = noone;
		z_pos = 0;
		zsp = 0;
		melee_state = MELEE_STATES.NO_MELEE;
		melee_attacked = false;
		performing_move = MON_PASSIVES.NOT_ATTACKING;
				
		shot_fireball = false;
				
		//passive_looping--;
	}


}
