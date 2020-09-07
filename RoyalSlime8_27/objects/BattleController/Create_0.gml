/// @description Initialize variables
define_background_data();

//surf = surface_create(176, 500);
surf = surface_create(320, 180);

image_speed = 0.12;

draw_offset_x = 0;
attack_cam_offset_x = 0;
attack_cam_offset_x_to = 0;

#macro attack_cam_offset_x_max 6
bg_scroll_speed = 0.12;

// Drawing progress bar/hotspot stuff
level_progress_width_pixels = 157;

// Background handling
//curr_bkg = ADV_BKGS.FORESAKEN_FOREST;

var _dungeon = dun_bkgs[| current_floor];
var _bkg_layers = _dungeon[| BKG_DAT.BKG_LAYER_LIST];
var _bkg_tiles = _dungeon[| BKG_DAT.TILE_LAYER_LIST];

//level_layout_layers = [_bkg_layers[| 0]];
//level_layout_tiles = [_bkg_tiles[| 1], _bkg_tiles[| 0], _bkg_tiles[| 2], _bkg_tiles[| 3], _bkg_tiles[| 4]];
level_layout_layers = [_bkg_layers[| 0], _bkg_layers[| 1], _bkg_layers[| 2]];
layer_ani_index = [0, 0, 0];
level_layout_tiles = [_bkg_tiles[| 0], _bkg_tiles[| 0], _bkg_tiles[| 0], _bkg_tiles[| 0], _bkg_tiles[| 0], _bkg_tiles[| 0], _bkg_tiles[| 0], _bkg_tiles[| 0], _bkg_tiles[| 0]];

//level_layout_tiles = [dun_scrs[1], dun_scrs[0]];
bkg_room_width = 176; // ?

screen_count = array_length_1d(level_layout_tiles);
level_length = (bkg_room_width * screen_count) - bkg_room_width;

slime_dungeon_progression = 0;
slime_move_rate = 3 * .9; //25;//30;
enum HOTSPOT_TYPES {
	START,
	HORDE,
	ITEM,
	CUTSCENE,
	END,
	MAX,
};

define_monster_data();

// Parties
player_box = ds_list_create();
player_box_draggable = ds_list_create();

// Slime boxes: Initiate a box of max_slime_capacity default slimes
max_slime_capacity = 30;

for (var _i = 0; _i < max_slime_capacity; _i++) {
	var _obj = instance_create_layer( - 64, -64, "Instances", ParentPlayer);
	player_box[| _i] = _obj;
}

var _member_count = max_slime_capacity;
for (var _i = 0; _i < _member_count; _i++) {
	var _this_draggable_slime = instance_create_layer( - 5, -5, "UI", HUD_DraggableSlime);
	_this_draggable_slime.my_slime_id = _i;
	player_box_draggable[| _i] = _this_draggable_slime;
}
player_box[| 0].monster_id =  MONSTERS.DRACO;
player_box[| 0].stat_agi = 100;
player_box[| 0].passives_list = [MON_PASSIVES.DRAGO_RANGED];
player_box[| 0].multi_hit = 3;
player_box[| 0].stat_level = 11;
player_box[| 0].my_name = "Danieru";
player_box[| 0].stat_type = MON_TYPES.WATER;
player_box[| 0].stat_class = MON_CLASSES.CLERIC;
player_box[| 0].rarity_type = MON_RARITIES.COMMON;
player_box[| 0].stat_base[MON_STATS.STR] = 99;
player_box[| 0].walk_sprite = Slime_Draco_Walk;

player_box[| 1].monster_id =  MONSTERS.DRACO;
player_box[| 1].stat_base[MON_STATS.AGI] = 90;
player_box[| 1].passives_list = [MON_PASSIVES.DRAGO_RANGED];
player_box[| 1].multi_hit = 2;
player_box[| 1].stat_level = 56;
player_box[| 1].my_name = "Mo";
player_box[| 1].stat_type = MON_TYPES.LIGHT;
player_box[| 1].stat_class = MON_CLASSES.DEFENDER;
player_box[| 1].rarity_type = MON_RARITIES.UNCOMMON;
player_box[| 1].stat_base[MON_STATS.STR] = 99;
player_box[| 1].walk_sprite = Slime_Draco_Walk;

