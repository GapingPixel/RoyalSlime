/// @description Draw the world

draw_set_color(c_white);

// Define global map offsets
if (Camera.camera_mode == CamModes.REGULAR)
	map_draw_offset_x = 11*16;
else if (Camera.camera_mode == CamModes.WIDE)
	map_draw_offset_x = 0;

var _gox = map_draw_offset_x;
var _goy = map_draw_offset_y;

var _grid_off_x_rem = _gox % tile_size;
var _grid_off_y_rem = _goy % tile_size;

// Draw the floor layer first
var lay_id = layer_get_id("FloorTiles");
var map_id = layer_tilemap_get_id(lay_id);
draw_tilemap(map_id, _gox, _goy);


// Draw all the buildings

var _c = mouse_selection_color;

var _ts = tile_size;
var _mtx = floor(mouse_x / _ts);
var _mty = floor(mouse_y / _ts);

for (var _y = 0; _y < map_height; _y++) {
	for (var _x = 0; _x < map_width; _x++) {
		var _this_tile = ds_grid_get(level_data, _x, _y);
		if (_this_tile > 0) {
			if (_this_tile > TileTypes.MAX)
				_this_tile = TileTypes.MAX - 1;
			var _gfx = tile_gfx[_this_tile];
			draw_sprite(_gfx, 0, _x * _ts + 8 + _gox, _y * _ts + 16 + _goy);
		}
	}
}



// Draw the mouse tile border
var _c = WorldController.mouse_selection_color;
var _ts = WorldController.tile_size;
//deactivate for updated view
//draw_rectangle_color(_mtx * _ts + 1 + _grid_off_x_rem, _mty * _ts + 1 + _grid_off_y_rem, _mtx * _ts+14 + _grid_off_x_rem, _mty * _ts+14 + _grid_off_y_rem, _c,_c,_c,_c, true);
//draw_sprite(sprMouseTileHover, 0, _mtx * _ts + _grid_off_x_rem, _mty * _ts + _grid_off_y_rem);
/*
if (mouse_check_button_pressed(mb_left)) {
	var _tile_id = ds_grid_get(level_data, _mtx, _mty);
	if (_tile_id + 1 <= TileTypes.MAX - 1)
		_tile_id++;
	ds_grid_set(level_data, _mtx, _mty, _tile_id);
} else if (keyboard_check_pressed(vk_escape)) {
	var _tile_id = ds_grid_get(level_data, _mtx, _mty);
	if (_tile_id - 1 >= 0)
		_tile_id--;
	ds_grid_set(level_data, _mtx, _mty, _tile_id);
}*/


/*
draw_line_color(_mtx * _ts - 1, _mty * _ts, _mtx * _ts + 15, _mty * _ts, _c, _c);
draw_line_color(_mtx * _ts, _mty * _ts, _mtx * _ts, _mty * _ts + 15, _c, _c);
draw_line_color(_mtx * _ts + 15, _mty * _ts, _mtx * _ts + 15, _mty * _ts + 15, _c, _c);

draw_line_color(_mtx * _ts - 1, _mty * _ts + 15, _mtx * _ts + 15, _mty * _ts + 15, _c, _c);
*/



//draw_rectangle_color(_mtx * _ts, _mty * _ts, _mtx * _ts + 15, _mty * _ts + 15, _c, _c, _c, _c, false);
/*

for (var _y = 0; _y < map_height; _y++) {
	for (var _x = 0; _x < map_width; _x++) {
		var _off = 0;
		if (_y % 2 == 0)
			_off = 1;
		if (((_y * map_width) + _x + _off) % 2 == 0) {
			draw_set_color(c_white);
		} else {
			draw_set_color(c_red);
		}
		draw_rectangle(_x * tile_size, _y * tile_size, _x * tile_size +16, _y * tile_size+16, false);
	}
}