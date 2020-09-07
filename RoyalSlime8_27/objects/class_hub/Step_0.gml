/// @description Insert description here
// You can write your code in this editor
if Game.state != GameStates.MAIN_MENU {
	instance_destroy();
}

if hover_sprite != noone {
	if place_meeting(x,y,o_cursor_test) {
		sprite_index = hover_sprite;
	} else {
		sprite_index = normal_sprite;
	}
}