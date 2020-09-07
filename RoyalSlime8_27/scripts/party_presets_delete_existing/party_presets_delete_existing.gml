/// @function party_presets_delete_existing()
/// @description Deletes the selected preset from the available party presets
function party_presets_delete_existing() {

	var _presets = BattleController.party_presets;
	var _presets_size = ds_list_size(_presets);

	if (_presets_size > 1) {
		ds_list_delete(_presets, other.relative_party_selection);
		_presets_size = ds_list_size(_presets);
								
		if (other.relative_party_selection >= _presets_size)
			other.relative_party_selection--;
		if (_presets_size <= 4) {
			other.editing_party_scroll_y_pos = 0;
		} else {
			if (other.editing_party_scroll_y_pos > 4)
				other.editing_party_scroll_y_pos--;
		}
	} else
		show_debug_message("Only one slot left: Cannot delete!");


}
