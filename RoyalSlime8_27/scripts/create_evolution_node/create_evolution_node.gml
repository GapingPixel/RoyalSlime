/// @function define_evolution_node(monster_index, monster_name, is_first_in_evolution, upgrade_list_array, ingredient_requirements_array)
/// @description Creates an evolution node to refer to whenever the game needs information about any particular evolution
/// @param {real} monster_index
/// @param {string} monster_name
/// @param {boolean} is_first_in_evolution
/// @param {array} upgrade_list_array
/// @param {array} ingredient_requirements_array
function create_evolution_node(argument0, argument1, argument2, argument3, argument4) {

	var _node = [argument0, argument1, argument2, argument3, argument4];

	return _node;


}
