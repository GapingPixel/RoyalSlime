/// @description Clear any existing memory when the game ends
if (ds_exists(ds_digits, ds_type_list))
	ds_list_destroy(ds_digits);