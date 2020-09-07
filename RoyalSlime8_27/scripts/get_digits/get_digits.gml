/// @function get_digits(int_value)
/// @description This script will take an integer value for input, and then output a ds_list containing all the digits contained within that number. Ignores leading zeroes
/// @param {real} int_value The input number to grab digits from
function get_digits() {

	// Example:
	// Input integer: 000002580
	// Output ds_list: [2, 5, 8, 0]

	// For instance, this script is used to display on-screen how much damage was dealt during an attack in battle. (If <= 0, it just prints "MISS" instead of running this script)

	var _in_num = argument[0];
	var _stack = ds_stack_create();

	var _ds_list = Game.ds_digits;

	if (ds_exists(_ds_list, ds_type_list))
		ds_list_clear(_ds_list);
	else
		_ds_list = ds_list_create();

	var _digit = 0;
	while (_in_num > 0) {
		_digit = floor(_in_num % 10);	
		ds_stack_push(_stack, _digit);
	    _in_num /= 10;
	}

	var _leading_zeros = true;

	while (!ds_stack_empty(_stack)) {
		_digit = ds_stack_pop(_stack);
	
		if (_leading_zeros) {
			if (_digit != 0) {
				_leading_zeros = false;
			}
		}
	
		if (!_leading_zeros) {
			ds_list_add(_ds_list, _digit);
		}
	}

	ds_stack_destroy(_stack);

	// Return the digits as a ds_list so we can store it in Game.ds_digits.
	return _ds_list;


}
