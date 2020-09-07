/// @description Insert description here
if (HUD.slime_window_state != SLIME_WINDOW_STATES.PARTY_VIEWER || HUD.state != HUDStates.PARTY_UI_OPEN)
	exit;

dragging = !dragging;

var _mrx = device_mouse_x_to_gui(0);
var _mry = device_mouse_y_to_gui(0);

if (dragging) {
	HUD.dragging_slime_id = id;
	HUD.dragging_slime = true;
	HUD.selected_party_slime_slot = my_slime_id;
} else {
	// Check if we dropped this slime on a party slot
	with (HUD) {
		if (state == HUDStates.PARTY_UI_OPEN && slime_window_state == SLIME_WINDOW_STATES.PARTY_VIEWER) {
			// Debug party assignments
			var _assigned_slot = noone;
				
			// Determine if we clicked on a party slot
			if (point_in_rectangle(_mrx, _mry, 36, 22, 59, 39))
				_assigned_slot = 0;
			if (point_in_rectangle(_mrx, _mry, 31, 42, 54, 59))
				_assigned_slot = 1;
			if (point_in_rectangle(_mrx, _mry, 26, 62, 49, 79))
				_assigned_slot = 2;
			if (point_in_rectangle(_mrx, _mry, 64, 32, 87, 49))
				_assigned_slot = 3;
			if (point_in_rectangle(_mrx, _mry, 58, 58, 81, 75))
				_assigned_slot = 4;

			if (_assigned_slot != noone) {
				// Grab the highlighted slime
				var _pbox = BattleController.player_box;
				var _this_slime = _pbox[| selected_party_slime_slot];
		
				if (!is_undefined(_this_slime)) { // Check if the slime exists
					// The slime exists. First, check all the party slots to ensure that it's not already in the preset. Delete it from the preset if it's already being assigned.
					var _this_party = BattleController.party_presets[| relative_party_selection];
					for (var _i = 1; _i <= 5; _i++) {
						var _checked_slime = _this_party[_i];
				
						if (_checked_slime == _this_slime)
							_this_party[_i] = noone;
					}
			
					// Then, store that slime in the preset at the slot we picked
					_this_party[_assigned_slot + 1] = _this_slime;
			
					// Update the actual preset
					BattleController.party_presets[| relative_party_selection] = _this_party;
				} else {
					// This slime does not exist; Set the party slot to blank
					var _this_party = BattleController.party_presets[| relative_party_selection];
					_this_party[_assigned_slot + 1] = noone;
					BattleController.party_presets[| relative_party_selection] = _this_party;
				}
			}
	
			show_debug_message("Updated party at: " + string(_assigned_slot));
		}
	}
	
	// Regardless, we should make the HUD forget about the dragged slime
	if (HUD.dragging_slime_id == id) {
		HUD.dragging_slime_id = noone;
		HUD.dragging_slime = false;
	}
}

