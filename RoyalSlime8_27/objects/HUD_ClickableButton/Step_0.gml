/// @description Insert description here
if (mouse_check_button(mb_left) && position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id)) {
	// Before we allow this button to be pressed, make sure we're not already holding down a different button
	var _no_buttons_pressed = true;
	var _inst_count = instance_number(HUD_ClickableButton);
	for (var _i = 0; _i < _inst_count; _i++) {
		var _this_inst = instance_find(HUD_ClickableButton, _i);
		if (_this_inst.pressed)
			_no_buttons_pressed = false;
	}
	
	if (_no_buttons_pressed)
		pressed = true;
} else if (!mouse_check_button(mb_left)) {
	pressed = false;
	holding_timer = 0;
}

switch (button_id) {
	case BUTTON_IDS.PARTY_DEL:
	case BUTTON_IDS.PARTY_NEW:
	case BUTTON_IDS.PARTY_RENAME:
		exit;
}

if (pressed) {
	holding_timer++;
	if (holding_timer >= party_preset_scroll_speed) {
		holding_timer = 0;
		var _inc = 1;
	
		if (button_id == BUTTON_IDS.PARTY_UP_ARROW) {
			_inc = -1;
		}
	
		with(HUD) {
			if (can_scroll_with_button_click) {
				editing_party_scroll_y_pos += _inc;
			}
			
			var _preset_count = ds_list_size(BattleController.party_presets);
			editing_party_scroll_y_pos = clamp(editing_party_scroll_y_pos, 0, _preset_count - 1);
		}
	}
}