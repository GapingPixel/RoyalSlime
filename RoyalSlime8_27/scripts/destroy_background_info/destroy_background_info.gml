/// @function destroy_background_info()
/// @description Destroys any and all background tiles or layers that have been created
function destroy_background_info() {

	var _dun_bkgs = BattleController.dun_bkgs;
	var _num_bkgs = ADV_BKGS.MAX - 1;

	for (var _i = 0; _i <= _num_bkgs; _i++) {
		var _this_bkg = _dun_bkgs[| _i];
	
		if (ds_exists(_this_bkg, ds_type_list)) {
			// Destroy all the existing background layers
			var _layer_list = _this_bkg[| BKG_DAT.BKG_LAYER_LIST];
			ds_list_destroy(_layer_list);
	
			// Destroy all the existing background tiles
			var _tiles_list = _this_bkg[| BKG_DAT.TILE_LAYER_LIST];
			ds_list_destroy(_tiles_list);
	
			// Delete the background itself
			ds_list_destroy(_this_bkg);
		}
	}

	ds_list_destroy(_dun_bkgs);


}
