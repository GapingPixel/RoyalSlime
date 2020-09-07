/// @function perform_melee(effect_type, spr_index)
/// @description Hurts a designated target with a designated amount of attack damage
/// @param {real} effect_type The battle effect we're performing
/// @param {real} spr_index The sprite to use for the effect
function perform_melee() {

	var _effect_type = argument[0];
	var _spr_index = argument[1];

	switch(melee_state) {
		case MELEE_STATES.INITIAL_LUNGE:
			target_fighter = attacking_determine_target(object_index, id);

			if (target_fighter != noone) {
				target_fighter.img_alpha_to = 1;
				spr_index = spr_idle;
				image_speed = anim_speed_idle;
				image_index = 0;
				lunge_at_target(target_fighter, object_index == ParentEnemy);
				melee_state = MELEE_STATES.ATTACKING;
			} else {
				// Nobody was found. Abort the battle.
				show_debug_message("Failed to find a target to attack! Aborting battle...");
				BattleController.abort_battle = true;
			}
			break;
		case MELEE_STATES.ATTACKING:
			if (z_pos >= 0) {
					
				if (spr_index != spr_atk) {
					spr_index = spr_atk;
					image_index = 0;
					image_speed = anim_speed_attacking;
				} else if (spr_index == spr_atk) {
					// Actual attack happens here
					var _img_count = sprite_get_number(spr_index);
					var _lvl_pos = BattleController.level_hotspots[((BattleController.hotspots_travelled - 1) * 3)];
					if (image_index >= _img_count) {
						img_xoff = 0;
						img_yoff = 0;
			
						// Jump back to our starting position
						zsp = -jump_speed;
							
						if (object_index == ParentPlayer) {
							x_off_to = BattleController.player_battle_position_x[fighter_slot];
							y_off_to = BattleController.player_battle_position_y[fighter_slot];
						} else {
							x_off_to = _lvl_pos + BattleController.enemy_battle_position_x[fighter_slot];
							y_off_to = BattleController.enemy_battle_position_y[fighter_slot];
						}
							
						melee_state = MELEE_STATES.RETREAT_LUNGE;
					} else if (image_index >= melee_hurt_frame && !melee_attacked) { // Attack animation is on the frame we need to spawn the battle effect on (Most of these are 5)
						// Spawn the battle effect
						melee_attacked = true;
							
						var _dist = attacking_distance_x;
						if (object_index == ParentEnemy)
							_dist = -attacking_distance_x - _lvl_pos;

						var _bateff = instance_create_depth(x_off_to + _dist, y_off_to - target_fighter.melee_hurt_effect_height, depth, BattleEffect);
						//show_message(string(_bateff.x) + ", " + string(_bateff.y))
						_bateff.target_fighter = target_fighter;
						_bateff.parent_id = id;
						_bateff.effect_type = _effect_type;
						_bateff.dmg_amount = calculate_damage(id, target_fighter, ATTACK_TYPES.STRENGTH);
						_bateff.sprite_index = _spr_index;//melee_hurt_effect_sprite;
						_bateff.mask_index = _spr_index;//melee_hurt_effect_sprite;
						_bateff.effect_frames_max = sprite_get_number(_spr_index);
						_bateff.image_index = 0;
						_bateff.image_speed = melee_hurt_effect_ani_speed;
							
					}
				}
			}
			break;
		case MELEE_STATES.RETREAT_LUNGE:
			if (z_pos >= 0) { // End the move as soon as this fighter has landed, post-attack
				spr_index = spr_idle;
				image_speed = anim_speed_idle;
				image_index = 0;
				//attacking_basic_melee(target_fighter, _attacker_is_player);
				target_fighter = noone;
				z_pos = 0;
				zsp = 0;
				melee_state = MELEE_STATES.NO_MELEE;
				performing_move = MON_PASSIVES.NOT_ATTACKING;
				melee_attacked = false;
				//passive_looping--;
			}
			break;
		case MELEE_STATES.NO_MELEE:
			if (turns_left > 0) {
				melee_state = MELEE_STATES.INITIAL_LUNGE;
			}
			break;
	}


}
