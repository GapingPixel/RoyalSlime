/// @description Handle UI logic for the right-pane windows
var _cam = Camera.cam;
var _view_x = 0; //camera_get_view_x(_cam);
var _view_y = 0; //camera_get_view_y(_cam);
// Line up all the clickable icons with the UI pane on the far right side of the game window
with(Game.icon_build) {
	x = _view_x + 302;
	y = _view_y + 40;
}

with(Game.icon_slime) {
	x = _view_x + 302;
	y = _view_y + 67;
}
with(Game.icon_resources) {
	x = _view_x + 301;
	y = _view_y + 94;
}
with(Game.icon_slime_dex) {
	x = _view_x + 301;
	y = _view_y + 124;
}
with(Game.icon_setting) {
	x = _view_x + 301;
	y = _view_y + 153;
}

with(Game.clickable_arrow_up) {
	x = _view_x + 93;
	y = _view_y + 97;
}

with(Game.clickable_arrow_down) {
	x = _view_x + 93;
	y = _view_y + 129;
}

with(Game.clickable_party_new_button) {
	x = _view_x + 55;
	y = _view_y + 83;
}

with(Game.clickable_party_delete_button) {
	x = _view_x + 80;
	y = _view_y + 83;
}

with(Game.clickable_party_rename_button) {
	x = _view_x + 14;
	y = _view_y + 83;
}

/*
		clickable_party_new_button.button_id = BUTTON_IDS.PARTY_NEW;
		clickable_party_delete_button.button_id = BUTTON_IDS.PARTY_DEL;
		clickable_party_rename_button.button_id = BUTTON_IDS.PARTY_RENAME;
*/

// Build Window UI Code
var _inst_count = instance_number(ParentDraggable);
var _y_off_mult = 0;
for (var _i = 1; _i <= _inst_count; _i++) {
	var _this_inst = instance_find(ParentDraggable, _i - 1);

	var _x_off = 0;
	if (_i % 2 == 0) {
		_x_off = 16;
	}

	with(_this_inst) {
		x = _view_x + 259 + 8 + _x_off;
		y = _view_y + 35 + 17 + (31 * _y_off_mult) + HUD.popup_juice_timer;
	}

	if (_i % 2 == 0) {
		_y_off_mult++;
	}
}

// Slime Party Window UI Code
if (state == HUDStates.PARTY_UI_OPEN) {
	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);

	// Check for left-clicking in the party editor UI, only if right-click context menu isn't up	
	if (!instance_exists(HUD_RightClickMenu)) {
		if (mouse_check_button_pressed(mb_left)) {
			var _update_selection = true;
			var _rel_tx = floor(_mx / 16) - 7;
			var _rel_ty = floor(_my / 16) - 1;
			if (_rel_tx < 0 || _rel_tx > 10 || _rel_ty < 0 || _rel_ty > 7) _update_selection = false;

			if (slime_window_state != SLIME_WINDOW_STATES.SLIME_VIEWER) _update_selection = false;

			if (_update_selection) selected_party_slime_slot = (_rel_ty * 11) + _rel_tx;

			/*
			// Check if we clicked to switch tabs in the popup UI 
			if (point_in_rectangle(_mx, _my, 8, 141, 55, 159)) {
				slime_window_state = SLIME_WINDOW_STATES.SLIME_VIEWER;
			} else if (point_in_rectangle(_mx, _my, 58, 141, 105, 159)) {
				slime_window_state = SLIME_WINDOW_STATES.PARTY_VIEWER;
			}
			*/

		} else if (mouse_check_button(mb_left)) {
			if (!party_ui_scrollbar.active) { // Only allow the player to do this if they're not dragging the window's scrollbar
				// Check if we clicked the first relative party preset editing slot
				if (point_in_rectangle(_mx, _my, 14, 97, 92, 106)) {
					update_party_preset_selection(0);
				} else if (point_in_rectangle(_mx, _my, 14, 107, 92, 116)) {
					update_party_preset_selection(1);
				} else if (point_in_rectangle(_mx, _my, 14, 117, 92, 126)) {
					update_party_preset_selection(2);
				} else if (point_in_rectangle(_mx, _my, 14, 127, 92, 136)) {
					update_party_preset_selection(3);
				}
			}
		}
	}
}

