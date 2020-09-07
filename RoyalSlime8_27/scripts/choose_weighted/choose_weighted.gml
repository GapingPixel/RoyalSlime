/// @function choose_weighted(val1, weight, ...
/// @description Randomly picks a value based on a weighted percentage (out of 100)
function choose_weighted() {

	/*
		Example: choose_weighted("Result1", 20, "Result2", 50, "Result3", 30);
	
			- 20% Chance of returning string "Result1"
			- 50% Chance of returning string "Result2"
			- 30% Chance of returning string "Result3"
	*/


	var _i, _j, _total_chance, _rand;
	_total_chance = 0;

	for (_i = 1; _i < argument_count; _i += 2) {
		_total_chance += argument[_i];
	}

	_rand = random(_total_chance);

	for (_j = 0; _rand > 0; _j += 2) {
		_rand -= argument[_j + 1];
	}

	return argument[_j - 2];


}
