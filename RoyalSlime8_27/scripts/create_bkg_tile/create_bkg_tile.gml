/// @function create_bkg_tile(tile_width, tile_height, frame_count, ani_speed, sprite)
/// @description Creates and returns data regarding a single tile for a background
/// @param {real} tile_width The width of a single tile for this background
/// @param {real} tile_height The height of a single tile for this background
/// @param {real} frame_count The number of animation frames that this background layer contains
/// @param {real} ani_speed The animation speed of this background
/// @param {real} sprite The sprite/texture that this background will use
function create_bkg_tile() {

	var _ds_list = ds_list_create();

	var _tw = argument[0];
	var _th = argument[1];
	var _frames = argument[2];
	var _ani_speed = argument[3];
	var _sprite = argument[4];

	_ds_list[TILE_LAYER_DATA.TILE_WIDTH] = _tw;
	_ds_list[TILE_LAYER_DATA.TILE_HEIGHT] = _th;
	_ds_list[TILE_LAYER_DATA.ANI_FRAME_COUNT] = _frames;
	_ds_list[TILE_LAYER_DATA.ANI_SPEED] = _ani_speed;
	_ds_list[TILE_LAYER_DATA.SPRITE] = _sprite;

	return _ds_list;


}
