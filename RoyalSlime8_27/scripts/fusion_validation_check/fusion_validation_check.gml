/// @function fusion_validation_check(fusion_house_object_id)
/// @description Determines whether or not a fusion is valid or not
/// @param {real} fusion_house_object_id
function fusion_validation_check() {

	// Figure out which items/slots are occupying this fusion house's popup window
	var _this_fusion_house = argument[0];
	var _essences_equip_slot = _this_fusion_house.essences_equip_slot;
	var _essences_equip_item_id = _this_fusion_house.essences_equip_item_id;
	var _essences_equip_slot_item_type = _this_fusion_house.essences_equip_slot_item_type;
	var _materials_1_ingredient_slot = _this_fusion_house.materials_1_ingredient_slot;
	var _materials_1_equip_item_id = _this_fusion_house.materials_1_equip_item_id;
	var _materials_2_ingredient_slot = _this_fusion_house.materials_2_ingredient_slot;
	var _materials_2_equip_item_id = _this_fusion_house.materials_2_equip_item_id;
	var _the_upgrading_slime = _this_fusion_house.the_upgrading_slime;

	// Reject the upgrade validation if we don't have a valid slime selected to upgrade to
	if (_the_upgrading_slime == noone || is_undefined(_the_upgrading_slime)) {
		upgrade_item_requirements_met = false;
		exit;
	}

	// Figure out which forms we can upgrade to
	var _evo_node = BattleController.evo_nodes[| _the_upgrading_slime.monster_id]; // Grab the node of the monster trying to evolve
	var _evo_list = _evo_node[FORM_NODES.EVO_LIST]; // Grab the list of possible evolutions from this monster's information node
	var _size = array_length_1d(_evo_list); // Figure out how many different evolutions this monster can upgrade to



	// TODO: Figure out how to best determine which fusions are available,
	// and then return the most-suitable evolution back to
	// the larger script to continue work on the Fusion Validation UI


	var _found_recipe = noone;
	for (var _i = 0; _i < _size; _i++) { // For every single monster that this evolving monster can potentially upgrade to...
		var _target_mon_id = _evo_list[_i];
	
		var _fusion_reqs_met = true; // Checks not only if we have all the ingredients equipped, but also that we have enough of that ingredient, too.
	
		var _target_evolution_node = BattleController.evo_nodes[| _target_mon_id]; // Grab the node using the monster's ID
		var _upgrade_form_ingredients = _target_evolution_node[FORM_NODES.INGR_REQS]; // Get the ingredient requirements for the given node
		var _ingredient_list_size = array_length_1d(_upgrade_form_ingredients);
	
		// Check each ingredient for this monster evolution. Reject if any of the ingredient requirements are not met
		show_debug_message("Requirements for " + _target_evolution_node[FORM_NODES.NAME] + ":");
	
		for (var _j = 0; _j < _ingredient_list_size; _j += 3) {
		
			var _this_ingr_type = _upgrade_form_ingredients[_j];
			var _this_ingr_index = _upgrade_form_ingredients[_j + 1];
			var _this_ingr_quantity = _upgrade_form_ingredients[_j + 2];
		
			show_debug_message(string(_this_ingr_type) + ", " + BattleController.str_materials[_this_ingr_index] + ", " + string(_this_ingr_quantity));
		
		
		}
	
		if (_fusion_reqs_met) {
			_found_recipe = _target_mon_id;
		}
		//upgrade_item_requirements_met
	
	
	
		//var _upgrade_icon_index = _target_mon_id; // Get the icon to draw for this monster form
		/*
	
		go through each ingredient, check if it's selected in the inventory, and check if we have enough of it
		if we catch that it's not in the inventory, or that we don't have enough, do not target this fusion.
		if no fusion is targeted, the fusion is invalid
	
	
		var _this_evolution_id = _evo_list[_i]; // ... Figure out which monster ID we're handling in the list of evolutions
				
		var _this_evolution_node = BattleController.evo_nodes[| _this_evolution_id]; // Grab the node using the monster's ID
		var _upgrade_form_ingredients = _this_evolution_node[FORM_NODES.INGR_REQS]; // Get the ingredient requirements for the given node
		var _upgrade_icon_index = _this_evolution_id; // Get the icon to draw for this monster form


		if (mouse_check_button_pressed(mb_left)) {
			var _upgrade_name = _this_evolution_node[FORM_NODES.NAME];
			show_message("Upgrading to: " + _upgrade_name)
			_the_upgrading_slime.monster_id = _this_evolution_node[FORM_NODES.FORM_ID]; // Change the slime's form to this new one
			with (_the_upgrading_slime)
				update_monster_form(monster_id);
			exit;
		}
		*/
	
	}

	upgrade_item_requirements_met = true;


}