player_box[| 2].stat_base[MON_STATS.AGI] = 80;
player_box[| 2].passives_list = [MON_PASSIVES.SLIME_MELEE, MON_PASSIVES.HIBERNATE];
player_box[| 2].stat_level = 22;
player_box[| 2].my_name = "Ichigo";
player_box[| 2].stat_type = MON_TYPES.NATURE;
player_box[| 2].stat_class = MON_CLASSES.FIGHTER;
player_box[| 2].rarity_type = MON_RARITIES.RARE;
player_box[| 2].stat_base[MON_STATS.STR] = 99;

player_box[| 3].stat_base[MON_STATS.AGI] = 70;
player_box[| 3].passives_list = [MON_PASSIVES.SLIME_MELEE, MON_PASSIVES.HASTY, MON_PASSIVES.MULTI_HIT];
player_box[| 3].stat_level = 85;
player_box[| 3].my_name = "hazeI";
player_box[| 3].stat_type = MON_TYPES.FIRE;
player_box[| 3].stat_class = MON_CLASSES.MAGE;
player_box[| 3].rarity_type = MON_RARITIES.LEGENDARY;
player_box[| 3].stat_base[MON_STATS.STR] = 99;

player_box[| 4].stat_base[MON_STATS.AGI] = 0;
player_box[| 4].stat_level = 90;
player_box[| 4].my_name = "Pix";
player_box[| 4].stat_type = MON_TYPES.DARK;
player_box[| 4].stat_class = MON_CLASSES.RANGER;
player_box[| 4].stat_base[MON_STATS.STR] = 99;

// Party Management
party_presets = ds_list_create();
party_preset_max_capacity = 30; // Can't have any more than this number of party presets
for (var _i = 15; _i > 0; _i--) {
	var _party_preset_slot;

	if (_i = 15) _party_preset_slot = ["S1", player_box[| 0], player_box[| 1], noone, noone, noone];
	else if (_i = 14) _party_preset_slot = ["S2", noone, player_box[| 14], noone, player_box[| 12], noone];
	else _party_preset_slot = ["S" + string(16 - _i), noone, noone, noone, noone, noone];

	ds_list_add(party_presets, _party_preset_slot);
}


// 5 Party Slots. The first 5 slimes we defined will be the default party members (-1 = not active)
player_party = [0, 1, 2, 3, 4];
party_member_count = array_length_1d(player_party);

// Position (and activate) the 5 active party members on the screen

// Battle positions
/*
enum PLAYER_BATTLE_POSITION_X {
	FIRST = 30,
	SECOND = 25,
	THIRD = 20,
	FOURTH = 58,
	FIFTH = 52
};

enum PLAYER_BATTLE_POSITION_Y {
	FIRST = 66,
	SECOND = 86,
	THIRD = 106,
	FOURTH = 76,
	FIFTH = 102
};

enum ENEMY_BATTLE_POSITION_X {
	FIRST = 117,
	SECOND = 123,
	THIRD = 145,
	FOURTH = 150,
	FIFTH = 155
};

enum ENEMY_BATTLE_POSITION_Y {
	FIRST = 76,
	SECOND = 102,
	THIRD = 66,
	FOURTH = 86,
	FIFTH = 106
};
*/
player_battle_position_x = [-28, -28, 27, 27, 65];
player_battle_position_y = [6, 55, 5, 55, 25];
//player_battle_position_x = [30, 25, 20, 58, 52];
//player_battle_position_y = [66, 86, 106, 76, 102];
//player_battle_position_x = [57-32, 57-32, 90-32, 90-32, 121-32];
/*player_battle_position_x = [-25, 100, 75, 138, 138];
player_battle_position_y = [75, 84, 140, 80, 140];*/
//player_battle_position_y = [80-12, 104-12, 80-12, 104-12, 91-12];
/*player_battle_position_x = [23, 45, 79, 112, 112];
player_battle_position_y = [137, 151, 142, 137, 151];*/

/*enemy_battle_position_x = [188, 188, 222, 255, 255];
enemy_battle_position_y = [77, 101, 92, 77, 101];*/
enemy_battle_position_x = [245, 248, 193, 193, 155];
enemy_battle_position_y = [5, 55, 5, 55, 25];

