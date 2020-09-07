/// @function get_ingredient_name(material_type, ingredient_index)
/// @description Returns the string name of a given item
/// @param {real} material_type
/// @param {real} ingredient_index
function get_ingredient_name() {

	var _mat_type = argument[0];
	var _index = argument[1];
	var _str = "";

	switch(_mat_type) {
		default:
		case ITEM_TYPES.ESSENCES:
			_str = BattleController.str_essences[_index];
			break;
		case ITEM_TYPES.MATERIALS:
			_str = BattleController.str_materials[_index];
			break;
		case ITEM_TYPES.MATTER:
			_str = BattleController.str_matter[_index];
			break;
		case ITEM_TYPES.RESOURCES:
			_str = BattleController.str_resources[_index];
			break;
	}

	return _str;


}
