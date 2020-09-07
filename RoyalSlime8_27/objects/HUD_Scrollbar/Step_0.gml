/// @description Insert description here
global.scroll_perc = button_y / bar_height; // Get percentage of how far down the scrollbar we are

if (!scrollbar_enabled) {
	active = false;
	exit;
}

if (collision_point(mouse_x, mouse_y, self, false, false)) {
	if (mouse_check_button_pressed(mb_left)) {
		if (!active)
			active = true;
	}
}

if (mouse_check_button_released(mb_left)) {
	if (active)
		active = false;
}

if (!active) {
	if (mouse_wheel_up()) {
		//if (mouse_x < x) {
			button_y = clamp(button_y - scroll_amount, 0, bar_height);
			global.scroll_perc = button_y / bar_height;
		//}
		// Update party preset menu scrolling
		with (HUD) {
			var _preset_count = ds_list_size(BattleController.party_presets);
			editing_party_scroll_y_pos = floor((((_preset_count) * (10)) * global.scroll_perc) / _preset_count);
			editing_party_scroll_y_pos = clamp(editing_party_scroll_y_pos, 0, _preset_count);
		}
	}
	if (mouse_wheel_down()) {
		//if (mouse_x < x) {
			button_y = clamp(button_y + scroll_amount, 0, bar_height);
			global.scroll_perc = button_y / bar_height;
	show_debug_message(string(button_y) + ", " + string(global.scroll_perc))
		//}
	// Update party preset menu scrolling
		with (HUD) {
			var _preset_count = ds_list_size(BattleController.party_presets);
			editing_party_scroll_y_pos = floor((((_preset_count) * (10)) * global.scroll_perc) / _preset_count);
			editing_party_scroll_y_pos = clamp(editing_party_scroll_y_pos, 0, _preset_count);
		}
	}
} else if (active) {
	button_y = clamp(mouse_y - y, 0, bar_height);
	global.scroll_perc = button_y / bar_height;
	show_debug_message(string(button_y) + ", " + string(global.scroll_perc))
	// Update party preset menu scrolling
	with (HUD) {
		var _preset_count = ds_list_size(BattleController.party_presets);
		//editing_party_scroll_y_pos = floor((((_preset_count) * (10)) * global.scroll_perc) / (_preset_count));
		editing_party_scroll_y_pos = floor((((_preset_count) * (10)) * global.scroll_perc) / _preset_count);
		editing_party_scroll_y_pos = clamp(editing_party_scroll_y_pos, 0, _preset_count);
	}
}

button_y = clamp(button_y, 0, bar_height);