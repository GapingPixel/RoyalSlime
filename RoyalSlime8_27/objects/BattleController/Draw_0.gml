/// @description Draw the battle window
if (Camera.camera_mode != CamModes.REGULAR) exit;

var _vx = 0; //camera_get_view_x(view_camera[0]);
var _vy = 0; //camera_get_view_y(view_camera[0]);

if (!surface_exists(surf)) {
	surf = surface_create(320, 180);
} else {
	surface_set_target(surf);
	draw_clear_alpha(c_white, 1);
	gpu_set_colorwriteenable(true, true, true, false);

	var _lvsize = array_length_1d(level_layout_tiles);
	bkg_draw_offset_x = slime_dungeon_progression; //lerp(0, level_length - bkg_room_width, slime_dungeon_progression / level_length);
	var _c = c_red;

	// Make sure that the attack camera x offset never goes beyond its cap (8 pixels)
	//attack_cam_offset_x += (-keyboard_check(ord("A")) + keyboard_check(ord("D"))) * 3;
	attack_cam_offset_x = lerp(attack_cam_offset_x, attack_cam_offset_x_to, 9 / room_speed);
	attack_cam_offset_x = clamp(attack_cam_offset_x, -attack_cam_offset_x_max, attack_cam_offset_x_max);

	// Draw the left-most edge of the background
	var _cr = c_red;
	var _x1 = attack_cam_offset_x_max - bkg_draw_offset_x;
	var _y1 = 0;
	var _x2 = -bkg_draw_offset_x;
	var _y2 = 112;

	draw_rectangle_color(_x1, _y1, _x2, _y2, _cr, _cr, _cr, _cr, false);

	// Draw the right-most edge of the background
	_x1 = ((bkg_room_width * _lvsize) - (bkg_draw_offset_x)) - attack_cam_offset_x_max;
	_y1 = 0;
	_x2 = _x1 + attack_cam_offset_x_max;
	_y2 = 112;

	draw_rectangle_color(_x1, _y1, _x2, _y2, _cr, _cr, _cr, _cr, false);

	// Draw the animated background layers
	var _bkg_layer_count = array_length_1d(level_layout_layers);
	var _cam_x = camera_get_view_x(view_camera[0]);

	for (var _i = 0; _i < _bkg_layer_count; _i++) {
		var _layer = level_layout_layers[_i];
		/// @param {real} parallax_x_speed The speed that the background scrolls at, horizontally
		/// @param {real} width The width of the background
		/// @param {real} height The height of the background
		/// @param {real} frame_count The number of animation frames that this background layer contains
		/// @param {real} ani_speed The animation speed of this background
		/// @param {real} sprite The sprite/texture that this background will use
		var _parallax_x_speed = _layer[BKG_LAYER_DATA.PARALLAX_X_SPEED];
		var _bkg_width = _layer[BKG_LAYER_DATA.BACKGROUND_WIDTH];
		var _bkg_height = _layer[BKG_LAYER_DATA.BACKGROUND_HEIGHT];
		var _frames_max = _layer[BKG_LAYER_DATA.ANI_FRAME_COUNT];
		var _ani_spd = _layer[BKG_LAYER_DATA.ANI_SPEED];
		var _spr = _layer[BKG_LAYER_DATA.SPRITE];

		var _parallax_x_offset = floor(slime_dungeon_progression / _parallax_x_speed);

		image_speed = _ani_spd;

		layer_ani_index[_i] = (layer_ani_index[_i] + _ani_spd) % _frames_max;

		draw_sprite(_spr, layer_ani_index[_i], ((_bkg_width * 0) - (bkg_draw_offset_x)) + attack_cam_offset_x - _parallax_x_offset, 0);
	}
	/*
	_parallax_x_offset = floor(slime_dungeon_progression / 3);
	draw_sprite(Bkg_ForesakenForest_Layer0, layer_ani_index[0],  ((_bkg_width * 0) - (bkg_draw_offset_x )) + attack_cam_offset_x - _parallax_x_offset, 0);
	
	_parallax_x_offset = floor(slime_dungeon_progression / 5);
	draw_sprite(Bkg_ForesakenForest_Layer1, layer_ani_index[1],  ((_bkg_width * 0) - (bkg_draw_offset_x )) + attack_cam_offset_x - _parallax_x_offset, 0);
	
	_parallax_x_offset = floor(slime_dungeon_progression / 8);
	draw_sprite(Bkg_ForesakenForest_Layer2, layer_ani_index[2],  ((_bkg_width * 0) - (bkg_draw_offset_x )) + attack_cam_offset_x - _parallax_x_offset, 0);
	
	layer_ani_index[0] = (layer_ani_index[0] + 0.15) % 1;
	layer_ani_index[1] = (layer_ani_index[1] + 0.15) % 1;
	layer_ani_index[2] = (layer_ani_index[2] + 0.15) % 48;
	*/

	// Draw the animated background tiles
	var _bkg_tile_count = array_length_1d(level_layout_tiles);
	for (var _i = 0; _i < _bkg_tile_count; _i++) {
		var _tile = level_layout_tiles[_i];
		var _tw = _tile[TILE_LAYER_DATA.TILE_WIDTH];
		var _th = _tile[TILE_LAYER_DATA.TILE_HEIGHT];
		var _spd = _tile[TILE_LAYER_DATA.ANI_SPEED];
		var _frames = _tile[TILE_LAYER_DATA.ANI_FRAME_COUNT];
		var _spr = _tile[TILE_LAYER_DATA.SPRITE];

		image_speed = _spd;

		draw_sprite(_spr, -1, ((_tw * _i) - (bkg_draw_offset_x)) + attack_cam_offset_x, 0);
		//draw_line_color((bkg_room_width * _i) - (bkg_draw_offset_x ), 0, (bkg_room_width * _i) - (bkg_draw_offset_x), 170, _c, _c);
	}

	// Draw the battlefield entities (including players and enemies)
	// Resize depth grid
	var _num_inst = instance_number(ParentDepthObject);
	var _dgrid = ds_depthgrid;
	var _dgrid_height = ds_grid_height(_dgrid);

	if (_dgrid_height != _num_inst) ds_grid_resize(_dgrid, 2, _num_inst);

	// If instances are on the same y-axis, draw the one NOT attacking first
	for (var _yy = 0; _yy < _num_inst; _yy++) {
		var _this_inst = instance_find(ParentDepthObject, _yy);
		var _this_inst_y = _this_inst.y;

		if (_this_inst.object_index == ParentPlayer || _this_inst.object_index == ParentEnemy) {
			if (_this_inst.melee_state != MELEE_STATES.NO_MELEE) {
				_this_inst_y++;
			}
		} else if (_this_inst.object_index == BattleEffect) {
			if (!_this_inst.layer_behind_parent) _this_inst_y += 2000;
		}

		// Add each instance to the depth grid based on their (adjusted-or-not) y positions.
		_dgrid[#0, _yy] = _this_inst;
		_dgrid[#1, _yy] = _this_inst_y;

	}

	// Sort the grid in ascending order
	ds_grid_sort(_dgrid, 1, true);

	// Loop through the grid and draw all the instances' shadows

	var _this_inst;
	_yy = 0;
	var _bkg_atk_off_x = BattleController.attack_cam_offset_x+48;
	repeat(_num_inst) {
		// Pull out an id
		_this_inst = _dgrid[#0, _yy];
		var _bkg_off_x = BattleController.bkg_draw_offset_x+1;

		with(_this_inst) {
			var _floating_y = -74;

			if (_this_inst.object_index = ParentPlayer) _bkg_off_x = 0;
			else if (_this_inst.object_index = ParentEnemy) {
				//var _bkg_atk_off_x = BattleController.attack_cam_offset_x+88;
				//_bkg_off_x = 10;
				 _floating_y = -84;
				if (state == MON_STATES.ESSENCE) _floating_y = -84+img_yoff; // Negate the floating sine movement if a monster is in essence state
			}
			switch (shadow_size) {
			case MON_SHADOWS.NONE:
			default:
				break;
			case MON_SHADOWS.SMALL:
				draw_sprite(Shadow_Small, 0, x - _bkg_off_x + img_xoff + _bkg_atk_off_x, y + img_yoff - _floating_y);
				break;
			case MON_SHADOWS.MEDIUM:
				draw_sprite(Shadow_Medium, 0, x - _bkg_off_x + img_xoff + _bkg_atk_off_x, y + img_yoff - _floating_y);
				break;
			case MON_SHADOWS.BIG:
				draw_sprite(Shadow_Big, 0, x - _bkg_off_x + img_xoff + _bkg_atk_off_x, y + img_yoff - _floating_y);
				break;
			case MON_SHADOWS.MAX:
				draw_sprite(Shadow_Big, 0, x - _bkg_off_x + img_xoff + _bkg_atk_off_x, y + img_yoff - _floating_y);
				break;
			}
		}

		_yy++;
	}

	// Loop through the grid and draw all the instances
	var _this_inst;
	_yy = 0;
	repeat(_num_inst) {
		// Pull out an id
		_this_inst = _dgrid[#0, _yy];

		// Call each instances' draw event
		with(_this_inst) {
			event_perform(ev_draw, 0);
		}
		_yy++;
	}

	// Draw any battle digits
	_num_inst = instance_number(BattleDamageDigit);
	for (var _i = 0; _i < _num_inst; _i++) {
		var _this_digit = instance_find(BattleDamageDigit, _i);
		with(_this_digit)
		event_perform(ev_draw, 0);
	}

	// Draw progression bar
	
	//draw_line_color(8, 10, 134, 10, _c, _c);

	//draw_sprite(sprLevelProgressionBar, 0, 8, 10);
	draw_sprite(sprLevelProgressionBar, 0, 83, 7);
	draw_sprite(SprSlimeProgLeft, 0, 74, 3);
	draw_sprite(SprSlimeProgRight, 0, 242, 3);
	//draw_line_color(50, 13, 208, 13, _c, _c);
	draw_line_color(84, 9, 241, 9, _c, _c);
	
	var _len = array_length_1d(level_hotspots) / 3;
	var _x = 0;

	// Draw progression hotspots
	for (var _i = 0; _i < _len - 1; _i++) { // Draw all hotspots except the last (end) hotspot
		_x = (level_hotspots[_i * 3] / (level_length));
		clamp(_x, 0, 1);
		draw_sprite(sprBattleHotspot, 0, 85 + (_x * level_progress_width_pixels), 6);
		//draw_sprite(sprBattleHotspot, 0, 8 + (_x * level_progress_width_pixels), 9);
	}

	_x = (slime_dungeon_progression / level_length);
	clamp(_x, 0, 1);
	draw_sprite(sprSlimeBattleProgression, 0, 82 + (_x * level_progress_width_pixels), 5);
	//draw_sprite(sprSlimeBattleProgression, 0, 8 - 4 + (_x * level_progress_width_pixels), 10 - 2);

	// Draw the battle HUD
	draw_sprite(s_battle_window_container_1, 0, 2, 146);
	draw_sprite(s_battle_window_container_2, 0, 221, 146);
	// Background window
	//var _c = c_white
	//draw_rectangle_color(0, 131, 175, 165, _c, _c, _c, _c, false);
	//draw_rectangle_color(0, 120, 255, 155, _c, _c, _c, _c, false);

	// Players first
	_num_inst = array_length_1d(player_party); // instance_number(ParentPlayer);
	var _xoff = 0;
	var _yoff = 0;

	for (var _i = 0; _i < _num_inst; _i++) {
		var _this_player = player_box[| player_party[_i]]; //instance_find(ParentPlayer, _i);
		var _form = _this_player.monster_id;
		var _form_node = BattleController.evo_nodes[| _form];

		// Grabbing and calculating HP values
		var _hp_curr = _this_player.curr_hp;
		var _hp_max = _this_player.max_hp;
		var _percent = clamp(round((_hp_curr / _hp_max) * 100), 0, 100);
		_c = color_player_hp;
		
		
		var _surfoffx = 32;
		var _surfoffy = -12//12;
		switch (_i) {
			case 0:
			_xoff =  8;        //38-_surfoffx;
			_yoff = 149;//137-_surfoffy;
			break;
			
			case 1:
			_xoff = 8;//38-_surfoffx;
			_yoff = 163;//151-_surfoffy;
			break;
			
			case 2:
			_xoff = 38;//72-_surfoffx;
			_yoff = 149;//137-_surfoffy;
			break;
			
			case 3:
			_xoff = 38;//72-_surfoffx;
			_yoff = 163;//151-_surfoffy;
			break;
			
			case 4:
			_xoff = 68;//105-_surfoffx;
			_yoff = 156;//142-_surfoffy;
			break;
		}
		
		/*if (_i == 2) {
			_xoff = 36;
			_yoff = 6;
		}*/
		
		// Portrait
		var _mon_port_spr = MonsterPortraitsSmall;
		if (_hp_curr <= 0) _mon_port_spr = MonsterPortraitsSmall_Greyscale;
		draw_sprite(_mon_port_spr, _form, _xoff,  _yoff);
		draw_sprite(Battle_EmptySpace, 0, _xoff,  _yoff);
		/*draw_sprite(_mon_port_spr, _form, 8 + _xoff, 121 + _yoff);
		draw_sprite(Battle_EmptySpace, 0, 8 + _xoff, 121 + _yoff);*/

		// Drawing the HP bar
		var _hp_curr = _this_player.curr_hp;
		var _hp_max = _this_player.max_hp;
		var _percent = clamp(round((_hp_curr / _hp_max) * 100), 0, 100);
		_c = color_player_hp;

		//draw_healthbar(24 + _xoff, 124 + _yoff, 34 + _xoff, 124 + _yoff, _percent, _c, _c, _c, 0, false, false);
		draw_healthbar(16+ _xoff, 3 + _yoff, 26 + _xoff, 3 + _yoff, _percent, _c, _c, _c, 0, false, false);
		//draw_sprite(Battle_HP_Action, 0, 24 + _xoff, 123 + _yoff);
		draw_sprite(Battle_HP_Action, 0, 16 + _xoff, 2 + _yoff);
		// Action bar
		var _act_curr = _this_player.action_gauge_curr;
		var _act_max = _this_player.action_gauge_max;
		if (_this_player.turns_left > 0) _act_curr = _act_max; // Keep the bar full if this fighter has multi-hit passive moves left to perform
		_percent = clamp(round((_act_curr / _act_max) * 100), 0, 100);
		_c = color_action_bar;

		/*draw_healthbar(24 + _xoff, 129 + _yoff, 34 + _xoff, 129 + _yoff, _percent, _c, _c, _c, 0, false, false);
		draw_sprite(Battle_HP_Action, 0, 24 + _xoff, 123 + _yoff + 5);*/
		draw_healthbar(16 + _xoff, 8 + _yoff, 26 + _xoff, 8 + _yoff, _percent, _c, _c, _c, 0, false, false);
		draw_sprite(Battle_HP_Action, 0, 16 + _xoff, 2 + _yoff + 5);
		// Adjust positioning depending on how many players there are
		//_yoff += 17;

		/*if (_i == 2) {
			_xoff = 36;
			_yoff = 6;
		}*/
	}

	// Now, the enemies
	_num_inst = instance_number(ParentEnemy);
	//_xoff = 0;
	//_yoff = 0;

	// Only draw the Enemy HUD if we're in the battle state
	if (BattleController.state == TREK_STATES.BATTLING) {
		for (var _i = 0; _i < _num_inst; _i++) {
			var _this_enemy = instance_find(ParentEnemy, _i);

			if (_this_enemy.state == MON_STATES.INIT) // Don't draw the monster if they've just spawned into the world
			break;
			// Adjust positioning depending on how many enemies there are
			/*if (_i == 2) {
				_xoff += 36;
				_yoff = -6;
			}*/
			switch (_i) {
				case 0:
				_xoff = 286;
				_yoff = 149;
				break;
			
				case 1:
				_xoff = 286;
				_yoff = 163;
				break;
			
				case 2:
				_xoff = 255;
				_yoff = 149;
				break;
			
				case 3:
				_xoff = 255;
				_yoff = 163;
				break;
			
				case 4:
				_xoff = 225;
				_yoff = 156;
				break;
			}
			/*case 0:
				_xoff = 13;
				_yoff = 123-12;
				break;
			case 1:
				_xoff = 13;
				_yoff = 140-12;
				break;
			case 2:
				_xoff = 46;
				_yoff = 132-12;
				break;
			case 3:
				_xoff = 80;
				_yoff = 123-12;
				break;
			case 4:
				_xoff = 80;
				_yoff = 140-12;
				break;*/
			// Set the correct enemy portrait, or don't draw it at all (if undefined)
			var _form = _this_enemy.monster_id;
			var _form_node = BattleController.evo_nodes[| _form];

			// Get the enemy's HP
			var _hp_curr = _this_enemy.curr_hp;
			var _hp_max = _this_enemy.max_hp;

			// Determine the default position of the portrait box
			draw_set_color(c_white);
			var _port_box_x = _xoff;
			var _port_box_y = _yoff;
			//var _port_box_y = 127 + _yoff;

			if (_hp_curr > 0) // If it's alive, draw the enemy's portrait (we divide in half b/c the enemy portraits are exactly the same as the player ones, and the enemy forms are listed immediately after the player ones
			draw_sprite(MonsterPortraitsSmall, _form - MONSTERS.FORM_COUNT - 1, _port_box_x, _port_box_y);
			else { // If the enemy is dead, draw a blank portrait instead
				draw_sprite(MonsterPortraitsSmall_Greyscale, _form - MONSTERS.FORM_COUNT - 1, _port_box_x, _port_box_y);
				//draw_rectangle(_port_box_x, _port_box_y, _port_box_x + 12, _port_box_y + 12, false);
			}
			// Draw the empty battle space picture
			draw_sprite(Battle_EmptySpace, 0, _port_box_x, _port_box_y);

			// Draw the enemy's HP bar
			var _percent = clamp(round((_hp_curr / _hp_max) * 100), 0, 100);
			_c = color_enemy_hp;

			//draw_healthbar(121 + _xoff, 130 + _yoff, 131 + _xoff, 130 + _yoff, _percent, _c, _c, _c, 0, false, false);
			draw_healthbar(16 + _xoff, _yoff+3, 26 + _xoff, 3 + _yoff, _percent, _c, _c, _c, 0, false, false);
			draw_sprite(Battle_HP_Action, 0, 16 + _xoff, _yoff+2);
			//draw_sprite(Battle_HP_Action, 0, 121 + _xoff, 129 + _yoff);

			// Draw the enemy's Action bar
			var _act_curr = _this_enemy.action_gauge_curr;
			var _act_max = _this_enemy.action_gauge_max;
			if (_this_enemy.turns_left > 0) _act_curr = _act_max; // Keep the bar full if this fighter has multi-hit passive moves left to perform
			_percent = clamp(round((_act_curr / _act_max) * 100), 0, 100);
			_c = color_action_bar;

			draw_healthbar(16 + _xoff, 8 + _yoff , 26 + _xoff, _yoff + 8, _percent, _c, _c, _c, 0, false, false);
			draw_sprite(Battle_HP_Action, 0, 16 + _xoff, _yoff + 7);
			//draw_healthbar(121 + _xoff, 130 + _yoff + 5, 131 + _xoff, 130 + _yoff + 5, _percent, _c, _c, _c, 0, false, false);
			//draw_sprite(Battle_HP_Action, 0, 121 + _xoff, 129 + _yoff + 5);

			// Keep track of how many enemies' HUDs are supposed to draw on the screen and adjust positioning accordingly
			//_yoff += 17;
		}
	}

	var _player_slot_id = player_party[0];
	var _this_player = player_box[| 0];
	
	gpu_set_colorwriteenable(true, true, true, true);
	surface_reset_target();
}