#macro attacking_distance_x 30
#macro lunge_time 15
#macro fade_rate 40 //15
#macro battle_transparent_value 0.33

/*
var _xoff = 0;
var _yoff = 0;
*/

for (var _i = 0; _i < party_member_count; _i++) {

	/// Set the party position offsets
	// First, get the current player party member
	var _player_slot_id = player_party[_i];
	var _this_player = player_box[| _player_slot_id];

	// assign them their correct fighter slot
	instance_activate_object(_this_player);

	var _xoff = player_battle_position_x[_i];
	var _yoff = player_battle_position_y[_i];
	with(_this_player) {
		fighter_slot = _i;
		x = _xoff;
		y = _yoff;
		x_off_to = _xoff;
		y_off_to = _yoff;
	}

	/*
	if (_i > 2)
		_xoff = 20;
	player_party_pos_x[_i] = 19 + _xoff;
	player_party_pos_y[_i] = 68+14 + _yoff;
	var _id = player_party[_i];
	var _this_player = player_box[| _id];
	
	instance_activate_object(_this_player);
	_this_player.x = player_party_pos_x[_i];
	_this_player.y = player_party_pos_y[_i];
	
	_yoff += 13;
	
	if (_i == 2)
		_yoff = 9;
	*/
}

// Enemy horde patterns
enemy_horde[0] = [MONSTERS.E_DRACO]; //[MONSTERS.E_DRACO, MONSTERS.E_SOOTSWINE, MONSTERS.E_DRACO];
enemy_horde[1] = [MONSTERS.E_DRACO, MONSTERS.E_PENKING, MONSTERS.E_SOOTSWINE];
enemy_horde[2] = [MONSTERS.E_DRACO, MONSTERS.E_DRACO, MONSTERS.E_PENKING];
enemy_horde[3] = [MONSTERS.E_PENKING, MONSTERS.E_DRACO, MONSTERS.E_PENKING];

// Init level hotspots
var _position = (level_length + bkg_room_width) / screen_count;
level_hotspots = [
_position, HOTSPOT_TYPES.HORDE, enemy_horde[0], _position * 2, HOTSPOT_TYPES.HORDE, enemy_horde[1], _position * 3, HOTSPOT_TYPES.HORDE, enemy_horde[2], _position * 4, HOTSPOT_TYPES.HORDE, enemy_horde[3]];

hotspots_travelled = 0;
progress_condition_met = false;
progress_condition_type = HOTSPOT_TYPES.START;
progression_wait_timer_value = 50;
progression_wait_timer = progression_wait_timer_value;

// Drawing battle stats
#macro color_player_hp 65280 // make_color_rgb(0,255,0)
#macro color_enemy_hp 16711680 // make_color_rgb(0,0,255)
#macro color_action_bar 255 // make_color_rgb(255,0,0)
// Turn-based code
enum TREK_STATES {
	START,
	MOVING,
	BATTLE_INIT,
	BATTLING,
	EVENT,
	MAX
};

state = TREK_STATES.START;

turn = 0;
turn_order = ds_queue_create();

#macro action_gauge_base_inc_rate 25
reset_player_action_bars = false; // reset player action bars after a battle
fighter_list = ds_list_create(); // all of the enemies/players involved in battle
total_fighters = 0;
current_turn_taker = noone;

// Depth sprite drawing order
bkg_draw_offset_x = 0;
ds_depthgrid = ds_grid_create(2, 1);

abort_battle = false; // Emergency flag to end the battle immediately
/*
instance_create_layer(117, 98, "Instances", EnemySlime);
instance_create_layer(BattleController.level_hotspots[1] -40, 98, "Instances", EnemyDrago);
instance_create_layer(BattleController.level_hotspots[2]-40, 98, "Instances", EnemyPenking);
instance_create_layer(BattleController.level_hotspots[2]+BattleController.bkg_room_width -40-15, 98-20, "Instances", EnemyDrago);
instance_create_layer(BattleController.level_hotspots[2]+BattleController.bkg_room_width -40, 98, "Instances", EnemyPenking);

*/
