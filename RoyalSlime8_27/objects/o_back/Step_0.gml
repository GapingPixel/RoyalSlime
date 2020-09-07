/// @description Insert description here
// You can write your code in this editor
if Game.state == GameStates.MAIN_MENU or Game.state == GameStates.SLIMES_INVENTORY 
	or Game.state == GameStates.SLIMES_MONSTERPEDIA or Game.state == GameStates.INIT {
	
	instance_destroy();
}

if place_meeting(x,y,o_cursor_test) {
		sprite_index = s_button_back_hover;
} else {
		sprite_index = s_button_back;
}