/*
with(icon_bh1) {
	x = _view_x + 259;
	y = _view_y + 57 + HUD.popup_juice_timer;
}
with(icon_bh2) {
	x = _view_x + 259 + 16;
	y = _view_y + 57 + HUD.popup_juice_timer;
}*/

with(ParentDraggableSlime) {
	if (dragging) HUD.dragging_slime_timer = 4;
}

if (mouse_check_button_pressed(mb_left)) {
	for (var _i = 0; _i < _inst_count; _i++) {
		var _this_inst = instance_find(ParentDraggable, _i);
		if (_this_inst.grab) return;
	}

	var _mx = device_mouse_x_to_gui(0);
	var _my = device_mouse_y_to_gui(0);

	if (collision_point(_mx, _my, Game.icon_build, false, true)) {
		// Toggle build UI popup window if we clicked on the corresponding icon
		if (state != HUDStates.BUILD_WINDOW_OPEN) {
			state = HUDStates.BUILD_WINDOW_OPEN;
			sfx_play(sfxOpenMenu, 0, false);

			for (var _i = 0; _i < _inst_count; _i++) {
				var _this_inst = instance_find(ParentDraggable, _i);
				_this_inst.visible = true;
			}
			popup_juice_timer = 4;
		} else {
			state = HUDStates.NEUTRAL;
			for (var _i = 0; _i < _inst_count; _i++) {
				var _this_inst = instance_find(ParentDraggable, _i);
				_this_inst.visible = false;
			}
		}
	} else if (collision_point(_mx, _my, Game.icon_slime, false, true)) {
		// Toggle party UI popup window if we clicked on the corresponding icon
		if (state != HUDStates.PARTY_UI_OPEN) {
			state = HUDStates.PARTY_UI_OPEN;
			sfx_play(sfxOpenMenu, 0, false);

			for (var _i = 0; _i < _inst_count; _i++) {
				var _this_inst = instance_find(ParentDraggable, _i);
				_this_inst.visible = true;
			}
			popup_juice_timer = 4;
		} else {
			state = HUDStates.NEUTRAL;
			for (var _i = 0; _i < _inst_count; _i++) {
				var _this_inst = instance_find(ParentDraggable, _i);
				_this_inst.visible = false;
			}
		}
	}

	// Set state to neutral if we left-clicked outside of the popup window
	switch (state) {
	case HUDStates.BUILD_WINDOW_OPEN:
		if (popup_juice_timer <= 0) {
			if (!point_in_rectangle(_mx, _my, _view_x + 252, _view_y + 25, _view_x + 295, _view_y + 159)) {
				state = HUDStates.NEUTRAL;
				for (var _i = 0; _i < _inst_count; _i++) {
					var _this_inst = instance_find(ParentDraggable, _i);
					_this_inst.visible = false;
				}
			}
		}
		break;
	case HUDStates.PARTY_UI_OPEN:
		// Determine if this is a double-click or not
		if (!instance_exists(HUD_RightClickMenu)) {
			if (double_click_timer <= 0) {
				if (point_in_rectangle(_mx, _my, _view_x + 14, _view_y + 96, _view_x + 92, _view_y + 138)) {
					double_click_timer = double_click_window;
				}
			} else if (double_click_timer > 0) {
				// This is a double-click. Perform rename if we're within the party preset box.
				if (slime_window_state = SLIME_WINDOW_STATES.PARTY_VIEWER) {
					if (point_in_rectangle(_mx, _my, _view_x + 14, _view_y + 96, _view_x + 92, _view_y + 138)) {
						party_presets_rename();
					}
				}
				double_click_timer = 0;
			} else double_click_timer = 0;

			if (popup_juice_timer <= 0) {
				if (!point_in_rectangle(_mx, _my, _view_x + 8, _view_y + 16, _view_x + 295, _view_y + 159) && dragging_slime_timer <= 0) {
					state = HUDStates.NEUTRAL;
					for (var _i = 0; _i < _inst_count; _i++) {
						var _this_inst = instance_find(ParentDraggable, _i);
						_this_inst.visible = false;
					}
				}
			}

			var _inst = collision_point(_mx, _my, HUD_ClickableButton, false, true);
			if (_inst != noone) {
				if (slime_window_state != SLIME_WINDOW_STATES.PARTY_VIEWER) break;
				with(_inst) {
					switch (button_id) {
					case BUTTON_IDS.PARTY_DEL:
						party_presets_delete_existing();
						break;
					case BUTTON_IDS.PARTY_NEW:
						party_presets_add_new();
						break;
					case BUTTON_IDS.PARTY_RENAME:
						party_presets_rename();
						break;
					default:
						break;
					}
				}
			}
		}
		break;
	}
}

