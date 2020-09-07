/// @description Initialize variables

// The states for the Fusion House state machine
enum FusionHouseStates {
	INACTIVE,
	MAIN_MENU
};

enum FusionHoverStates {
	INACTIVE,
	HOVER_CLOSE_BUTTON,
	HOVER_SLIME_SELECT_BUTTON,
	HOVER_ESSENCES_BUTTON,
	HOVER_MATERIALS_BUTTON_1,
	HOVER_MATERIALS_BUTTON_2,
	HOVER_FUSE_BUTTON,
	MAX
};

state = FusionHouseStates.INACTIVE;

// Just in case we ever need to move the menu around, make its x/y relative
menu_pos_x = 194;//105.5;
menu_pos_y = 8;//38;

fusion_ui_height = 79;
essences_menu_off_y = 1;
essences_window_open = false;
materials_1_menu_off_y = 1;
materials_1_window_open = false;
materials_2_menu_off_y = 1;
materials_2_window_open = false;
slime_select_window_open = false;
slime_select_menu_off_y = 1;

selected_slime_slot = 0;
the_upgrading_slime = noone;
slime_drop_in_position = -20;

initialize_time = 0;

materials_1_ingredient_slot = noone;
materials_2_ingredient_slot = noone;

essences_equip_slot = noone;
essences_equip_item_id = -1;
essences_equip_slot_item_type = ITEM_TYPES.ESSENCES;

materials_1_equip_item_id = -1;
materials_2_equip_item_id = -1;

click_cooldown = 0;
essence_window_click_cooldown = 0;
materials_1_click_cooldown = 0;
materials_2_click_cooldown = 0;
click_cooldown_refresh = 3;

upgrade_item_requirements_met = false;