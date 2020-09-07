/// @function define_evolution_nodes()
/// @description Creates the list of evolution nodes for every unique monster type, storing all their properties too (TODO: Move enemy stats/sprite/animation info to this table)
function define_evolution_nodes() {

	evo_nodes = ds_list_create();

	var _evo_list = [MONSTERS.DRACO, MONSTERS.DRAGODON]; // The possible evolutions that this node can upgrade to
	var _ingr_reqs = [ITEM_TYPES.MATERIALS, LIST_MATERIALS.AZURE_WING, 3]; // The ingredients required to perform this upgrade
	evo_nodes[| MONSTERS.SLIME_BASE] = create_evolution_node(MONSTERS.SLIME_BASE, "Regular Slime", true, _evo_list, _ingr_reqs);

	_evo_list = [MONSTERS.DRAGODON];
	_ingr_reqs = [ITEM_TYPES.MATERIALS, LIST_MATERIALS.GLACIAL_BEAK, 3,
				ITEM_TYPES.MATERIALS, LIST_MATERIALS.FROG_LEG, 77];
	evo_nodes[| MONSTERS.DRACO] = create_evolution_node(MONSTERS.DRACO, "Slime Drago", true, _evo_list, _ingr_reqs);

	_evo_list = noone;
	_ingr_reqs = [ITEM_TYPES.MATERIALS, LIST_MATERIALS.FROG_LEG, 3,
				ITEM_TYPES.MATERIALS, LIST_MATERIALS.AZURE_WING, 77];
	evo_nodes[| MONSTERS.DRAGODON] = create_evolution_node(MONSTERS.DRAGODON, "Slime Drago 2", true, _evo_list, _ingr_reqs);


	_evo_list = noone;
	_ingr_reqs = [ITEM_TYPES.ESSENCES, LIST_MATERIALS.NOTHING, 0];
	evo_nodes[| MONSTERS.E_DRACO] = create_evolution_node(MONSTERS.E_DRACO, "Drago", true, _evo_list, _ingr_reqs);


}
