/// @function create_background_layer(parallax_x_speed, width, height, frame_count, ani_speed, sprite)
/// @description Creates and returns a background
/// @param {real} parallax_x_speed The speed that the background scrolls at, horizontally
/// @param {real} width The width of the background
/// @param {real} height The height of the background
/// @param {real} frame_count The number of animation frames that this background layer contains
/// @param {real} ani_speed The animation speed of this background
/// @param {real} sprite The sprite/texture that this background will use
function create_background_layer() {

	var _ds_list = ds_list_create();

	var _pxspd = argument[0];
	var _bkgw = argument[1];
	var _bkgh = argument[2];
	var _frames = argument[3];
	var _ani_speed = argument[4];
	var _sprite = argument[5];


	_ds_list[BKG_LAYER_DATA.PARALLAX_X_SPEED] = _pxspd;
	_ds_list[BKG_LAYER_DATA.BACKGROUND_WIDTH] = _bkgw;
	_ds_list[BKG_LAYER_DATA.BACKGROUND_HEIGHT] = _bkgh;
	_ds_list[BKG_LAYER_DATA.ANI_FRAME_COUNT] = _frames;
	_ds_list[BKG_LAYER_DATA.ANI_SPEED] = _ani_speed;
	_ds_list[BKG_LAYER_DATA.SPRITE] = _sprite;

	return _ds_list;


}
