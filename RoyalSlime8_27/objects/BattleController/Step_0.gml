/// @description Handle the battle/trek code
clamp(slime_dungeon_progression, 0, level_length);

if (progression_wait_timer <= 0) {
	var _rel_room = floor((slime_dungeon_progression)/ bkg_room_width);
	if (((slime_dungeon_progression + slime_move_rate) >= (_rel_room+1) * bkg_room_width)) {
		progression_wait_timer = 1;
		progress_condition_met = false;
		
		if (instance_number(ParentEnemy) > 0) {
			if (state == TREK_STATES.MOVING)
				state = TREK_STATES.BATTLE_INIT;
			else if (state == TREK_STATES.BATTLE_INIT)
				state = TREK_STATES.BATTLING;
		} else
			state = TREK_STATES.EVENT;
			
		with (ParentPlayer)
			image_speed = anim_speed_idle;

		slime_dungeon_progression = (_rel_room+1) * bkg_room_width;
	} else {
		if (progress_condition_type != HOTSPOT_TYPES.START || (progress_condition_type == HOTSPOT_TYPES.START && progression_wait_timer <= 0)) {
			slime_dungeon_progression += slime_move_rate;
			
			if (reset_player_action_bars) {
				with (ParentPlayer) {
					action_gauge_curr = 0;
				}
				reset_player_action_bars = false;
			}
			
			state = TREK_STATES.MOVING;
			
			with (ParentPlayer)
				image_speed = anim_speed_moving;
		}
	}
}

if (progress_condition_met) {
	if (progression_wait_timer >= 1 && (slime_dungeon_progression + slime_move_rate) < level_length) {
		progression_wait_timer--;
		slime_dungeon_progression += slime_move_rate;

		progress_condition_met = false;
	}
}

if (Game.debug) {
	if ((keyboard_check_pressed(vk_f2) || (keyboard_check(vk_alt) && keyboard_check_pressed(ord("K")))) && HUD.state == HUDStates.NEUTRAL) {
		var _num = instance_number(ParentEnemy)
		for (var _i = 0; _i < _num; _i++) {
			var _this_enemy = instance_find(ParentEnemy, _i);
			if (instance_exists(_this_enemy))
				_this_enemy.curr_hp = -1;
		}
	}
}

switch(progress_condition_type) { // Determines if a goal has been met at any given hotspot (e.g. were all monsters killed?)
	case HOTSPOT_TYPES.START:
		if (progression_wait_timer <= 0) {
			find_next_hotspot();
		} else
			progression_wait_timer--;
		break;
	case HOTSPOT_TYPES.HORDE:
		var _ene_count = instance_number(ParentEnemy);
		var _all_enemies_essence = true;
		
		for (var _i = 0; _i < _ene_count; _i++) {
			var _this_enemy = instance_find(ParentEnemy, _i);
			if (_this_enemy.state != MON_STATES.ESSENCE) {
				_all_enemies_essence = false;
			} else if (_this_enemy.image_index < _this_enemy.spr_death_frame_count - 1)
				_all_enemies_essence = false;
		}
		
		if (progression_wait_timer <= 1) {
			if (_all_enemies_essence) {
				//reset_player_action_bars = true; // Actually nvm, unused code
				progression_wait_timer = progression_wait_timer_value;
				
				// All essences are transparent the entire battle until the battle ends (which is now)
				with (ParentEnemy) {
					battle_over = true;
				}
				with (ParentPlayer)
					img_alpha_to = 1;
			}
		} else {
			progression_wait_timer--;
		}
		
		if (_all_enemies_essence && progression_wait_timer > 1 && progression_wait_timer <= 2) {
			progression_wait_timer = 1;
			find_next_hotspot();
		}
		break;
	case HOTSPOT_TYPES.END:
	default:
		break;
}

switch(state) {
	case TREK_STATES.BATTLE_INIT:
		init_battle_sequence();
		break;
	case TREK_STATES.BATTLING:
		step_battle_sequence();
		break;
	default:
		break;
}