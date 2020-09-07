/// @description Initialize some variables
debug = true;

state = GameStates.MAIN_MENU;
win_width = 320//1280;
win_height = 180//720;
win_size = 4;
fullscreen_set = true;

cam = noone; // Camera

window_set_size(win_width * win_size, win_height * win_size);


alarm[0] = 1;

ticks = 0; // How long the game has been running for

global.font = font_add_sprite(sprFontMain, ord(" "), true, -1);
global.damage_font = font_add_sprite_ext(sprFontDamage, "0123456789", true, -1);
global.stats_font_active = font_add_sprite_ext(sprStatsFontActive, "1234567890!", true, -1);
global.stats_font_inactive = font_add_sprite_ext(sprStatsFontInactive, "1234567890!", true, -1);

main_fnt_widths = ds_map_create();

define_font_widths();

global.mouse_building = false;
global.selected_floor = 1;

enum BUTTON_IDS {
	UNDEFINED,
	PARTY_UP_ARROW,
	PARTY_DOWN_ARROW,
	PARTY_NEW,
	PARTY_DEL,
	PARTY_RENAME,
	MAX
};
		
// Icons
icon_build = noone;
icon_slime = noone;
icon_resources = noone;
icon_slime_dex = noone;
icon_setting = noone;
hud = noone;
clickable_arrow_up = noone;
clickable_arrow_down = noone;

// Controls
key_up = vk_up;
key_down = vk_down;
key_left = vk_left;
key_right = vk_right;
key_up_alt = ord("W");
key_left_alt = ord("A");
key_down_alt = ord("S");
key_right_alt = ord("D");

move_x = 0;
move_y = 0;

#macro grav 0.9
#macro grav_cap 9.81

ds_digits = ds_list_create();

// Settings

global.fullscreen = true;
global.vsync = false;
global.masterVolume = 1;
global.musicVolume = 1;
global.sfxVolume = 1;

audio_group_load(Music);
audio_group_load(SFX);

