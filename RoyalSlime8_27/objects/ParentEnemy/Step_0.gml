/// @description Enemy step event
depth = -y;

// Handle gravity on the Z-Axis
if (zsp < grav_cap)
	zsp += grav;

if (z_pos >= 0 && zsp > 0) {
	z_pos = 0;
	zsp = 0;
}

z_pos += zsp;

switch(state) {
	case MON_STATES.INIT:
		if (BattleController.state == TREK_STATES.MOVING)
		state = MON_STATES.ALIVE; // Delay for one frame to prevent improper HUD drawing
		break;
	case MON_STATES.ALIVE:
		handle_performed_moves();
		if (spr_index == spr_hurt && image_index > spr_hurt_frame_count) {
			spr_index = spr_idle;
			mask_index = spr_index;
			image_index = 0;
			
			// Set every fighter's opacity back to 100%
			var _flist = BattleController.fighter_list;
			var _flist_size = ds_list_size(_flist);
			for (var _i = 0; _i < _flist_size; _i++) {
				//_flist[| _i].img_alpha_to = 1;
			}
		}
		
		if (curr_hp <= 0 && spr_index != spr_death) {
			spr_index = spr_death;
			mask_index = spr_index;
			image_index = 0;
			state = MON_STATES.DYING;
			/*
			image_xscale = -1;
			image_speed = 0.02;
			*/
		}
		break;
	case MON_STATES.DYING:
		img_alpha_to = 1;
		if (image_index > spr_death_frame_count) {
			state = MON_STATES.ESSENCE;
			if (!battle_over)
				img_alpha_to = battle_transparent_value;
			image_speed = 0;
			image_index = spr_death_frame_count - 1;
		} else if (image_index >= spr_death_frame_count - 2) {
			shadow_size = MON_SHADOWS.SMALL;
		} else if (image_index > 2 && !spawned_material) {
			spawn_drop_material(monster_id); // On the 6th frame of the death animation, spawn a drop material based on the kind of monster + their RNG
			reward_exp_to_party(reward_exp_amount);
			spawned_material = true;
		}
		break;
	case MON_STATES.ESSENCE:
		var _amp = 4;
		var _freq = 150;
		
		img_yoff = -_amp*sin(2 * pi * death_time / _freq); // float in sine movement

		// Destroy this enemy if the slimes have progressed "_trigger_percentage" into the screen this enemy spawned on
		var _rel_room_percentage = (BattleController.slime_dungeon_progression / BattleController.bkg_room_width) % 1;
		var _trigger_percentage = 0.45;
		if (_rel_room_percentage > _trigger_percentage) {
			instance_destroy();
		}
		//instance_destroy();
		death_time++;
		
		// All essences are transparent the entire battle until the battle ends
		if (!battle_over)
			img_alpha_to = battle_transparent_value;
		else
			img_alpha_to = 1;
		
		
		break;
	default:
		break;
}


		
// Lerp movement

/*
x = x_off_to;
y = y_off_to;
*/


x = lerp(x, x_off_to, (lunge_time / room_speed));
y = lerp(y, y_off_to, (lunge_time / room_speed));

image_alpha = lerp(image_alpha, img_alpha_to, (fade_rate / room_speed));