if (dragging_slime_timer > 0) dragging_slime_timer--;

if (double_click_timer > 0) double_click_timer--;

if (state == HUDStates.PARTY_UI_OPEN && slime_window_state == SLIME_WINDOW_STATES.PARTY_VIEWER) {

	// Check constantly if we're hovering over a slime or not
	hovering_over_party_slime = collision_point(_mx, _my, ParentDraggableSlime, false, true);

	// Hotkeys for controlling the party preset list
	if (keyboard_check_pressed(vk_delete)) party_presets_delete_existing();
	if (keyboard_check_pressed(vk_insert)) party_presets_add_new();
	if (keyboard_check_pressed(vk_f2)) party_presets_rename();

	// Allow Up/Down key-presses to control the party preset window scrolling
	// ... but only if we're not hovering over/dragging a slime
	if (hovering_over_party_slime == noone && dragging_slime_id == noone) {
		can_scroll_with_button_click = true;
		if (Game.move_y != 0 && !party_ui_scrollbar.active) {
			var _preset_count = ds_list_size(BattleController.party_presets);
			editing_party_scroll_y_pos += Game.move_y;
			editing_party_scroll_y_pos = clamp(editing_party_scroll_y_pos, 0, _preset_count - 4);
			// Update the global scrollbar percentage based on how far down the list we are
			var _editing_party_scroll_y_pos = editing_party_scroll_y_pos;
			with(party_ui_scrollbar) {
				var _ratio = (_editing_party_scroll_y_pos / (_preset_count - 4)); // How far down the list, percentage-wise, we are.
				button_y = bar_height * _ratio;
			}

			can_scroll_with_button_click = false;
		}
	}

	// Right-click context menu for slime viewer
	if (mouse_check_button_pressed(mb_right) && dragging_slime_timer <= 0) {
		if (point_in_rectangle(_mx, _my, _view_x + 14, _view_y + 96, _view_x + 92, _view_y + 138)) {
			if (instance_exists(HUD_RightClickMenu)) {
				instance_destroy(HUD_RightClickMenu);
			}
			var _xoff = device_mouse_x_to_gui(0);
			var _yoff = device_mouse_y_to_gui(0);
			right_click_menu = instance_create_layer(_xoff, _yoff, "UI", HUD_RightClickMenu);
		}
	}

	if (mouse_check_button_pressed(mb_right)) {
		var _assigned_slot = noone;
		// Determine if we clicked on a party slot
		if (point_in_rectangle(_mx, _my, 36, 22, 59, 39)) _assigned_slot = 0;
		if (point_in_rectangle(_mx, _my, 31, 42, 54, 59)) _assigned_slot = 1;
		if (point_in_rectangle(_mx, _my, 26, 62, 49, 79)) _assigned_slot = 2;
		if (point_in_rectangle(_mx, _my, 64, 32, 87, 49)) _assigned_slot = 3;
		if (point_in_rectangle(_mx, _my, 58, 58, 81, 75)) _assigned_slot = 4;

		show_debug_message(_assigned_slot)

		if (_assigned_slot != noone) { // We right-clicked on a party slot. Clear that slot now.
			// Set the highlighted slime
			var _this_party = BattleController.party_presets[| relative_party_selection];

			// Then, store that slime in the preset at the slot we picked
			_this_party[_assigned_slot + 1] = noone;

			// Update the actual preset
			BattleController.party_presets[| relative_party_selection] = _this_party;
		}
	}
}

if (keyboard_check_pressed(vk_escape) && dragging_slime_timer <= 0 && global.mouse_building == false) {
	switch (state) {
	case HUDStates.BUILD_WINDOW_OPEN:
		if (popup_juice_timer > 0) break;
	case HUDStates.PARTY_UI_OPEN:
		if (instance_exists(HUD_RightClickMenu)) break;
		state = HUDStates.NEUTRAL;
		for (var _i = 0; _i < _inst_count; _i++) {
			var _this_inst = instance_find(ParentDraggable, _i);
			_this_inst.visible = false;
		}
		break;
	}
}

if (popup_juice_timer > 0) popup_juice_timer--;

depth = Camera.depth - 1;