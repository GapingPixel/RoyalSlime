/// @function find_next_hotspot()
/// @description Finds the next hotspot destination during an Adventure Mode trek, and prepares the scene by the time the slimes travel to this new hotspot
function find_next_hotspot() {

	if ((hotspots_travelled * 3) >= array_length_1d(level_hotspots))
		progress_condition_type = HOTSPOT_TYPES.END;
	else
		progress_condition_type = level_hotspots[(hotspots_travelled * 3) + 1];

	switch(progress_condition_type) {
		case HOTSPOT_TYPES.HORDE:
			var _this_horde = level_hotspots[(hotspots_travelled * 3) + 2];
			var _lvl_pos = level_hotspots[(hotspots_travelled * 3)];
			var _hoard_size = array_length_1d(_this_horde);
		

			/*
			var _xoff = 0;
			var _yoff = 0;
			*/
		
			for (var _i = 0; _i < _hoard_size; _i++) {
				/*
				if (_i > 2)
					_xoff = 20;
				*/
			
				var _enemy_id = _this_horde[_i];
				var _this_enemy = instance_create_layer(0, 0, "Instances", ParentEnemy);
				set_monster_stats(_enemy_id, _this_enemy);
			
				var _x_pos = _lvl_pos + enemy_battle_position_x[_i];
				var _y_pos = enemy_battle_position_y[_i];
			
				with (_this_enemy) {
					fighter_slot = _i;
					x = _x_pos;
					y = _y_pos;
					x_off_to = _x_pos;
					y_off_to = _y_pos;
					/*
					x = _lvl_pos + 119 + _xoff;
					y = 84 + _yoff;
					*/
					if (_enemy_id == MONSTERS.SLIME_BASE)
						image_xscale = -1;
				}
			
				/*
				_yoff += 13;
	
				if (_i == 2)
					_yoff = 9;
				*/
			}
		
			break;
		case HOTSPOT_TYPES.ITEM:
		case HOTSPOT_TYPES.CUTSCENE:
		case HOTSPOT_TYPES.END:
			//show_message("This is the end of the Adventure Mode trek.");
			audio_play_sound(mscPartyWin,10,true);
			exit;
		default:
			break;
	}
	
	hotspots_travelled++;

	progress_condition_met = true;


}
