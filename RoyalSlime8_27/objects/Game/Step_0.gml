/// @description GameState Machine
switch(state) {
	
	case GameStates.MAIN_MENU:
	if !audio_is_playing(mscMainMenu) {
		audio_play_sound(mscMainMenu,10,true);
	}
	
	if !instance_exists(o_hub) {
		instance_create_depth(0,0,depth+1,o_hub);
	}
	
	if !instance_exists(o_button_descend) {
		instance_create_depth(0,155,depth,o_button_descend);
	}
	
	if !instance_exists(o_button_fusion) {
		instance_create_depth(105,155,depth,o_button_fusion);
	}
	
	if !instance_exists(o_button_slimes) {
		//instance_create_depth(215,155,depth-1,o_button_slimes);
		instance_create_depth(267,167,depth,o_button_slimes);
	}
	
	if !instance_exists(o_button_exit) {
		instance_create_depth(300,8,depth,o_button_exit);
	}
	
	if !instance_exists(o_cursor_test) {
		instance_create_depth(0,0,depth-5,o_cursor_test);
	}
	
	if !instance_exists(SettingsHoverZone) {
		instance_create_depth(300,40,depth,SettingsHoverZone);
	}
	
	if instance_exists(o_exit_confirmation_window) {
		if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_button_yes) {
			game_end();
		} else if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_button_no) {
			instance_destroy(o_exit_confirmation_window);
		}
	} else {
		if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_button_descend) {
			state =  GameStates.DESCEND;
		} else if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_button_fusion) {
			state =  GameStates.FUSION;
		} else if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_button_slimes) {
			state =  GameStates.SLIMES_MAIN_PAGE;
		}
	}
	/*if  position_meeting(mouse_x, mouse_y, o_hub) {
		state =  GameStates.INIT;
	} */
	break;
	
	case GameStates.DESCEND:
	if !instance_exists(o_descend_container) {
		instance_create_depth(0,0,depth+1,o_descend_container);
	}
	
	if !instance_exists(o_descend_container_hide) {
		instance_create_depth(0,0,depth-1,o_descend_container_hide);
	}
	
	if !instance_exists(o_descend_button_descend) {
		instance_create_depth(16,40,depth,o_descend_button_descend);
	}
	
	if !instance_exists(o_descend_button_party) {
		instance_create_depth(16,96,depth,o_descend_button_party);
	}
	
	if !instance_exists(o_controller) {
		instance_create_depth(0,0,depth,o_controller);
	}
	
	if !instance_exists(o_bar) {
		instance_create_depth(300,16+76,depth,o_bar);
	}
	
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_descend_button_descend) {
		state =  GameStates.INIT;
	}
	
	if !instance_exists(o_back) {
		instance_create_depth(15,155,depth,o_back);
	}
	
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_back) {
		state =  GameStates.MAIN_MENU;
	}
	break;
	
	case GameStates.FUSION:
	if !instance_exists(o_fusion_container) {
		instance_create_depth(0,0,depth+1,o_fusion_container);
	}
	
	if !instance_exists(o_fusion_window_fusion) {
		instance_create_depth(21,24,depth,o_fusion_window_fusion);
	}
	
	if !instance_exists(o_fusion_window_requirements) {
		instance_create_depth(169,17,depth,o_fusion_window_requirements);
	}
	
	if !instance_exists(o_fusion_window_materials) {
		instance_create_depth(166,70,depth,o_fusion_window_materials);
	}
	
	if !instance_exists(o_fusion_tab_1) {
		instance_create_depth(21,24,depth-1,o_fusion_tab_1);
	}
	
	if !instance_exists(o_fusion_tab_2) {
		instance_create_depth(21,24,depth-1,o_fusion_tab_2);
	}
	
	if !instance_exists(o_fusion_tab_3) {
		instance_create_depth(21,24,depth-1,o_fusion_tab_3);
	}
	
	if !instance_exists(o_back) {
		instance_create_depth(15,155,depth,o_back);
	}
	
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_back) {
		state =  GameStates.MAIN_MENU;
	}
	break;
	
	case GameStates.SLIMES_MAIN_PAGE:
	if !instance_exists(o_slimes_main_page_container) {
		instance_create_depth(0,0,depth+1,o_slimes_main_page_container);
	}
	
	if !instance_exists(o_slimes_main_page_button_inventory) {
		instance_create_depth(88,38,depth,o_slimes_main_page_button_inventory);
	}
	
	if !instance_exists(o_slimes_main_page_button_monsterpedia) {
		instance_create_depth(88,93,depth,o_slimes_main_page_button_monsterpedia);
	}
	
	if mouse_check_button(mb_left) and position_meeting(mouse_x, mouse_y, o_slimes_main_page_button_inventory) {
		state =  GameStates.SLIMES_INVENTORY;
	} 
	
	if mouse_check_button(mb_left) and position_meeting(mouse_x, mouse_y, o_slimes_main_page_button_monsterpedia) {
		state =  GameStates.SLIMES_MONSTERPEDIA;
	}
	
	if !instance_exists(o_back) {
		instance_create_depth(15,155,depth,o_back);
	}
	
	if mouse_check_button_pressed(mb_left) and position_meeting(mouse_x, mouse_y, o_back) {
		state =  GameStates.MAIN_MENU;
	}
	
	break;
	
	case GameStates.SLIMES_INVENTORY:
	if !instance_exists(o_slime_inventory_container) {
		instance_create_depth(0,0,depth+1,o_slime_inventory_container);
	}
	
	if !instance_exists(o_slime_inventory_window) {
		instance_create_depth(3,23,depth,o_slime_inventory_window);
	}
	
	if mouse_check_button(mb_left) and position_meeting(mouse_x, mouse_y, o_slime_inventory_window) {
		state =  GameStates.SLIMES_MAIN_PAGE;
	}
	break;
	
	case GameStates.SLIMES_MONSTERPEDIA:
	if !instance_exists(o_monsterpedia_container) {
		instance_create_depth(0,0,depth+1,o_monsterpedia_container);
	}
	
	if !instance_exists(o_monsterpedia_window) {
		instance_create_depth(5,19,depth,o_monsterpedia_window);
	}
	
	if mouse_check_button(mb_left) and position_meeting(mouse_x, mouse_y, o_monsterpedia_window) {
		state =  GameStates.SLIMES_MAIN_PAGE;
	}
	
	
	break;
	
	
	
	case GameStates.INIT:
		audio_stop_sound(mscMainMenu);
		
		instance_create_layer(0, 0, "UI", WorldController);
		cam = instance_create_layer(0, 0, "UI", Camera);
		/*icon_build = instance_create_layer(0, 0, "UI", IconBuild);
		icon_slime = instance_create_layer(0, 0, "UI", IconSlime);
		icon_resources = instance_create_layer(0, 0, "UI", IconResources);
		icon_slime_dex = instance_create_layer(0, 0, "UI", IconSlimeDex);
		icon_setting = instance_create_layer(0, 0, "UI", IconSetting);*/
		hud = instance_create_layer(0, 0, "UI", HUD);
		
		//clickable_arrow_up = noone;// instance_create_layer(0, 0, "UI", HUD_ClickableButton);
		//clickable_arrow_up.button_id = BUTTON_IDS.PARTY_UP_ARROW;
		
		clickable_arrow_down = noone;// instance_create_layer(0, 0, "UI", HUD_ClickableButton);
		clickable_party_new_button = instance_create_layer(0, 0, "UI", HUD_ClickableButton);
		clickable_party_new_button.sprite_index = Slime_PartyUI_Button_New;
		clickable_party_new_button.button_id = BUTTON_IDS.PARTY_NEW;
		clickable_party_delete_button = instance_create_layer(0, 0, "UI", HUD_ClickableButton);
		clickable_party_delete_button.sprite_index = Slime_PartyUI_Button_Del;
		clickable_party_delete_button.button_id = BUTTON_IDS.PARTY_DEL;
		clickable_party_rename_button = instance_create_layer(0, 0, "UI", HUD_ClickableButton);
		clickable_party_rename_button.sprite_index = Slime_PartyUI_Button_Rename;
		clickable_party_rename_button.button_id = BUTTON_IDS.PARTY_RENAME;
		//clickable_arrow_down.sprite_index = Slime_SlimeUI_ButtonDown;
		//clickable_arrow_down.button_id = BUTTON_IDS.PARTY_DOWN_ARROW;
		
		battle_con = instance_create_layer(0, 0, "UI", BattleController);
		battle_con.depth = hud.depth - 1;
		state = GameStates.GAMEPLAY;
		break;
	default:
	case GameStates.GAMEPLAY:
		break;
}

if (keyboard_check_pressed(ord("P")) && keyboard_check(vk_control))
	debug = !debug;

ticks++;