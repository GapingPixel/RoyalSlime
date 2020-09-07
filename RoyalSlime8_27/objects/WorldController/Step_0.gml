/// @description Keep track of where the player's mouse is
var _ts = 16;
var _otx = (map_draw_offset_x / _ts);
var _oty = 0;
var _mtx = floor(mouse_x / _ts) - _otx;
var _mty = floor(mouse_y / _ts) - _oty;

if (_mtx >= 0 && _mty >= 0) {
	if (mouse_check_button_pressed(mb_left)) {
		var _this_fusion_house = ds_grid_get(fusion_house_list, _mtx, _mty);
		if (_this_fusion_house != noone && _this_fusion_house != undefined) {
			if (instance_exists(_this_fusion_house)) {
				var _fusion_menu_already_open = false;
				with (FusionHouseData) {
					if (state != FusionHouseStates.INACTIVE)
						_fusion_menu_already_open = true;
				}
				
				if (!_fusion_menu_already_open) {
					with (_this_fusion_house) {
						state = FusionHouseStates.MAIN_MENU;
						initialize_time = 2;
						materials_menu_off_y = 1;
						materials_window_open = false;
					}
				}
			}
		}
	}
}