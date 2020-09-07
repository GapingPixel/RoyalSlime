/// @description Insert description here
// You can write your code in this editor
if mouse_check_button(mb_left) {
	if !instance_exists(o_exit_confirmation_window) {
		instance_create_depth(95,18,depth-2,o_exit_confirmation_window);
	}
	if !instance_exists(o_button_yes) {
		instance_create_depth(105,90,depth-3,o_button_yes);
	}
	if !instance_exists(o_button_no) {
		instance_create_depth(165,90,depth-3,o_button_no);
	}
}