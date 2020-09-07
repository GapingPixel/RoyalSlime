/// @description Drawing logic for the right-pane windows
var _cam = Camera.cam;
var _view_x = 0;//camera_get_view_x(_cam);
var _view_y = 0;//camera_get_view_y(_cam);
var _mrx = device_mouse_x_to_gui(0); //(mouse_x - camera_get_view_x(Camera.cam));
var _mry = device_mouse_y_to_gui(0);//(mouse_y - camera_get_view_y(Camera.cam));
draw_set_font(global.font);
draw_set_color(c_white);

if (Camera.camera_mode == CamModes.REGULAR)
	/*draw_sprite(battle_window_container_top, 0, 32, 12);
	draw_sprite(battle_window_container_bot, 0, 32, 131);*/
	/*draw_sprite(s_battle_window_container_1, 0, 2, 146);
	draw_sprite(s_battle_window_container_2, 0, 221, 146);*/
	//draw_sprite(MockUp_Updated, 0, 0, 0);


//draw_sprite(GUI_Border_5, 0, _view_x + 288 + 8, _view_y + 32);


switch(state) {
	case HUDStates.BUILD_WINDOW_OPEN:
		draw_sprite(Popup_Window, 0, _view_x + 245 + 7, _view_y + 26 - 1);
	
		with(ParentDraggable) {
			if (grab)
				draw_set_alpha(0.6);
			else
				draw_set_alpha(1);
			if (visible) {
				draw_sprite(icon_index, 0, x, y);
			}
		}
		draw_set_alpha(1);
		break;
	case HUDStates.PARTY_UI_OPEN:
		var _pbox = BattleController.player_box;
		var _presets = BattleController.party_presets;
		var _box_x_off = 111;
		var _box_y_off = 23;
		var _tx = (selected_party_slime_slot % 11);
		var _ty = floor(selected_party_slime_slot / 11);
		var _recx = _box_x_off + (_tx * 16);
		var _recy = _box_y_off + (_ty * 16);
		var _scrollbar_offset = 0;


		if (dragging_slime_id != noone || hovering_over_party_slime != noone) {
			var _this_slime_id = dragging_slime_id;
			if (hovering_over_party_slime != noone)
				var _this_slime_id = hovering_over_party_slime;
			
			draw_sprite(Slime_PartyUI, 1, _view_x + 8, _view_y + 16);
			var _c = c_red;
			draw_set_alpha(1);
		
			// Draw the slime UI box text
			draw_sprite(Slime_SlimeUI_Text, 0, 16, 104);
			
			// If the selected slime slot exists, draw the selected slime's stats
			var _this_slime = _pbox[| _this_slime_id.my_slime_id];
			if (!is_undefined(_this_slime)) {
				var _hp = floor(_this_slime.stat_base[MON_STATS.HP] + _this_slime.stat_class_bonus[MON_STATS.HP] + _this_slime.stat_rarity_bonus[MON_STATS.HP]);
				var _str = floor(_this_slime.stat_base[MON_STATS.STR] + _this_slime.stat_class_bonus[MON_STATS.STR] + _this_slime.stat_rarity_bonus[MON_STATS.STR]);
				var _mag = floor(_this_slime.stat_base[MON_STATS.MAG] + _this_slime.stat_class_bonus[MON_STATS.MAG] + _this_slime.stat_rarity_bonus[MON_STATS.MAG]);
				var _agi = floor(_this_slime.stat_base[MON_STATS.AGI] + _this_slime.stat_class_bonus[MON_STATS.AGI] + _this_slime.stat_rarity_bonus[MON_STATS.AGI]);
				var _def = floor(_this_slime.stat_base[MON_STATS.DEF] + _this_slime.stat_class_bonus[MON_STATS.DEF] + _this_slime.stat_rarity_bonus[MON_STATS.DEF]);
				var _mdef = floor(_this_slime.stat_base[MON_STATS.MDEF] + _this_slime.stat_class_bonus[MON_STATS.MDEF] + _this_slime.stat_rarity_bonus[MON_STATS.MDEF]);
				var _eva = floor(_this_slime.stat_base[MON_STATS.EVA] + _this_slime.stat_class_bonus[MON_STATS.EVA] + _this_slime.stat_rarity_bonus[MON_STATS.EVA]);
				var _dex = floor(_this_slime.stat_base[MON_STATS.DEX] + _this_slime.stat_class_bonus[MON_STATS.DEX] + _this_slime.stat_rarity_bonus[MON_STATS.DEX]);
				var _lvl = _this_slime.stat_level;
				var _name = _this_slime.my_name;
				var _class = _this_slime.stat_class;
				var _class_str = mon_class_to_string(_class);
				var _type = _this_slime.stat_type;
				var _type_str = mon_type_to_string(_type);
				var _xoff = 0;
				var _yoff = 0;
					
				draw_set_font(global.stats_font_active);
				draw_set_halign(fa_right);
				var _val = 0;
				for (var _i = 0; _i < 7; _i++) {
					if (_i == 4) {
						_xoff += 39;
						_yoff = 0;
					}
					switch (_i) {
						default:
						case 0:
							_val = _hp;
							break;
						case 1:
							_val = _str;
							break;
						case 2:
							_val = _mag;
							break;
						case 3:
							_val = _agi;
							break;
						case 4:
							_val = _def;
							break;
						case 5:
							_val = _mdef;
							break;
						case 6:
							_val = _eva;
							break;
						case 7:
							_val = _dex;
							break;
					}
						
					draw_text(44 + 4 + _xoff, 106 + _yoff, _val);
						
					_yoff += 10;
				}
					
				draw_set_font(global.font);
				draw_set_halign(fa_left);
				draw_text_man(16, 93, _name);
				draw_text_man(64+6, 85+8, "Lvl ");
				_lvl = 9999;
				draw_text_man(64+24-5, 85+8+2, string(_lvl));
				draw_text_man(20, 145, "Class");
					
				var _col = mon_class_to_color(_class);
				draw_set_color(_col);
				draw_text_man(50, 145, _class_str);
				draw_set_color(c_white);
			}
		} else {
				draw_sprite(Slime_PartyUI, 0, _view_x + 8, _view_y + 16);
				with (HUD_ClickableButton) {
					event_perform(ev_draw, 0);
				}
				with (party_ui_scrollbar) {
					x = 98;
					y = 97;
					event_perform(ev_draw, 0);
				}		
			// Draw the slime party slot previews to a surface
			var _this_party;
				
			if (!surface_exists(party_list_surface)) {
				party_list_surface = surface_create(79, 59);
			} else {
				surface_set_target(party_list_surface);
				draw_clear_alpha(c_white, 0);
				//gpu_set_colorwriteenable(true,true,true,true);
				var _party_preset_size = ds_list_size(_presets);
					
				for (var _i = 0; _i < _party_preset_size; _i++) {
					_this_party = _presets[| _i];
					var _party_name = _this_party[0];
						
						
					var _y_off = 2 + ((_i - editing_party_scroll_y_pos) * 10) - _scrollbar_offset;
						
					// Draw the line for this party preset slot
					draw_sprite(Slime_PartyUI_Underline, 0, 2, _y_off + 8);
						
					// Draw the individual small slime icons
					for (var _j = 1; _j <= 5; _j++) {
						var _this_party_slime = _this_party[_j];
							
						draw_sprite(SlimeIconSmall_001, 0, 31 + ((_j-1) * 9), _y_off);
						if (_this_party_slime != noone) {
							draw_sprite(SlimeIconSmall_001, 1, 31 + ((_j-1) * 9), _y_off);
						} else {
						}
					}
						
					// Draw the party name
					draw_text_man(2, _y_off, _party_name);
				}
					
				// Draw the cursor showing which party preset we're editing
				draw_sprite(Slime_SlimeUI_PartySelectionBox, 0, 0, -(((editing_party_scroll_y_pos - relative_party_selection) * 10) + editing_party_scroll_y_pos_scrollbar));//_view_y + (editing_party_scroll_y_pos * 10) + 96);
					
				//gpu_set_colorwriteenable(true,true,true,false);
				surface_reset_target();
			}
			// Draw the party surface now
			draw_surface(party_list_surface, 14, 96);		
		}
		
		// Draw the preview party itself
		_this_party = _presets[| relative_party_selection];
				
		for (var _i = 1; _i <= 5; _i++) {
			var _x_off = BattleController.player_battle_position_x[_i - 1];
			var _y_off = BattleController.player_battle_position_y[_i - 1];
					
			// Draw all the slime shadows
			draw_sprite(Shadow_Medium, 0, 18 + _x_off, _y_off - 26 - 3);
					
			// Only draw the slime itself if it exists
			var _this_slime = _this_party[_i];
			if (_this_slime != noone) {
				draw_sprite(Slime_Basic, preview_slime_img_index % preview_slime_img_max, 18 + _x_off, _y_off - 26 - 3);
			}
		}
				
		// Draw the right-click drop menu, if it exists
		if (instance_exists(HUD_RightClickMenu)) {
			with (HUD_RightClickMenu) {
				event_perform(ev_draw, 0);
			}
		}
				
		preview_slime_img_index += preview_slime_img_speed;

		
		// Regardless which tab we're in, draw all the slimes in the box
		//var _box_size = ds_list_size(_pbox);
		//var _box_x = 0;
		//var _box_y = 0;
		
		/*
		for (var _i = 0; _i < _box_size; _i++) {
			draw_sprite(LargeMonsterPreviewIcons, 0, _box_x_off +1 + (_box_x*16), _box_y_off +1+ (_box_y*16));
			
			_box_x++;
			if (_box_x % 11 == 0) {
				_box_x = 0;
				_box_y++
			}
		}*/
		var _box_x = 0;
		var _box_y = 0;
		
		var _slime_box_max = BattleController.max_slime_capacity;
		var _draw_not_dragging_slime = ds_list_create();
		var _draw_dragging_slime = ds_list_create();
		
		for (var _i = 0; _i < _slime_box_max; _i++) {
			var _this_draggable_slime = BattleController.player_box_draggable[| _i]; //instance_find(ParentDraggableSlime, _i);
			var _parallel_slime = BattleController.player_box[| _i];
			with (_this_draggable_slime) {
				monster_id = _parallel_slime.monster_id; // Make sure that this draggable slime's monster id matches the correct monster (so it draws the correct preview sprite)
				img_index = monster_id;
				//BattleController.player_box_draggable[| _i];
	
				if (dragging) {
					x = mouse_x - 8;//_mrx;
					y = mouse_y - 8;//_mry;
					ds_list_add(_draw_dragging_slime, id);
				} else {
					var _bx = _box_x_off + 1 + (_box_x*16);
					var _by = _box_y_off + 1 + (_box_y*16);
					x = _bx;
					y = _by;
					ds_list_add(_draw_not_dragging_slime, id);
				}
			}
			
			_box_x++;
			if (_box_x % 11 == 0) {
				_box_x = 0;
				_box_y++
			}
		}
		
		// Draw the non-dragging slimes first
		var _size = ds_list_size(_draw_not_dragging_slime);
		var _i = 0;
		repeat (_size) {
			var _this_slime = _draw_not_dragging_slime[| _i];
			with (_this_slime)
				event_perform(ev_draw, 0);
			_i++;
		}
		
		// Now, draw the dragging slimes
		_size = ds_list_size(_draw_dragging_slime);
		_i = 0;
		repeat (_size) {
			var _this_slime = _draw_dragging_slime[| _i];
			with (_this_slime)
				event_perform(ev_draw, 0);
			_i++;
		}
		
		// Forget the lists
		ds_list_destroy(_draw_dragging_slime);
		ds_list_destroy(_draw_not_dragging_slime);
		
		// Draw the slime selection box outline
		draw_sprite(Slime_SlimeUI_SelectionBox, 0, _recx, _recy);
		break;
	default:
		break;
}

