/// @description Insert description here

// Check if the mouse is hovered over the menu at all
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (collision_point(_mx, _my, self, false, false)) {
	// The mouse is hovered over the menu. Figure out which element it's hovered over specifically
	hovered_over = floor((_my - y) / 13);
} else {
	hovered_over = noone;
}

for (var _i = 0; _i < menu_elements_count; _i++) {
	draw_sprite(RightClick_DropMenu, 0, x, y + (13 * _i));
	if (hovered_over == _i)
		draw_set_color(c_red);
	else
		draw_set_color(c_white);
	
	draw_set_font(global.font);
	draw_text_man(x + 2, y + 2 + (13 * _i), menu_elements[_i]);
}

// We clicked; Determine what to do with this click
if (mouse_check_button_pressed(mb_left)) {
	switch (hovered_over) {
		default:
		case noone:
			break;
		case 0:
			party_presets_rename();
			break;
		case 1:
			party_presets_add_new();
			break;
		case 2:
			party_presets_delete_existing();
			break;
	}
	instance_destroy();
}