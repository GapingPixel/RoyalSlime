/// @function define_village_mode_tiles()
/// @description The game's world-builder uses a tile-based system for mapping out the buildings. This script defines those tiles, and the graphics they should be using, too.
function define_village_mode_tiles() {

	enum TileTypes {
		EMPTY,
		FUNCTIONAL_FUSION,
		FUNCTIONAL_HEAL,
		HOUSE_1,
		HOUSE_2,
		HOUSE_3,
		HOUSE_4,
		DECOR_PATH_DOWN_LEFT,
		DECOR_PATH_DOWN_LEFTRIGHT,
		DECOR_PATH_DOWNRIGHT,
		DECOR_PATH_LEFTRIGHT,
		DECOR_PATH_NEUTRAL,
		DECOR_PATH_UPDOWN,
		DECOR_PATH_UPDOWNLEFT,
		DECOR_PATH_UPDOWNLEFTRIGHT,
		DECOR_PATH_UPDOWNRIGHT,
		DECOR_PATH_UPLEFT,
		DECOR_PATH_UPLEFTRIGHT,
		DECOR_PATH_UPRIGHT,
		MAX
	};

	tile_gfx[TileTypes.EMPTY] = sprBlank;
	tile_gfx[TileTypes.FUNCTIONAL_FUSION] = SlimeFactory;
	tile_gfx[TileTypes.FUNCTIONAL_HEAL] = Hospital;
	tile_gfx[TileTypes.HOUSE_1] = House;
	tile_gfx[TileTypes.DECOR_PATH_DOWN_LEFT] = Building_Decor_Path_DownLeft;
	tile_gfx[TileTypes.DECOR_PATH_DOWN_LEFTRIGHT] = Building_Decor_Path_DownLeftRight;
	tile_gfx[TileTypes.DECOR_PATH_DOWNRIGHT] = Building_Decor_Path_DownRight;
	tile_gfx[TileTypes.DECOR_PATH_LEFTRIGHT] = Building_Decor_Path_LeftRight;
	tile_gfx[TileTypes.DECOR_PATH_NEUTRAL] = Building_Decor_Path_Neutral;
	tile_gfx[TileTypes.DECOR_PATH_UPDOWN] = Building_Decor_Path_UpDown;
	tile_gfx[TileTypes.DECOR_PATH_UPDOWNLEFT] = Building_Decor_Path_UpDownLeft;
	tile_gfx[TileTypes.DECOR_PATH_UPDOWNLEFTRIGHT] = Building_Decor_Path_UpDownLeftRight;
	tile_gfx[TileTypes.DECOR_PATH_UPDOWNRIGHT] = Building_Decor_Path_UpDownRight;
	tile_gfx[TileTypes.DECOR_PATH_UPLEFT] = Building_Decor_Path_UpLeft;
	tile_gfx[TileTypes.DECOR_PATH_UPLEFTRIGHT] = Building_Decor_Path_UpLeftRight;
	tile_gfx[TileTypes.DECOR_PATH_UPRIGHT] = Building_Decor_Path_UpRight;


}
