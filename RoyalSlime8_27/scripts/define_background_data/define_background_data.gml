/// @function define_background_data()
/// @description Initialize and define all of the battle background data
function define_background_data() {

	enum ADV_BKGS { // Define adventure mode backgrounds
		TUTORIAL_DUNGEON,
		WINDY_WOODS,
		MAROON_MEADOW,
		FOREST,
		FORESAKEN_FOREST,
		TUFTED_TAIGA,
		PINE_PASSING,
		HIVE_HIDEOUT,
		GOLDEN_GORGE,
		CANDID_CATACOMB,
		MAX
	};

	enum BKG_DAT {
		BKG_LAYER_LIST,
		TILE_LAYER_LIST,
		MAX
	};

	// Define each background layers' properties in separate entries
	enum BKG_LAYER_DATA {
		PARALLAX_X_SPEED,
		BACKGROUND_WIDTH,
		BACKGROUND_HEIGHT,
		ANI_FRAME_COUNT,
		ANI_SPEED,
		SPRITE,
		MAX
	};

	enum TILE_LAYER_DATA {
		TILE_WIDTH,
		TILE_HEIGHT,
		ANI_FRAME_COUNT,
		ANI_SPEED,
		SPRITE,
		MAX
	};

	current_floor = global.selected_floor;
	//ADV_BKGS.GOLDEN_GORGE;
	// Create the master list of backgrounds
	dun_bkgs = ds_list_create();

	// Give each background their own metadata to read from
	var _size = ADV_BKGS.MAX - 1;

	for (var _i = 0; _i <= _size; _i++) {
		var _entry = ds_list_create();

		// Create a background layer list and then add it to the background info
		var _bkg_layer_list = ds_list_create();
		ds_list_add(_entry, _bkg_layer_list);
	
		// Create a tile layer list and then add it to the background info
		var _tile_layer_list = ds_list_create();
		ds_list_add(_entry, _tile_layer_list);
	
		dun_bkgs[| _i] = _entry;
	}


	// Start creating and assigning various background layers
	var _bkg_layer = create_background_layer(3, 3, 3, 3, 3, sprBlank);
	add_background_layers(dun_bkgs[| ADV_BKGS.TUTORIAL_DUNGEON], _bkg_layer, _bkg_layer);

	switch current_floor {
	
		case ADV_BKGS.WINDY_WOODS:
		
		//var _bkg_layer = create_background_layer(3, 3, 3, 3, 3, sprBlank);
		//var _bkg_layer_2 = create_background_layer(5, 3, 3, 1, 0.15, Bkg_WindyWoods_Layer1);
	//add_background_layers(dun_bkgs[| ADV_BKGS.TUTORIAL_DUNGEON], _bkg_layer, _bkg_layer);
		//_bkg_layer = create_background_layer(3, 3, 3, 64, 0.15, s_newbg);
		_bkg_layer = create_background_layer(3, 3, 3, 14, 0.10, s_tutorialDungeonLayer1);
		var _bkg_layer_2 = create_background_layer(3, 3, 3, 14, 0.15, s_tutorialDungeonLayer2);
		/*var _bkg_layer_2 = create_background_layer(5, 3, 3, 1, 0.15, Bkg_WindyWoods_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 48, 0.15, Bkg_WindyWoods_Layer2);
		var _bkg_layer_4 = create_background_layer(8, 3, 3, 48, 0.15, Bkg_WindyWoods_Layer3);*/
		//add_background_layers(dun_bkgs[| ADV_BKGS.WINDY_WOODS], _bkg_layer, _bkg_layer_2, _bkg_layer_3, _bkg_layer_4);
		add_background_layers(dun_bkgs[| ADV_BKGS.WINDY_WOODS], _bkg_layer,_bkg_layer_2,_bkg_layer);
		break;
	
		case ADV_BKGS.MAROON_MEADOW:
		_bkg_layer = create_background_layer(3, 3, 3, 96, 0.15, Bkg_MaroonMeadow_Layer0);
		var _bkg_layer_2 = create_background_layer(5, 3, 3, 96, 0.15, Bkg_MaroonMeadow_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 1, 0.15, Bkg_MaroonMeadow_Layer2);
		var _bkg_layer_4 = create_background_layer(8, 3, 3, 96, 0.15, Bkg_MaroonMeadow_Layer3);
		add_background_layers(dun_bkgs[| ADV_BKGS.MAROON_MEADOW], _bkg_layer, _bkg_layer_2, _bkg_layer_3, _bkg_layer_4);
		break;
	
		case ADV_BKGS.FOREST:
		_bkg_layer = create_background_layer(3, 3, 3, 8, 0.15, Bkg_Forest3_Layer0);
		var _bkg_layer_2 = create_background_layer(5, 3, 3, 1, 0.15, Bkg_Forest3_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 1, 0.15, Bkg_Forest3_Layer2);
		var _bkg_layer_4 = create_background_layer(8, 3, 3, 8, 0.15, Bkg_Forest3_Layer3);
		add_background_layers(dun_bkgs[| ADV_BKGS.FOREST], _bkg_layer, _bkg_layer_2, _bkg_layer_3, _bkg_layer_4);
		break;
	
		case ADV_BKGS.FORESAKEN_FOREST:
		_bkg_layer = create_background_layer(3, 3, 3, 1, 0.15, Bkg_ForesakenForest_Layer0);
		var _bkg_layer_2 = create_background_layer(5, 3, 3, 1, 0.15, Bkg_ForesakenForest_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 48, 0.15, Bkg_ForesakenForest_Layer2);
		add_background_layers(dun_bkgs[| ADV_BKGS.FORESAKEN_FOREST], _bkg_layer, _bkg_layer_2, _bkg_layer_3);
		break;
	
		case ADV_BKGS.TUFTED_TAIGA:
		_bkg_layer = create_background_layer(3, 3, 3, 64, 0.15, Bkg_TuftedTaiga_Layer0);
		var _bkg_layer_2 = create_background_layer(5, 3, 3, 1, 0.15, Bkg_TuftedTaiga_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 1, 0.15, Bkg_TuftedTaiga_Layer2);
		var _bkg_layer_4 = create_background_layer(8, 3, 3, 64, 0.15, Bkg_TuftedTaiga_Layer3);
		add_background_layers(dun_bkgs[| ADV_BKGS.TUFTED_TAIGA], _bkg_layer, _bkg_layer_2, _bkg_layer_3, _bkg_layer_4);
		break;
	
		case ADV_BKGS.PINE_PASSING:
		_bkg_layer = create_background_layer(3, 3, 3, 48, 0.15, Bkg_PinePassing_Layer0);
		var _bkg_layer_2 = create_background_layer(5, 3, 3, 1, 0.15, Bkg_PinePassing_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 1, 0.15, Bkg_PinePassing_Layer2);
		var _bkg_layer_4 = create_background_layer(8, 3, 3, 48, 0.15, Bkg_PinePassing_Layer3);
		add_background_layers(dun_bkgs[| ADV_BKGS.PINE_PASSING], _bkg_layer, _bkg_layer_2, _bkg_layer_3, _bkg_layer_4);
		break;
	
		case ADV_BKGS.HIVE_HIDEOUT:
		_bkg_layer = create_background_layer(3, 3, 3, 8, 0.15, Bkg_HiveHideout_Layer0);
		var _bkg_layer_2 = create_background_layer(5, 3, 3, 1, 0.15, Bkg_HiveHideout_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 8, 0.15, Bkg_HiveHideout_Layer2);
		add_background_layers(dun_bkgs[| ADV_BKGS.HIVE_HIDEOUT], _bkg_layer, _bkg_layer_2, _bkg_layer_3);
		break;
	
		case ADV_BKGS.GOLDEN_GORGE:
		_bkg_layer = create_background_layer(3, 3, 3, 2, 0.15, Bkg_GoldenGorge_Layer0);
		var _bkg_layer_2 = create_background_layer(5, 3, 3, 24, 0.15, Bkg_GoldenGorge_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 24, 0.15, Bkg_GoldenGorge_Layer2);
		add_background_layers(dun_bkgs[| ADV_BKGS.GOLDEN_GORGE], _bkg_layer, _bkg_layer_2, _bkg_layer_3);
		break;
	
		case ADV_BKGS.CANDID_CATACOMB:
		_bkg_layer = create_background_layer(3, 3, 3, 25, 0.15, Bkg_CandidCatacomb_Layer0);
		var _bkg_layer_2 = create_background_layer(5, 3, 3, 1, 0.15, Bkg_CandidCatacomb_Layer1);
		var _bkg_layer_3 = create_background_layer(8, 3, 3, 25, 0.15, Bkg_CandidCatacomb_Layer2);
		var _bkg_layer_4 = create_background_layer(8, 3, 3, 25, 0.15, Bkg_CandidCatacomb_Layer3);
		add_background_layers(dun_bkgs[| ADV_BKGS.TUFTED_TAIGA], _bkg_layer, _bkg_layer_2, _bkg_layer_3, _bkg_layer_4);
		break;
	}



	// Start creating and assigning various tile layers
	var _bkg_tile_1 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_1);
	var _bkg_tile_2 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_2);
	var _bkg_tile_3 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_3);
	var _bkg_tile_4 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_4);
	var _bkg_tile_5 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_5);
	var _bkg_tile_6 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_6);
	var _bkg_tile_7 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_7);
	var _bkg_tile_8 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_8);
	var _bkg_tile_9 = create_bkg_tile(176, 112, 3, 0.12, BGTile_DemonLordDungeon_9);
	add_tile_layers(dun_bkgs[| ADV_BKGS.TUTORIAL_DUNGEON], _bkg_tile_1, _bkg_tile_2, _bkg_tile_3, _bkg_tile_4, _bkg_tile_5, _bkg_tile_6, _bkg_tile_7, _bkg_tile_8, _bkg_tile_9);

	_bkg_tile_1 = create_bkg_tile(176, 112, 3, 0.12, sprBlank);
	add_tile_layers(dun_bkgs[| current_floor], _bkg_tile_1);

	/*
	var _tile_layer = create_tile_layer(ani_speed, );
	add_tile_layers();

	/*
	ds_list_add(dun_bkgs[| ADV_BKGS.TUTORIAL_DUNGEON], _bkg);

	dun_bkgs[| ADV_BKGS.TUTORIAL_DUNGEON] = ds_list_create();
	var _dun_tut = dun_bkgs[| ADV_BKGS.TUTORIAL_DUNGEON];



	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[| ADV_BKGS.TUTORIAL_DUNGEON] = BGTile_DemonLordDungeon_1;
	dun_scrs[0] = BGTile_DemonLordDungeon_1;
	dun_scrs[1] = BGTile_DemonLordDungeon_2;
	dun_scrs[2] = BGTile_DemonLordDungeon_3;
	dun_scrs[3] = BGTile_DemonLordDungeon_4;
	dun_scrs[4] = BGTile_DemonLordDungeon_5;
	dun_scrs[5] = BGTile_DemonLordDungeon_6;
	dun_scrs[6] = BGTile_DemonLordDungeon_7;
	dun_scrs[7] = BGTile_DemonLordDungeon_8;
	dun_scrs[8] = BGTile_DemonLordDungeon_9;

/* end define_background_data */
}
