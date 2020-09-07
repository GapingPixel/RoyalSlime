/// @function update_party_preset_selection(relative_click_position)
/// @description Updates relative_party_selection based on where the mouse clicked
/// @param {real} relative_click_position Which "relative tile" on the party-preset selector we clicked at
function update_party_preset_selection() {

	var _val = argument[0];
	var _out_val = editing_party_scroll_y_pos + _val;

	// Make sure that we don't exceed the bounds of the party preset choices; Don't update the selection value if we went too far
	var _presets = BattleController.party_presets;
	var _party_preset_size = ds_list_size(_presets);

	if (_out_val <= _party_preset_size - 1)
		relative_party_selection = _out_val;//clamp(relative_party_selection, 0, _party_preset_size - 1);


}
