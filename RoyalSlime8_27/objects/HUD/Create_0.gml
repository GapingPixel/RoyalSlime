/// @description Initialize variables
enum HUDStates {
	NEUTRAL,
	BUILD_WINDOW_OPEN,
	PARTY_UI_OPEN,
	MAX
};

enum SLIME_WINDOW_STATES {
	SLIME_VIEWER,
	PARTY_VIEWER,
	MAX
};
state = HUDStates.NEUTRAL;
slime_window_state = SLIME_WINDOW_STATES.PARTY_VIEWER;
dragging_slime_timer = 0;

icon_bh1 = instance_create_layer(-50, -50, "UI", DraggableIcon_Hospital);
icon_bh2 = instance_create_layer(-50, -50, "UI", DraggableIcon_BuildingHouse2);
icon_bh3 = instance_create_layer(-50, -50, "UI", DraggableIcon_BuildingHouse1);
icon_bh4 = instance_create_layer(-50, -50, "UI", DraggableIcon_BuildingFusion);

party_ui_scrollbar = instance_create_layer(-50, -50, "UI", HUD_Scrollbar);

selected_party_slime_slot = 0; // The exact slime we're hovering over in the menu
editing_party_scroll_y_pos = 0; // The exact party of slimes we're hovering over in the menu (controlled by the UI arrow buttons)
editing_party_scroll_y_pos_scrollbar = y;

preview_slime_img_index = 0;
preview_slime_img_max = sprite_get_number(Slime_Basic);
preview_slime_img_speed = 0.2;
relative_party_selection = 0;

double_click_timer = 0;
double_click_window = 25;

right_click_menu = noone;

party_list_surface = surface_create(79, 59);
can_scroll_with_button_click = true; // Flag that checks if we're scrolling the party viewer window with the keyboard or not (to allow/prevent double-scrolling with the UI arrow buttons)

hovering_over_party_slime = noone;

var _icon_count = instance_number(ParentDraggable);
for (var _i = 0; _i < _icon_count; _i++) {
	var _this_icon = instance_find(ParentDraggable, _i);
	_this_icon.visible = false;
}

popup_juice_timer = 0;

// Vars for checking if a slime is being drag+dropped in the party UI viewer
dragging_slime = false; // Are we dragging a slime at the moment?
dragging_slime_id = noone; // Which slime is being dragged?

depth = Camera.depth - 1;

init_inventories();