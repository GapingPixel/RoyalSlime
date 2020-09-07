/// @description Insert description here
if (initialize_time > 0) {
	initialize_time--;
	exit;
}

// The offset coordinates relative to where this Fusion House popup should appear
var _ox = menu_pos_x;
var _oy = menu_pos_y;

// Grab the mouse's inputs
var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Finite State Machine for the Fusion Houses
switch (state) {
default:
case FusionHouseStates.INACTIVE:
	break;
case FusionHouseStates.MAIN_MENU:
	// 
	var _hover_states = FusionHoverStates.INACTIVE;
	if (point_in_rectangle(_mx, _my, 291, 8, 300, 17)) {
		_hover_states = FusionHoverStates.HOVER_CLOSE_BUTTON;
	} else if (point_in_rectangle(_mx, _my, 238, 69, 238 + 22, 69 + 17)) {
		_hover_states = FusionHoverStates.HOVER_ESSENCES_BUTTON;
	} else if (point_in_rectangle(_mx, _my, _ox + 13, _oy + 12, _ox + 92, _oy + 55)) {
		_hover_states = FusionHoverStates.HOVER_SLIME_SELECT_BUTTON;
	} else if (point_in_rectangle(_mx, _my, _ox + 25, _oy + 64, _ox + 40, _oy + 79 + 5)) {
		_hover_states = FusionHoverStates.HOVER_MATERIALS_BUTTON_1;
	} else if (point_in_rectangle(_mx, _my, _ox + 65, _oy + 64, _ox + 80, _oy + 79)) {
		_hover_states = FusionHoverStates.HOVER_MATERIALS_BUTTON_2;
	} else if (point_in_rectangle(_mx, _my, _ox + 30, _oy + 80, _ox + 79, _oy + 98)) {
		_hover_states = FusionHoverStates.HOVER_FUSE_BUTTON;
	}

	var _can_fuse = true;
	if (mouse_check_button_pressed(mb_left)) {
		switch (_hover_states) {
		default:

			break;
		case FusionHoverStates.HOVER_CLOSE_BUTTON:
			// We clicked the close button; Close the entire fusion window
			state = FusionHouseStates.INACTIVE;
			essences_window_open = false;
			essences_menu_off_y = 1;
			slime_select_window_open = false;
			slime_select_menu_off_y = 1;
			materials_2_window_open = false;
			materials_2_menu_off_y = 1;
			materials_1_window_open = false;
			materials_1_menu_off_y = 1;

			// Forget which slime was selected, too
			selected_slime_slot = 0;
			the_upgrading_slime = noone;
			break;
		case FusionHoverStates.HOVER_ESSENCES_BUTTON:
			essences_window_open = true;
			slime_select_menu_off_y = 1;
			slime_select_window_open = false;
			materials_2_window_open = false;
			materials_2_menu_off_y = 1;
			materials_1_window_open = false;
			materials_1_menu_off_y = 1;
			break;
		case FusionHoverStates.HOVER_MATERIALS_BUTTON_1:
			essences_window_open = false;
			essences_menu_off_y = 1;
			materials_2_window_open = false;
			materials_2_menu_off_y = 1;
			materials_1_window_open = true;
			slime_select_menu_off_y = 1;
			slime_select_window_open = false;
			break;
		case FusionHoverStates.HOVER_MATERIALS_BUTTON_2:
			essences_window_open = false;
			essences_menu_off_y = 1;
			materials_2_window_open = true;
			materials_1_window_open = false;
			materials_1_menu_off_y = 1;
			slime_select_menu_off_y = 1;
			slime_select_window_open = false;
			break;
		case FusionHoverStates.HOVER_SLIME_SELECT_BUTTON:
			essences_window_open = false;
			essences_menu_off_y = 1;
			materials_2_window_open = false;
			materials_2_menu_off_y = 1;
			materials_1_window_open = false;
			materials_1_menu_off_y = 1;
			slime_select_window_open = true;
			break;
		case FusionHoverStates.HOVER_FUSE_BUTTON:
			break;
		}

		// Reset the re-click cooldown timer
		click_cooldown = click_cooldown_refresh;

	} else if (keyboard_check_pressed(vk_escape)) {
		if (essences_window_open) {
			essences_window_open = false;
		} else if (slime_select_window_open) {
			slime_select_window_open = false;
		} else if (materials_1_window_open) {
			materials_1_window_open = false;
		} else if (materials_2_window_open) {
			materials_2_window_open = false;
		} else {
			state = FusionHouseStates.INACTIVE;
			selected_slime_slot = 0;
			the_upgrading_slime = noone;

		}
		essences_menu_off_y = 1;
		slime_select_menu_off_y = 1;
		essences_menu_off_y = 1;
		slime_select_menu_off_y = 1;
		materials_2_menu_off_y = 1;
		materials_1_menu_off_y = 1;
	}
	draw_sprite(Slime_FusionUI, 0, _ox, _oy);

	// Disallow fusing if we haven't selected a slime 
	if (the_upgrading_slime == noone || is_undefined(the_upgrading_slime)) _can_fuse = false;

	// Disallow fusing if we haven't met the item requirements yet
	if (upgrade_item_requirements_met) {
		_can_fuse = false;
	}

	if (_can_fuse) draw_sprite(Slime_FusionUI_Button_Fuse, 0, _ox + 30, _oy + 80);

	// Draw hover sprites, if applicable
	switch (_hover_states) {
	case FusionHoverStates.HOVER_CLOSE_BUTTON:
		break;
	case FusionHoverStates.HOVER_ESSENCES_BUTTON:
		draw_sprite(Slime_FusionUI_MatterSlot, 0, _ox + 44, _oy + 61);
		break;
	case FusionHoverStates.HOVER_MATERIALS_BUTTON_1:
		draw_sprite(Slime_FusionUI_MaterialSlot1_Selected, 0, _ox + 27, _oy + 80 - 17);
		break;
	case FusionHoverStates.HOVER_MATERIALS_BUTTON_2:
		draw_sprite(Slime_FusionUI_MaterialSlot2_Selected, 0, _ox + 67, _oy + 62);
		break;
	case FusionHoverStates.HOVER_SLIME_SELECT_BUTTON:
		draw_sprite(Slime_FusionUI_SelectSlime, 0, _ox + 44, _oy + 53);
		break;
	case FusionHoverStates.HOVER_FUSE_BUTTON:
		if (_can_fuse) {
			if (mouse_check_button(mb_left)) draw_sprite(Slime_FusionUI_Button_Fuse, 2, _ox + 30, _oy + 80);
			else draw_sprite(Slime_FusionUI_Button_Fuse, 1, _ox + 30, _oy + 80);
		}
		break;
	}

	// Draw the currently-equipped materials
	if (materials_1_equip_item_id >= 0) {
		draw_sprite(Materials_Sheet, materials_1_equip_item_id - 1, _ox + 27, _oy + 63);
		var _ds = HUD.inventory_materials;
		var _item_quantity = _ds[# 1, materials_1_ingredient_slot];
		draw_text_man(_ox + 27, _oy + 62, _item_quantity);
	}
	if (essences_equip_item_id >= 0) {
		var _spr = Essences_Sheet;

		if (essences_equip_slot_item_type == ITEM_TYPES.MATTER) _spr = Matter_Sheet;

		draw_sprite(_spr, essences_equip_item_id - 2, _ox + 47, _oy + 62);

		var _ds = HUD.inventory_essence_matter;
		var _item_quantity = _ds[# 1, essences_equip_slot];
		draw_text_man(_ox + 47, _oy + 62, _item_quantity);
	}

	if (materials_2_equip_item_id >= 0) {
		draw_sprite(Materials_Sheet, materials_2_equip_item_id - 1, _ox + 67, _oy + 63);
		var _ds = HUD.inventory_materials;
		var _item_quantity = _ds[# 1, materials_2_ingredient_slot];
		draw_text_man(_ox + 67, _oy + 62, _item_quantity);
	}

	// If a valid slime is selected, draw it on the window
	if (the_upgrading_slime != noone && !is_undefined(the_upgrading_slime)) {
		var _spr_idle = the_upgrading_slime.spr_idle;
		draw_sprite(_spr_idle, 0, _ox + 55, _oy + 57);

		// Figure out which forms we can upgrade to
		var _evo_node = BattleController.evo_nodes[| the_upgrading_slime.monster_id];
		var _evo_list = _evo_node[FORM_NODES.EVO_LIST]; // Grab the list of possible evolutions from this monster's information node
		var _size = array_length_1d(_evo_list);
		var _nxoff = 0;
		var _nyoff = -19;

		for (var _i = 0; _i < _size; _i++) { // For every single monster that this evolving monster can potentially upgrade to...
			var _this_evolution_id = _evo_list[_i]; // ... Figure out which monster ID we're handling in the list of evolutions

			var _this_evolution_node = BattleController.evo_nodes[| _this_evolution_id]; // Grab the node using the monster's ID
			var _upgrade_form_ingredients = _this_evolution_node[FORM_NODES.INGR_REQS]; // Get the ingredient requirements for the given node
			var _upgrade_icon_index = _this_evolution_id; // Get the icon to draw for this monster form
			// Draw the hover-able upgrade icon frames
			draw_sprite(Slime_FusionUI_Upgrade_Icon, 0, _ox + 8 + _nxoff, _oy + 32 + _nyoff);
			// Draw the monster icons within those icon frames
			draw_sprite(MonsterPortraitsLarge, _upgrade_icon_index, _ox + 8 + _nxoff, _oy + 32 + _nyoff);

			// Check if we're hovering over one of those squares
			if (point_in_rectangle(_mx, _my, _ox + 8 + _nxoff, _oy + 32 + _nyoff, _ox + 8 + 17 + _nxoff, _oy + 32 + 17 + _nyoff)) {
				// We're hovering over a square. Draw the ingredient requirements for that square
				draw_ingredient_requirements(_upgrade_form_ingredients, _mx, _my);

				if (mouse_check_button_pressed(mb_left)) {
					var _upgrade_name = _this_evolution_node[FORM_NODES.NAME];
					show_message("Upgrading to: " + _upgrade_name)
					the_upgrading_slime.monster_id = _this_evolution_node[FORM_NODES.FORM_ID]; // Change the slime's form to this new one
					with(the_upgrading_slime)
					update_monster_form(monster_id);
					exit;
				}
			}

			// Offset the draw values for each square
			if (_i % 2 == 0) _nxoff += 73;
			else {
				_nxoff = 0;
				_nyoff += 20;
			}
		}
	}

	if (slime_select_window_open) {
		draw_sprite(Slime_FusionUI_SelectSlime_Inventory, 0, _ox + 3, _oy + fusion_ui_height + slime_select_menu_off_y);

		// Draw all the slimes now
		var _pbox = BattleController.player_box;

		//var _this_slime = _pbox[| selected_party_slime_slot];
		var _size = ds_list_size(_pbox);
		var _dx = 0;
		var _dy = 0;
		for (var _i = 1; _i <= _size; _i++) {
			var _this_slime = _pbox[| _i - 1];
			var _form = _this_slime.monster_id;
			var _form_node = BattleController.evo_nodes[| _form];
			draw_sprite(MonsterPortraitsLarge, _form, _ox + 11 + _dx, 8 + _oy + _dy + fusion_ui_height + slime_select_menu_off_y);

			_dx += 16;
			if (_i % 5 == 0 && _i > 2) {
				_dx = 0;
				_dy += 16;
			}
		}

		// Figure out where the Inventory Select cursor should go, based on where the mouse is on the screen
		//_mx
		var _otx = _ox + 9;
		var _oty = 6 + _oy + fusion_ui_height + slime_select_menu_off_y;
		var _tx = floor(( - _otx + _mx) / 16);
		var _ty = floor(( - _oty + _my) / 16);

		// Only update the inventory position if it's in a valid spot
		if (_tx >= 0 && _ty >= 0 && _tx <= 4) {
			selected_slime_slot = (_ty * 5) + _tx;

			// This also means that we're only allowed to click on a slime if we're within this range
			if (mouse_check_button_pressed(mb_left)) {
				var _checking_slime = _pbox[| selected_slime_slot];
				if (!is_undefined(_checking_slime)) the_upgrading_slime = _checking_slime;
				essences_window_open = false;
				essences_menu_off_y = 1;
				slime_select_menu_off_y = 1;
				slime_select_window_open = false;
			}
		}

		var _sly = floor(selected_slime_slot / 5);
		var _slx = selected_slime_slot % 5;
		draw_sprite(Slime_FusionUI_SelectSlime_Inventory_Select, 0, _otx + (_slx * 16), _oty + (_sly * 16));
	}

	if (slime_select_window_open) {
		if (slime_select_menu_off_y > 0 && Game.ticks % 2 == 0) slime_select_menu_off_y--;
	}
	if (essences_window_open) {
		draw_sprite(Slime_FusionUI_MaterialSelect_Inventory, 0, _ox + 3, _oy + fusion_ui_height + essences_menu_off_y);
		if (essences_menu_off_y > 0 && Game.ticks % 2 == 0) essences_menu_off_y--;

		// Draw all the essences on the window, too
		var _ds = HUD.inventory_essence_matter;
		var _size = ds_grid_height(_ds);
		var _item_index = -1;
		var _spr = Materials_Sheet;
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_font(global.font);
		var _mat_ox = 0;
		var _mat_oy = 0;

		for (var _i = 0; _i < _size; _i++) {
			var _draw_this = false;

			_item_index = _ds[# 2, _i];

			var _item_quantity = _ds[# 1, _i];
			var _item_type = _ds[# 0, _i];

			// Unless we're handling matter, the image_index is the item index
			var _img_ind = _item_index;

			if (_item_type == ITEM_TYPES.ESSENCES) {
				_spr = Essences_Sheet;
				sprite_index = Essences_Sheet;
			} else {
				_spr = Matter_Sheet;
				sprite_index = Matter_Sheet;
			}
			mask_index = sprite_index;

			if (_item_type == ITEM_TYPES.MATTER) _img_ind -= LIST_ESSENCES.MAX;
			image_index = _img_ind - 1;

			draw_sprite(_spr, _img_ind - 1, 205 + _mat_ox, 95 + _mat_oy + essences_menu_off_y);
			draw_text_man(205 + _mat_ox, 95 + _mat_oy + essences_menu_off_y, _item_quantity);

			_mat_ox += 16;
			if ((_i + 1) % 5 == 0 && _i > 0) {
				_mat_ox = 0;
				_mat_oy += 16;
			}
		}

		// Mouse handling
		// Figure out where the Inventory Select cursor should go, based on where the mouse is on the screen
		//_mx
		var _otx = _ox + 3 + 8;
		var _oty = _oy + 8 + fusion_ui_height + essences_menu_off_y;
		var _tx = floor(( - _otx + _mx) / 16);
		var _ty = floor(( - _oty + _my) / 16);

		// Only update the inventory position if it's in a valid spot
		if (_tx >= 0 && _ty >= 0 && _tx <= 4) {

			//draw_rectangle(_tx*16, _ty*16, (_tx*16)+15, (_ty*16)+15, false);
			var _hovered_essence_slot = (_ty * 5) + _tx;

			// This also means that we're only allowed to click on a slime if we're within this range
			if (essence_window_click_cooldown <= 0) {
				if (mouse_check_button_pressed(mb_left)) {
					var _ds_height = ds_grid_height(_ds);
					if ((_hovered_essence_slot < _ds_height) && _hovered_essence_slot >= 0) { // Make sure that the slot we're selecting is a slot that exists
						essences_equip_slot = _hovered_essence_slot;
						essences_equip_item_id = _ds[# 2, _hovered_essence_slot];
						essences_equip_slot_item_type = _ds[# 0, _hovered_essence_slot];

						fusion_validation_check(id);
					}
				} else if (mouse_check_button_pressed(mb_right)) {
					// Right-clicking de-equips the item slot
					essences_equip_item_id = -1;
					essences_equip_slot_item_type = ITEM_TYPES.ESSENCES;
					fusion_validation_check(id);
				}
				/*
					essences_window_open = false;
					essences_menu_off_y = 1;
					
					essences_equip_slot = _ds[#  2, 0];
					essences_equip_slot_item_type = _ds[#  0, 0];

					essence_window_click_cooldown = click_cooldown_refresh;
					*/

				/*
					var _sly = floor(selected_essence_slot / 5);
					var _slx = selected_essence_slot % 5;
					*/
			}
		}
	} else {
		essence_window_click_cooldown = click_cooldown_refresh;
	}

	if (materials_1_window_open) {
		draw_sprite(Slime_FusionUI_MaterialSelect_Inventory, 0, _ox + 3, _oy + fusion_ui_height + materials_1_menu_off_y);
		if (materials_1_menu_off_y > 0 && Game.ticks % 2 == 0) materials_1_menu_off_y--;

		// Draw all the materials on the window, too
		var _ds = HUD.inventory_materials;
		var _size = ds_grid_height(_ds);
		var _item_index = -1;
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_font(global.font);
		var _mat_ox = 0;
		var _mat_oy = 0;
		for (var _i = 0; _i < _size; _i++) {
			var _draw_this = false;
			var _spr = Materials_Sheet;
			_item_index = _ds[# 2, _i];
			var _item_quantity = _ds[# 1, _i];
			var _img_ind = _item_index - 1;
			var _item_type = _ds[# 0, _i];

			draw_sprite(_spr, _img_ind, 205 + _mat_ox, 95 + _mat_oy + materials_1_menu_off_y);
			draw_text_man(205 + _mat_ox, 95 + _mat_oy + materials_1_menu_off_y, _item_quantity);

			_mat_ox += 16;
			if ((_i + 1) % 5 == 0 && _i > 0) {
				_mat_ox = 0;
				_mat_oy += 16;
			}
		}

		// Equip the selected Material that the user clicked on
		/*
			if (mouse_check_button_pressed(mb_left) && materials_1_menu_off_y == 0) { 
				materials_1_equip_slot = _ds[#  2, 0];
			}*/

		// Mouse handling
		// Figure out where the Inventory Select cursor should go, based on where the mouse is on the screen
		//_mx
		var _otx = _ox + 3 + 8;
		var _oty = _oy + 8 + fusion_ui_height + materials_1_menu_off_y;
		var _tx = floor(( - _otx + _mx) / 16);
		var _ty = floor(( - _oty + _my) / 16);

		// Only update the inventory position if it's in a valid spot
		if (_tx >= 0 && _ty >= 0 && _tx <= 4) {

			//draw_rectangle(_tx*16, _ty*16, (_tx*16)+15, (_ty*16)+15, false);
			var _hovered_material_slot = (_ty * 5) + _tx;

			// This also means that we're only allowed to click on a slime if we're within this range
			if (materials_1_click_cooldown <= 0) {
				if (mouse_check_button_pressed(mb_left)) {
					var _ds_height = ds_grid_height(_ds);
					if ((_hovered_material_slot < _ds_height) && _hovered_material_slot >= 0) { // Make sure that the slot we're selecting is a slot that exists
						if (_hovered_material_slot == materials_2_ingredient_slot) break;

						materials_1_ingredient_slot = _hovered_material_slot;
						materials_1_equip_item_id = _ds[# 2, _hovered_material_slot];

						// No need to check item type: they're all materials
						fusion_validation_check(id);
					}
				} else if (mouse_check_button_pressed(mb_right)) {
					// Right-clicking de-equips the item slot
					materials_1_equip_item_id = -1;
					materials_1_ingredient_slot = noone;
					fusion_validation_check(id);
				}

			}
		}

	} else if (!materials_2_window_open) {
		materials_1_click_cooldown = click_cooldown_refresh;
		delete_clickable_materials();
	} else {
		materials_1_click_cooldown = click_cooldown_refresh;
	}

	if (materials_2_window_open) {
		draw_sprite(Slime_FusionUI_MaterialSelect_Inventory, 0, _ox + 3, _oy + fusion_ui_height + materials_2_menu_off_y);
		if (materials_2_menu_off_y > 0 && Game.ticks % 2 == 0) materials_2_menu_off_y--;

		// Draw all the materials on the window, too
		var _ds = HUD.inventory_materials;
		var _size = ds_grid_height(_ds);
		var _item_index = -1;
		draw_set_color(c_white);
		draw_set_alpha(1);
		draw_set_font(global.font);
		var _mat_ox = 0;
		var _mat_oy = 0;
		for (var _i = 0; _i < _size; _i++) {
			var _draw_this = false;
			var _spr = Materials_Sheet;
			_item_index = _ds[# 2, _i];
			var _item_quantity = _ds[# 1, _i];
			var _img_ind = _item_index - 1;
			var _item_type = _ds[# 0, _i];

			draw_sprite(_spr, _img_ind, 205 + _mat_ox, 95 + _mat_oy + materials_2_menu_off_y);
			draw_text_man(205 + _mat_ox, 95 + _mat_oy + materials_2_menu_off_y, _item_quantity);

			_mat_ox += 16;
			if ((_i + 1) % 5 == 0 && _i > 0) {
				_mat_ox = 0;
				_mat_oy += 16;
			}
		}

		// Mouse handling
		// Figure out where the Inventory Select cursor should go, based on where the mouse is on the screen
		//_mx
		var _otx = _ox + 3 + 8;
		var _oty = _oy + 8 + fusion_ui_height + materials_2_menu_off_y;
		var _tx = floor(( - _otx + _mx) / 16);
		var _ty = floor(( - _oty + _my) / 16);

		// Only update the inventory position if it's in a valid spot
		if (_tx >= 0 && _ty >= 0 && _tx <= 4) {

			//draw_rectangle(_tx*16, _ty*16, (_tx*16)+15, (_ty*16)+15, false);
			var _hovered_material_slot = (_ty * 5) + _tx;

			// This also means that we're only allowed to click on a slime if we're within this range
			if (materials_2_click_cooldown <= 0) {
				if (mouse_check_button_pressed(mb_left)) {
					var _ds_height = ds_grid_height(_ds);
					if ((_hovered_material_slot < _ds_height) && _hovered_material_slot >= 0) { // Make sure that the slot we're selecting is a slot that exists
						if (_hovered_material_slot == materials_1_ingredient_slot) break;
						materials_2_ingredient_slot = _hovered_material_slot;
						materials_2_equip_item_id = _ds[# 2, _hovered_material_slot];
						fusion_validation_check(id);
						// No need to check item type: they're all materials
					}
				} else if (mouse_check_button_pressed(mb_right)) {
					// Right-clicking de-equips the item slot
					materials_2_equip_item_id = -1;
					materials_2_ingredient_slot = noone;
					fusion_validation_check(id);
				}

			}
		}

	} else if (!materials_1_window_open) {
		materials_2_click_cooldown = click_cooldown_refresh;
		delete_clickable_materials();
	} else {
		materials_2_click_cooldown = click_cooldown_refresh;
	}

	break;
}

if (click_cooldown > 0) click_cooldown--;
if (essence_window_click_cooldown > 0) essence_window_click_cooldown--;
if (materials_1_click_cooldown > 0) materials_1_click_cooldown--;
if (materials_2_click_cooldown > 0) materials_2_click_cooldown--;