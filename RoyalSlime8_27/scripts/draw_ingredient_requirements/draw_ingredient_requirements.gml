/// @function draw_ingredient_requirements(upgrade_form_requirements, mouse_x, mouse_y)
/// @description Displays the required ingredients for an evolution upgrade
/// @param {real} upgrade_form_requirements The array containing the list of ingredients required to upgrade to this evolution form
/// @param {real} mouse_x The mouse's x-position
/// @param {real} mouse_y The mouse's y-position
function draw_ingredient_requirements(argument0, argument1, argument2) {

	var _form_reqs_list = argument0;
	var _x = argument1;
	var _y = argument2;
	var _bw = 64;
	var _bh = (10*3) + 4;
	var _o9x = -45;
	var _o9y = -_bh+6;

	draw_nineslice(Slime_FusionUI_9Slice, _x+_o9x, _y+_o9y, _x+_bw+_o9x, _y+_bh+_o9y);

	var _size = array_length_1d(_form_reqs_list);

	for (var _i = 0; _i < _size; _i += 3) {
	
		// Figure out what kind of material type we're working with
		var _mat_type = _form_reqs_list[_i];
	
		// Get the index of the item we are trying to display
		var _index = _form_reqs_list[_i + 1];
	
		// Get the quantity of the item we are trying to display
		var _quantity = _form_reqs_list[_i + 2];
	
		// Find the correct item and then store it into the string
	
		var _s = get_ingredient_name(_mat_type, _index) + " x" + string(_quantity);
	
		draw_text_man(_x+_o9x, (_y+_o9y) + (_i * 4), _s);
	}



}
