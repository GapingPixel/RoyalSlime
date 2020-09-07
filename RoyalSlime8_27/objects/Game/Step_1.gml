/// @description Handle global controller inputs
move_x = 0;
move_y = 0;

key_up_held = max(0, keyboard_check(key_up), keyboard_check(key_up_alt));
key_down_held = max(0, keyboard_check(key_down), keyboard_check(key_down_alt));
key_left_held = max(0, keyboard_check(key_left), keyboard_check(key_left_alt));
key_right_held = max(0, keyboard_check(key_right), keyboard_check(key_right_alt));

move_x = -key_left_held + key_right_held;
move_y = -key_up_held + key_down_held;

//if (keyboard_check_pressed(vk_escape))
//	game_end();
if (!keyboard_check(vk_control)) {
	if (keyboard_check_pressed(ord("1"))) {
		win_size = 1;
		window_set_size(win_width * win_size, win_height * win_size);
		alarm[0] = 2;
	} else if (keyboard_check_pressed(ord("2"))) {
		win_size = 2;
		window_set_size(win_width * win_size, win_height * win_size);
		alarm[0] = 2;
	} else if (keyboard_check_pressed(ord("3"))) {
		win_size = 3;
		window_set_size(win_width * win_size, win_height * win_size);
		alarm[0] = 2;
	} else if (keyboard_check_pressed(ord("4"))) {
		win_size = 4;
		window_set_size(win_width * win_size, win_height * win_size);
		alarm[0] = 2;
	} else if (keyboard_check_pressed(ord("5"))) {
		win_size = 5;
		window_set_size(win_width * win_size, win_height * win_size);
		alarm[0] = 2;
	}
}

if (fullscreen_set) {
	window_set_size(win_width * win_size, win_height * win_size);
	alarm[0] = 2;
	fullscreen_set = false;
}

if (keyboard_check(vk_alt)) {
	if (keyboard_check_pressed(vk_enter)) {
		var _fullscreen_state = window_get_fullscreen();
		window_set_fullscreen(!_fullscreen_state);
		fullscreen_set = true;
	}
}

// Not to be put in final game
if (keyboard_check_pressed(vk_f5)) game_restart();