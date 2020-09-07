/// @description Insert description here
// You can write your code in this editor

switch pop {

	case false:
	if x != xstart {
		x+= spd;
	}
	break;
	
	case true:
	if x > 295 {
		x-= spd;
	}
	break;

}

if window {
	if !instance_exists(SettingsMenu) {
		instance_create_depth(95,18,depth,SettingsMenu);
	}
}


with SettingsMenu {
	
}

if place_meeting(x,y,o_cursor_test) and mouse_check_button(mb_left) and !window {
	window = true;
}

/*
switch window {

	case true:
	draw_sprite(s_window_options,0,95,18);
	draw_sprite(s_window_fullscreen,0,95,18);
	draw_sprite(s_window_scale,0,95,18);
	draw_sprite(s_window_volume,1,95,18);
	break;

}