/// @description Insert description here
// You can write your code in this editor
//event_inherited();
/*if mouse_check_button_pressed(mb_left) and !place_meeting(x,y,o_cursor_test) {
	instance_destroy();
}*/
if !place_meeting(x,y,o_cursor_test) and mouse_check_button(mb_left) {
	SettingsIcon.window = false;
	instance_destroy();
}


with Fullscreen_tickbox {
	if mouse_check_button_pressed(mb_left) and place_meeting(x,y,o_cursor_test) {
		
		global.fullscreen = !global.fullscreen;
		image_index = global.fullscreen;
		window_set_fullscreen(global.fullscreen);
		
		if global.fullscreen == false then Game.alarm[0] = 2;
	}
}

with Vsync_tickbox {
	if mouse_check_button_pressed(mb_left) and place_meeting(x,y,o_cursor_test) {
		global.vsync = !global.vsync;
		image_index = global.vsync;
		//display_reset(0,global.vsync);
		with Game {
			
			alarm[0] = 2;
			alarm[1] = 2;
		}
	}
}

with (Scale_Arrow_left) {
	
	if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
		with Game {
			win_size -= 4;
			win_size = max(win_size,4);
			window_set_size(win_width * win_size, win_height * win_size);
			alarm[0] = 2;
		}
		audio_play_sound(sfxSelect,10,false);
	}
}

with (Scale_Arrow_right) {
	if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
		with Game {
			win_size += 4;
			win_size = min(win_size,8);
			window_set_size(win_width * win_size, win_height * win_size);
			alarm[0] = 2;
		}
		audio_play_sound(sfxSelect,10,false);
	}
}

with MasterSound_Arrow_left {

	if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
			if global.masterVolume >= .2 {
				global.masterVolume -= .2;
				audio_master_gain(global.masterVolume);
			}
			audio_play_sound(sfxSelect,10,false);
	}
}

with MasterSound_Arrow_right {

	if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
		if global.masterVolume <= .8 {
			global.masterVolume += .2;
			audio_master_gain(global.masterVolume);
		}
		audio_play_sound(sfxSelect,10,false);
	}
}

with MusicSound_Arrow_left {

	if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
			if global.musicVolume >= .2 {
				global.musicVolume -= .2;
				audio_group_set_gain(Music,global.musicVolume,0);
			}
			audio_play_sound(sfxSelect,10,false);
	}
}

with MusicSound_Arrow_right {

	if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
		if global.musicVolume <= .8 {
			global.musicVolume += .2;
			audio_group_set_gain(Music,global.musicVolume,0);
		}
		audio_play_sound(sfxSelect,10,false);
	}
}

with SFXSound_Arrow_left {

	if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
			if global.sfxVolume >= .2 {
				global.sfxVolume -= .2;
				audio_group_set_gain(SFX,global.sfxVolume,0);
			}
			audio_play_sound(sfxSelect,10,false);
	}
}

with SFXSound_Arrow_right {

	if place_meeting(x,y,o_cursor_test) and mouse_check_button_pressed(mb_left) {
		if global.sfxVolume <= .8 {
			global.sfxVolume += .2;
			audio_group_set_gain(SFX,global.sfxVolume,0);
		}
		audio_play_sound(sfxSelect,10,false);
	}
}


