/// @description Insert description here
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

show_debug_message(string(_mx) + ", " + string(_my));
if (point_in_rectangle(_mx, _my, bbox_left, bbox_top, bbox_right, bbox_bottom)) {
	var _str = get_ingredient_name(item_type, item_index);
	//show_debug_message(_str + ", " + string(quantity));
}
//instance_destroy(FusionHouse_ClickableIngredient);
