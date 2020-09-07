/// @description Free the battle drawing surface and all created ds_lists()
if (surface_exists(surf))
	surface_free(surf);

ds_list_destroy(party_presets); // Party presets
ds_list_destroy(player_box);
ds_list_destroy(player_box_draggable); // Draggable slimes in the popup party preview HUD
ds_priority_destroy(turn_order);


// Defined in define_monster_data script (Material Requirements, Evolution chains
ds_list_destroy(evo_nodes);


destroy_background_info();