/// @function print_damage(x, y, dmg_amount)
/// @description Shows the damage dealt on a target fighter by spawning each digit one by one
/// @param {real} x The base x position to draw from
/// @param {real} y The base y position to draw from
/// @param {real} dmg_amount The numerical value to display on the screen
function print_damage() {

	// If damage is 0, we print "MISS" instead.

	var _x = argument[0];
	var _y = argument[1];
	var _dmg_amount = argument[2];
	var _ds_list = ds_list_create();
	var _miss = false;
	var _miss_text_spacing = [11, 4, 8, 8];

	Game.ds_digits = noone;

	if (_dmg_amount <= 0)
		_miss = true;

	if (!_miss)
		Game.ds_digits = get_digits(_dmg_amount);
	else {
		ds_list_add(_ds_list, "M");
		ds_list_add(_ds_list, "I");
		ds_list_add(_ds_list, "S");
		ds_list_add(_ds_list, "S");
		Game.ds_digits = _ds_list;
	}

	var _ds_digits = Game.ds_digits;
	var _ds_size = ds_list_size(_ds_digits);
	var _dmg_font_width = 6;
	var _dmg_font_padding = 0;
	var _buffer_time = 0;
	
	var _xoff = (_ds_size * _dmg_font_width) - 5;
	
	for (var _i = _ds_size - 1; _i >= 0; _i--) {
	
		if (!_miss) { // We did not miss the enemy. Print each digit backwards, from right to left
			var _dmg_digit = (_ds_digits[| _i]) % 10;
		
			var _inst = instance_create_layer(_x + _xoff, _y, "UI", BattleDamageDigit);
			_inst.digit_value = _dmg_digit;
			_inst.image_index = _dmg_digit;
			_inst.buffer_time = _buffer_time;
		
			_xoff -= (_dmg_font_width + _dmg_font_padding);
			_buffer_time += 2;
		} else { // Print the "MISS" text in backwards order, from right to left
			var _dmg_letter = _ds_digits[| _i];
			var _inst = instance_create_layer(_x + _xoff, _y, "UI", BattleDamageDigit);
			_inst.digit_value = _dmg_letter;
			_inst.image_index = _i;
			_inst.sprite_index = sprMissText;
			_inst.buffer_time = _buffer_time;
		
			_xoff -= _miss_text_spacing[_i];
			_buffer_time += 2;
		}
	}

	ds_list_destroy(_ds_list);
	displayed_damage = true;


}
