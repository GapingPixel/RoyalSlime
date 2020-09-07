/// @function draw_text_man(x, y, string)
/// @description Draws text manually, from right to left, with fa_left alignment, char by char
/// @param {real} x The x-position to draw this text at
/// @param {real} y The y-position to draw this text at
/// @param {string} string The string to display
function draw_text_man() {

	var _wtbl = Game.main_fnt_widths;
	var _full_width = _wtbl[? "full_char_width"];

	var _text_height = 9;

	var _dist = _wtbl[? "per_char"]; // The distance between each character (should be -1)
	var _space = _wtbl[? " "];

	var _x = argument[0];
	var _y = argument[1];
	var _str_in = string(argument[2]); // The input string

	// Figure out the total length of the string, in pixels, also accounting for the spacing between each character
	// This will allow us to more easily calculate the position of the entire string

	var _strs = string_split("\n", _str_in, true);
	var _str_arr_size = array_length_1d(_strs) - 1;

	for (var _s = 0; _s <= _str_arr_size; _s++) {
		// First, grab the line and count how long it is
		var _this_line = _strs[_s];	
		var _line_len = string_length(_this_line);
	
		// Draw this entire line, char by char
		var _total_line_dist = 0; // How long this line is so far (for left-alignment)
		for (var _i = 0; _i < _line_len; _i++) {
			var _this_char = string_char_at(_this_line, _i + 1);

			// Draw this char
			draw_text(_x + _total_line_dist, _y, _this_char);
		
			// Offset the x positioning of each character so that we can write each character backwards
			var _added_dist = (_wtbl[? _this_char] + _dist);
			_total_line_dist += _added_dist;
		}
	
		_y += _text_height;
	}


}
