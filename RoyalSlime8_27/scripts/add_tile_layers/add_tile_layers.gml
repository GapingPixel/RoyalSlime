/// @function add_background_layers(background_id, <any additional tiles>)
/// @description Amends any provided background tiles to the provided background's info slots
/// @param {real} background_id The background we're adding layers to
/// @param {real} background_layer The background layer to add to the designated background
/// @param {real} Additional tiles Any additional tiles to add
function add_tile_layers() {
	var _bkg_id = argument[0];
	var _layer_count = argument_count - 1;

	for (var _i = 1; _i <= _layer_count; _i++) {
		ds_list_add(_bkg_id[| BKG_DAT.TILE_LAYER_LIST], argument[_i]);
	}


}
