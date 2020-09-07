/// @description Destroy data structures
ds_list_destroy(party_presets); // Party presets

ds_list_destroy(player_box); // Parties

ds_list_destroy(player_box_draggable); // Draggable slimes in the popup party preview HUD

ds_queue_destroy(turn_order);

ds_list_destroy(fighter_list); // all of the enemies/players involved in battle

ds_grid_destroy(ds_depthgrid);

ds_list_destroy(evo_nodes);

destroy_background_info();