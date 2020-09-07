/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,o_cursor_test) {
	sprite_index = hover_sprite;
} else {
	sprite_index = normal_sprite;
}

if !instance_exists(o_exit_confirmation_window) {
	instance_destroy();
}