/*
var _bx = _box_x_off + 1 + (_box_x*16);
var _by = _box_y_off + 1 + (_box_y*16);
x = _bx;
y = _by;
ds_list_add(_draw_not_dragging_slime, id);
					
draw_text_man(_bx, _by, _i + 1);
*/

if (state == HUDStates.PARTY_UI_OPEN) {
	if (slime_window_state == SLIME_WINDOW_STATES.PARTY_VIEWER) {
		var _presets = BattleController.party_presets;
		var _this_party = _presets[| relative_party_selection];
		var _slime_box_max = BattleController.max_slime_capacity;
		var _slime_box = BattleController.player_box;
		var _box_x_off = 111;
		var _box_y_off = 23;
		draw_set_color(c_white);

		for (var _i = 0; _i < _slime_box_max; _i++) {
			// Check every single slime.
			var _this_box_slime = _slime_box[| _i];
	
			// Determine if they're in the party we're editing or not
			for (var _j = 1; _j <= 5; _j++) {
				var _this_party_slime = _this_party[_j];
				if (_this_party_slime == _this_box_slime) {
					var _tx = (_i % 11);
					var _ty = floor(_i / 11);
					var _recx = _box_x_off + (_tx * 16);
					var _recy = _box_y_off + (_ty * 16);
		
					draw_text_man(_recx, _recy, _j);
				}
			}
		}
	}
}

with(ParentIcon) {
	draw_sprite(spr_index, 0, x, y);
}

with (FusionHouseData) {
	event_perform(ev_draw, 0);
}

// Draw the mouse itself
draw_sprite(sprMouseCursor, 0, _mrx, _mry);//_mrx / Camera.zoom, _mry / Camera.zoom);

