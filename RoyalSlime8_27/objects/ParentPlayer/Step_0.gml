/// @description Player Step Event
depth = -y;

if (keyboard_check_pressed(ord("O"))) {
	monster_id = MONSTERS.DRACO;
	update_monster_form(monster_id);
}

// Handle gravity on the Z-Axis

if (zsp < grav_cap)
	zsp += grav;

if (z_pos >= 0 && zsp >= 0) {
	z_pos = 0;
	zsp = 0;
}

z_pos += zsp;


if BattleController.progress_condition_type ==  HOTSPOT_TYPES.END {
	spr_index = spr_victory;
	
}

if (BattleController.state == TREK_STATES.MOVING && spr_index != walk_sprite && BattleController.progression_wait_timer <= 0) {
	spr_index = walk_sprite;
	mask_index = spr_index;
}

if (init_battle) {
	spr_index = spr_idle;
	mask_index = spr_index;
	init_battle = false;
}


handle_performed_moves();

if (spr_index == spr_hurt && image_index >= spr_hurt_frame_count) {
	spr_index = spr_idle;
	mask_index = spr_index;
	image_index = 0;
	image_speed = anim_speed_idle;
	
	// Set every fighter's opacity back to 100%
	var _flist = BattleController.fighter_list;
	var _flist_size = ds_list_size(_flist);
	for (var _i = 0; _i < _flist_size; _i++) {
		_flist[| _i].img_alpha_to = 1;
	}
}

// Lerp movement

x = lerp(x, x_off_to, (lunge_time / room_speed));
y = lerp(y, y_off_to, (lunge_time / room_speed));


image_alpha = lerp(img_alpha_to, image_alpha, (fade_rate / room_speed));

/*
if (x != x_off_to) {
	x = lerp(x, x_off_to, lunge_time);
}
if (y != y_off_to) {
	y = lerp(y, y_off_to, lunge_time);
}
		