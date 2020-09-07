/// @description Init variables
map_width = room_width / 16;
map_height = room_height / 16;
tile_size = 16;
define_village_mode_tiles();

current_tile = TileTypes.EMPTY;
level_data = ds_grid_create(map_width, map_height);

fusion_house_list = ds_grid_create(map_width, map_height);
ds_grid_clear(fusion_house_list, noone);

mouse_selection_color = make_color_rgb(112, 172, 83);

// Offsetting the map drawing
map_draw_offset_x = 0;
map_draw_offset_y = 0;


// Basic world generation

var lay_id = layer_get_id("FloorTiles");
var map_id = layer_tilemap_get_id(lay_id);
//		var data = tilemap_get(map_id, 0, 0);

for (var _y = 0; _y < map_height; _y++) {
	for (var _x = 0; _x < map_width; _x++) {
		var _off = 0;
		if (_y % 2 == 0)
			_off = 1;
		if (((_y * map_width) + _x + _off) % 2 == 0) {
			tilemap_set(map_id, 1, _x, _y);
		} else {
			tilemap_set(map_id, 2, _x, _y);
		}
		
		ds_grid_set(level_data, _x, _y, 0);
		
		//draw_rectangle(_x * tile_size, _y * tile_size, _x * tile_size +16, _y * tile_size+16, false);
	}
}
