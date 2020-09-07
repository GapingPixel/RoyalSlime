/// @function party_presets_add_new()
/// @description Adds a new preset to the available party presets
function party_presets_add_new() {

	var _presets = BattleController.party_presets;
	var _presets_size = ds_list_size(_presets);
							
	if (_presets_size < BattleController.party_preset_max_capacity) {
		var _party_preset_slot = ["Untitled", noone, noone, noone, noone, noone];
		ds_list_insert(_presets, other.relative_party_selection + 1, _party_preset_slot);
	} else {
		show_debug_message("Too many slots (" + string(_presets_size) + ")! Can't add any more.");
	}


}
