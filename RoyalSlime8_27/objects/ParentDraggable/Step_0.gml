/// @description Insert description here
if (!visible || HUD.state != HUDStates.BUILD_WINDOW_OPEN) exit;
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left) && !grab && collision_point(_mx, _my, self, false, false)) {
	sfx_play(sfxDragInit);
	grab = true;
	depth = HUD.depth - 2;
	global.mouse_building = true;
} else if (mouse_check_button_pressed(mb_left) && grab) {

	var _view_x = 0; //camera_get_view_x(_cam);
	var _view_y = 0; //camera_get_view_y(_cam);
	var _clicked_in_popup_box = point_in_rectangle(_mx, _my, _view_x + 252, _view_y + 25, _view_x + 295, _view_y + 159);
	var _cond2 = !point_in_rectangle(_mx, _my, _view_x + 176, _view_y + 0, _view_x + 295, _view_y + 111);
	var _cond3 = (Camera.camera_mode == CamModes.REGULAR);

	if (collision_point(_mx, _my, ParentDraggable, false, false) || _clicked_in_popup_box) {
		grab = false;
		depth = HUD.depth - 1;
		exit;
	}

	var _ts = WorldController.tile_size;
	// Define global map offsets
	var _gox = WorldController.map_draw_offset_x;
	var _goy = WorldController.map_draw_offset_y;

	var _grid_off_x_rem = _gox % _ts;
	var _grid_off_y_rem = _goy % _ts;

	var _mtx = floor((mouse_x - _gox) / _ts);
	var _mty = floor((mouse_y - _goy) / _ts);
	var _mwid = room_width / _ts;
	var _mhei = room_height / _ts;

	if (_mtx < 0 || _mty < 0 || _mtx > _mwid || _mty > _mhei || _clicked_in_popup_box || (_cond3 && (_clicked_in_popup_box || _cond2))) {
		sfx_play(sfxIncorrect);
		x = _mx;
		y = _my + 8;
		return;
	}

	grab = false;

	global.mouse_building = false;
	depth = HUD.depth - 1;

	sfx_play(sfxPlaceBuilding);

	var _tile_id = tile_type;
	ds_grid_set(WorldController.level_data, _mtx, _mty, _tile_id);

	// Remember the coordinates if this is a Fusion Building
	if (tile_type == TileTypes.FUNCTIONAL_FUSION) {
		var _this_fusion_house = instance_create_depth( - 50, -50, -50, FusionHouseData);
		ds_grid_set(WorldController.fusion_house_list, _mtx, _mty, _this_fusion_house);
	} else {
		// We replaced this tile with a non-fusion-building building. Delete and forget about this fusion house.
		var _this_fusion_house = ds_grid_get(WorldController.fusion_house_list, _mtx, _mty);

		show_debug_message(_this_fusion_house)
		if (_this_fusion_house != noone) {
			instance_destroy(_this_fusion_house);
			ds_grid_set(WorldController.fusion_house_list, _mtx, _mty, noone);
		}
	}

} else if (keyboard_check_pressed(vk_escape)) {
	grab = false;
	depth = HUD.depth - 1;
	global.mouse_building = false;
}

if (grab == false) exit;
else {
	x = _mx; // + xx;
	y = _my + 8; // + yy;
}